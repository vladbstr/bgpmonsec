from connections import database_connection
from datetime import datetime
import paramiko
import ipaddress

global_timestamp = datetime.now()
conn = database_connection()


def fetch_bgp_summary(router_id):



    ###########################
    #sh ip bgp summaryy
    ###########################
    cursor = conn.cursor()
    cursor.execute('SELECT "IP",username,password from public."ROUTERS_INPUT" where router_id=%s',(router_id,))
    conn_details=cursor.fetchall()
    print(conn_details)
    host = conn_details[0][0]
    port = 22
    username = conn_details[0][1]
    password = conn_details[0][2]
    command = "show ip bgp summary"
    
    print("Connecting to the router...")
    client = paramiko.SSHClient()
    client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    client.connect(host, port, username, password)
    
    print("Executing command...")
    stdin, stdout, stderr = client.exec_command(command)
    output = stdout.read().decode()

    print("Command executed. Output:")
    print(output)

    client.close()

    print("Parsing output...")
    lines = output.splitlines()
    
    # Find the start of the neighbor table
    start_parsing = False
    for line in lines:
        if start_parsing:
            parts = line.split()
            if len(parts) < 10:
                print(f"Skipping line (not enough parts): {line}")
                continue
            
            neighbor_ip = parts[0]
            as_number=parts[2]
            state = parts[9]  # Adjust if state column is different
            uptime = parts[8]  # Adjust if uptime column is different
            flaps = 0  # As per your output, there is no flaps info. Adjust if needed.
            
            print(f"Neighbor IP: {neighbor_ip}")
            print(f"State: {state}")
            print(f"Uptime: {uptime}")
            print(f"Flaps: {flaps}")
            cursor.execute(
                'INSERT INTO bgpmonsec_project.bgp_summary (router_id, neighbor_ip, state, uptime, flaps, "timestamp", "as") VALUES (%s, %s, %s, %s, %s, %s, %s);',
                (router_id, neighbor_ip, state, uptime, flaps, global_timestamp,as_number)
            )
        
        
        if line.startswith("Neighbor"):
            start_parsing = True

    


    ###########################
    #sh ip bgp
    ###########################

    print("Connecting to the router...")
    client = paramiko.SSHClient()
    client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    client.connect(host, port, username, password)
    command = 'sh ip bgp'
    print("Executing command...")
    stdin, stdout, stderr = client.exec_command(command)
    output = stdout.read().decode()

    print("Command executed. Output:")
    print(output)
    
    client.close()
    
    print("Parsing output...")
    lines = output.splitlines()
    parsing_bgp = False
    # Find the start of the neighbor table
    start_parsing = False
    for line in lines:
        if line.startswith("     Network"):
            parsing_bgp = True
            continue
        
        if parsing_bgp:
            parts = line.split()
            network_with_mask = str(parts[1])
            network = network_with_mask.split('/')[0]
            mask=network_with_mask.split('/')[1]
            next_hop = str(parts[2])
            metric = str(parts[3])
            locpref = str(parts[4])
            weight = str(parts[5])
            #path = str(" ".join(parts[6:]))
            path="1"
        
            cursor.execute(
                        'INSERT INTO bgpmonsec_project.sh_bgp_ip (router_id, network_with_mask, network, mask, next_hop, metric, locpref, weight, "path", "timestamp") VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s);',
                        (router_id, network_with_mask, str(network),mask,next_hop,metric,locpref,weight,path,global_timestamp)
                    )
    conn.commit()
    cursor.close()
    conn.close()
    print("Data collection and storage complete.")

fetch_bgp_summary('28062414183645219')


