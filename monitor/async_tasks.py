import asyncio
import paramiko
import re
import psycopg2
from psycopg2.extras import RealDictCursor
from datetime import datetime
from pythonping import ping

DSN = 'dbname=bgpmonsec user=bgpmonsec_user password=admin host=127.0.0.1 port=5432'

async def get_memory_usage(output):
    total_memory = 0
    used_memory = 0

    for line in output.splitlines():
        if 'Processor Pool Total' in line:
            match = re.search(r'Processor Pool Total:\s+(\d+)\s+Used:\s+(\d+)\s+Free:', line)
            if match:
                total_memory = int(match.group(1))
                used_memory = int(match.group(2))
                break

    used_percentage = (used_memory / total_memory) * 100 if total_memory else 0
    return f"{used_memory / (1024*1024):.2f}MB/{total_memory / (1024*1024):.2f}MB : {used_percentage:.2f}%"

async def get_cpu_usage(output):
    cpu_usage = 0
    for line in output.splitlines():
        if 'CPU utilization' in line:
            match = re.search(r'CPU utilization for five seconds: (\d+)%', line)
            if match:
                cpu_usage = int(match.group(1))
                break

    return f"{cpu_usage}%"

async def get_router_info_cpu_mem(ip, username, password):
    try:
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
        ssh.connect(ip, username=username, password=password)

        chan = ssh.invoke_shell()
        chan.send('terminal length 0\n')
        await asyncio.sleep(1)
        chan.recv(9999)

        chan.send('show processes memory\n')
        await asyncio.sleep(2)
        memory_output = chan.recv(999999).decode('ascii')
        memory_info = await get_memory_usage(memory_output)

        chan.send('show processes cpu\n')
        await asyncio.sleep(2)
        cpu_output = chan.recv(9999999).decode('ascii')
        cpu_info = await get_cpu_usage(cpu_output)

        ssh.close()
        
        return memory_info, cpu_info
    except Exception as e:
        print(f"An error occurred: {e}")
        return None, None

async def fetch_router_details(router_id):
    def sync_fetch_router_details():
        conn = psycopg2.connect(DSN)
        cursor = conn.cursor(cursor_factory=RealDictCursor)
        cursor.execute('SELECT "IP", username, password, r_state FROM public."ROUTERS_INPUT" WHERE router_id=%s', (router_id,))
        router_ssh_details = cursor.fetchall()
        conn.close()
        return router_ssh_details

    return await asyncio.to_thread(sync_fetch_router_details)

async def insert_cpu_memory_data(router_id, cpu_info, memory_info, sst_timestamp):
    def sync_insert_cpu_memory_data():
        conn = psycopg2.connect(DSN)
        cursor = conn.cursor()
        cursor.execute('INSERT INTO bgpmonsec_project.router_cpu_memory (router_id, cpu, memory, timestamp) VALUES (%s, %s, %s, %s)',
                       (router_id, cpu_info, memory_info, sst_timestamp))
        conn.commit()
        conn.close()

    await asyncio.to_thread(sync_insert_cpu_memory_data)

# async def get_router_info_cpu_mem_spec_router_id(router_id):
#     router_ssh_details = await fetch_router_details(router_id)
    
#     if not router_ssh_details:
#         return
    
#     state = router_ssh_details[0]['r_state']
#     if state == 'active':
#         ip = router_ssh_details[0]['IP']
#         username = router_ssh_details[0]['username']
#         password = router_ssh_details[0]['password']
#         memory_info, cpu_info = await get_router_info_cpu_mem(ip, username, password)
#         if memory_info and cpu_info:
#             sst_timestamp = datetime.now()
#             await insert_cpu_memory_data(router_id, cpu_info, memory_info, sst_timestamp)

async def fetch_all_router_details():
    def sync_fetch_all_router_details():
        conn = psycopg2.connect(DSN)
        cursor = conn.cursor(cursor_factory=RealDictCursor)
        cursor.execute('SELECT router_id, "IP", username, password, r_state FROM public."ROUTERS_INPUT"')
        router_ssh_details = cursor.fetchall()
        conn.close()
        return router_ssh_details

    return await asyncio.to_thread(sync_fetch_all_router_details)

async def get_router_info_cpu_mem_spec_all_routers():
    router_ssh_details = await fetch_all_router_details()
    
    if not router_ssh_details:
        return
    
    for router_ssh_detail in router_ssh_details:
        router_id = router_ssh_detail['router_id']
        ip = router_ssh_detail['IP']
        username = router_ssh_detail['username']
        password = router_ssh_detail['password']
        state = router_ssh_detail['r_state']
        if state == 'active':
            memory_info, cpu_info = await get_router_info_cpu_mem(ip, username, password)
            if memory_info and cpu_info:
                sst_timestamp = datetime.now()
                await insert_cpu_memory_data(router_id, cpu_info, memory_info, sst_timestamp)


async def check_router_status(ip_router):
    loop = asyncio.get_event_loop()
    response_list = await loop.run_in_executor(None, ping, ip_router, 2, 1)
    return 200 if any(response.success for response in response_list) else 500

async def update_router_status(ip_router, status):
    loop = asyncio.get_event_loop()
    await loop.run_in_executor(None, _update_router_status, ip_router, status)

def _update_router_status(ip_router, status):
    conn = psycopg2.connect(DSN)

    cursor = conn.cursor()

    # Fetch current downtime value
    cursor.execute('SELECT downtime FROM public."ROUTERS_INPUT" WHERE "IP" = %s', (ip_router,))
    current_downtime = cursor.fetchone()[0]

    # Determine new status and downtime values
    new_status = 'active' if status == 200 else 'inactive'
    new_downtime = current_downtime if new_status == 'inactive' and current_downtime else datetime.now() if new_status == 'inactive' else None

    # Update the router status and downtime
    cursor.execute('UPDATE public."ROUTERS_INPUT" SET r_state = %s, downtime = %s WHERE "IP" = %s', (new_status, new_downtime, ip_router))
    conn.commit()

    cursor.close()
    conn.close()
async def extract_and_update_router_details():
    loop = asyncio.get_event_loop()
    r_details = await loop.run_in_executor(None, _extract_routers_details)
    tasks = [process_router(router) for router in r_details]
    await asyncio.gather(*tasks)

def _extract_routers_details():
    conn = psycopg2.connect(DSN)
    cursor = conn.cursor()
    cursor.execute('SELECT "IP" FROM public."ROUTERS_INPUT"')
    r_details = cursor.fetchall()
    cursor.close()
    conn.close()
    return r_details

async def process_router(router):
    ip_router = router[0]
    status = await check_router_status(ip_router)
    await update_router_status(ip_router, status)



async def periodic_task(interval, coro):
    while True:
        await coro()
        await asyncio.sleep(interval)


