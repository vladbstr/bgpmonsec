from .connections import database_connection
from datetime import datetime
import paramiko
from django.views.decorators.http import require_GET
from django.http import JsonResponse
import re
from django.http import JsonResponse
from django.utils.dateparse import parse_datetime
from datetime import datetime, timedelta
import paramiko
import time

conn = database_connection()

def get_memory_usage(output):
    total_memory = 0
    used_memory = 0

    for line in output.splitlines():
        if 'Processor Pool Total' in line:
            #print(line)
            match = re.search(r'Processor Pool Total:\s+(\d+)\s+Used:\s+(\d+)\s+Free:', line)
            if match:
                total_memory = int(match.group(1))
                used_memory = int(match.group(2))
                break

    used_percentage = (used_memory / total_memory) * 100 if total_memory else 0
    return f"{used_memory / (1024*1024):.2f}MB/{total_memory / (1024*1024):.2f}MB : {used_percentage:.2f}%"


def get_cpu_usage(output):
    cpu_usage = 0
    ##print(output)
    for line in output.splitlines():
        if 'CPU utilization' in line:
            
            match = re.search(r'CPU utilization for five seconds: (\d+)%', line)
            if match:
                cpu_usage = int(match.group(1))
                break

    return f"{cpu_usage}%"




def get_router_info_cpu_mem(ip, username, password):
    
    try:
        # Creează un obiect SSHClient
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
        # Conectează-te la router
        ssh.connect(ip, username=username, password=password)
        
        # Invoke shell
        chan = ssh.invoke_shell()
        
        # Dezactivează paginarea
        chan.send('terminal length 0\n')
        time.sleep(1)
        chan.recv(9999)
        
        # Execuție comanda pentru memorie
        chan.send('show processes memory\n')
        time.sleep(2)
        memory_output = chan.recv(999999).decode('ascii')
        ##print(get_memory_usage(memory_output))
        mem=get_memory_usage(memory_output)

        # Execuție comanda pentru CPU
        chan.send('show processes cpu\n')
        time.sleep(2)
        cpu_output = chan.recv(9999999).decode('ascii')
        cpu = get_cpu_usage(cpu_output)
        #print(get_cpu_usage(cpu_output))
        # Închide sesiunea SSH
        ssh.close()
        
        return [mem, cpu]
    except Exception as e:
        #print(f"An error occurred: {e}")
        return 501


def get_router_info_cpu_mem_spec_router_id(router_id):
    sst_timestamp = datetime.now()
    cursor = conn.cursor()
    cursor.execute('SELECT "IP", username, password, r_state FROM public."ROUTERS_INPUT" WHERE router_id=%s', (router_id,))
    router_ssh_details = cursor.fetchall()

    state = router_ssh_details[0][3]
    if state == 'active':
        ip = router_ssh_details[0][0]
        username = router_ssh_details[0][1]
        password = router_ssh_details[0][2]
        memory_info, cpu_info = get_router_info_cpu_mem(ip, username, password)
        if memory_info and cpu_info:
            cursor.execute('INSERT INTO bgpmonsec_project.router_cpu_memory (router_id, cpu, memory,timestamp) VALUES (%s, %s, %s, %s)',
                            (router_id, cpu_info, memory_info,sst_timestamp))
            conn.commit()
            return 200
    else:
        return 'r_inactive'


def get_router_info_cpu_mem_spec_all_routers():
    sst_timestamp = datetime.now()
    cursor = conn.cursor()
    cursor.execute('SELECT router_id, "IP", username, password, r_state FROM public."ROUTERS_INPUT"')
    
    router_ssh_details = cursor.fetchall()
    #print(router_ssh_details)
    try:
        for router_ssh_detail in router_ssh_details:
            
            router_id = router_ssh_detail[0]
            ip = router_ssh_detail[1]
            username = router_ssh_detail[2]
            password = router_ssh_detail[3]
            state =  router_ssh_detail[4]
            if state == 'active':
                memory_info, cpu_info = get_router_info_cpu_mem(ip, username, password)
                if memory_info and cpu_info:
                    cursor.execute('INSERT INTO bgpmonsec_project.router_cpu_memory (router_id, cpu, memory,timestamp) VALUES (%s, %s, %s, %s)',
                                (router_id, cpu_info, memory_info,sst_timestamp))
                    conn.commit()
        return 200
            
    except Exception as e:
        #print(f"An error occurred: {e}")
        return 501

def extract_memory_percentage(memory_str):
    match = re.search(r'(\d+\.\d+)%', memory_str)
    if match:
        return match.group(1)
    return None

def extract_cpu_percentage(cpu_str):
    match = re.search(r'(\d+)%', cpu_str)
    if match:
        return int(match.group(1))
    return None

def get_router_stats(request, router_id):
    print('a ajuns aici')
    cursor = conn.cursor()

    end_time = datetime.now()
    start_time = end_time - timedelta(minutes=20)  # Implicit ultimele 20 de minute

    start_time_str = request.GET.get('start_time')
    end_time_str = request.GET.get('end_time')

    if start_time_str:
        start_time = parse_datetime(start_time_str)
    if end_time_str:
        end_time = parse_datetime(end_time_str)

    query = """
        SELECT timestamp, cpu, memory
        FROM bgpmonsec_project.router_cpu_memory
        WHERE router_id = %s AND timestamp BETWEEN %s AND %s
        ORDER BY timestamp DESC
    """
    cursor.execute(query, (router_id, start_time, end_time))
    rows = cursor.fetchall()

    timestamps = [row[0] for row in rows]
    cpu = [extract_cpu_percentage(row[1]) for row in rows]
    memory = [extract_memory_percentage(row[2]) for row in rows]

    data = {
        'timestamps': timestamps,
        'cpu': cpu,
        'memory': memory
    }
    print(data)
    #print(data)
    return JsonResponse(data)




# Exemplu de utilizare
if __name__ == '__main__':
    host = '1.1.1.1'
    username = 'admin'
    password = 'cisco'
    #memory_output, cpu_output = get_router_info_cpu_mem(router_id)
    get_router_info_cpu_mem_spec_router_id("20072418142931314")
    get_router_info_cpu_mem_spec_all_routers()
