from connections import database_connection
from datetime import datetime
import paramiko
from django.views.decorators.http import require_GET
from django.http import JsonResponse
import re


import paramiko
import time


def get_memory_usage(output):
    total_memory = 0
    used_memory = 0

    for line in output.splitlines():
        if 'Processor Pool Total' in line:
            print(line)
            match = re.search(r'Processor Pool Total:\s+(\d+)\s+Used:\s+(\d+)\s+Free:', line)
            if match:
                total_memory = int(match.group(1))
                used_memory = int(match.group(2))
                break

    used_percentage = (used_memory / total_memory) * 100 if total_memory else 0
    return f"{used_memory / (1024*1024):.2f}MB/{total_memory / (1024*1024):.2f}MB : {used_percentage:.2f}%"


def get_cpu_usage(output):
    cpu_usage = 0
    #print(output)
    for line in output.splitlines():
        if 'CPU utilization' in line:
            
            match = re.search(r'CPU utilization for five seconds: (\d+)%', line)
            if match:
                cpu_usage = int(match.group(1))
                break

    return f"{cpu_usage}%"




def get_router_info_cpu_mem(host, username, password):
    try:
        # Creează un obiect SSHClient
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
        # Conectează-te la router
        ssh.connect(host, username=username, password=password)
        
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
        print(get_memory_usage(memory_output))

        # Execuție comanda pentru CPU
        chan.send('show processes cpu\n')
        time.sleep(2)
        cpu_output = chan.recv(9999999).decode('ascii')
        a=get_cpu_usage(cpu_output)
        print(a)
        # Închide sesiunea SSH
        ssh.close()
        
        return memory_output, cpu_output
    except Exception as e:
        print(f"An error occurred: {e}")

# Exemplu de utilizare
host = '1.1.1.1'
username = 'admin'
password = 'cisco'
#memory_output, cpu_output = get_router_info_cpu_mem(router_id)
