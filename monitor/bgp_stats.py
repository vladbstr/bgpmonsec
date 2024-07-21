from .connections import database_connection
from datetime import datetime
import paramiko
from django.views.decorators.http import require_GET
from django.http import JsonResponse
import re

conn = database_connection()


def fetch_bgp_summary(router_id):
    sst_timestamp = datetime.now()
    ###########################
    #sh ip bgp summaryy
    ############################
    cursor = conn.cursor()
    cursor.execute('SELECT "IP",username,password from public."ROUTERS_INPUT" where router_id=%s',(router_id,))
    conn_details=cursor.fetchall()
    ##print(conn_details)
    host = conn_details[0][0]
    port = 22
    username = conn_details[0][1]
    password = conn_details[0][2]
    command = "show ip bgp summary"
    
    ##print("Connecting to the router...")
    client = paramiko.SSHClient()
    client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    client.connect(host, port, username, password)
    
    ##print("Executing command...")
    stdin, stdout, stderr = client.exec_command(command)
    output = stdout.read().decode()

    ##print("Command executed. Output:")
    ##print(output)

    client.close()

    ##print("Parsing output...")
    lines = output.splitlines()
    #print('prima data')
    # Find the start of the neighbor table
    start_parsing = False
    for line in lines:
        if start_parsing:
            parts = line.split()
            if len(parts) < 10:
                # #print(f"Skipping line (not enough parts): {line}")
                continue
            
            neighbor_ip = parts[0]
            as_number=parts[2]
            state = parts[9]  # Adjust if state column is different
            uptime = parts[8]  # Adjust if uptime column is different
            flaps = 0  # As per your output, there is no flaps info. Adjust if needed.
            
            # #print(f"Neighbor IP: {neighbor_ip}")
            # #print(f"State: {state}")
            # #print(f"Uptime: {uptime}")
            # #print(f"Flaps: {flaps}")
            cursor.execute(
                'INSERT INTO bgpmonsec_project.bgp_summary (router_id, neighbor_ip, state, uptime, flaps, "timestamp", "as") VALUES (%s, %s, %s, %s, %s, %s, %s);',
                (router_id, neighbor_ip, state, uptime, flaps, sst_timestamp,as_number)
            )
            conn.commit()
        
        
        if line.startswith("Neighbor"):
            start_parsing = True

    
    #print('baaaaaaaaaa asta e '+ str(router_id))
    #print('wtffffffffffffffffffff')
    ###########################
    #sh ip bgp
    ###########################

    ##print("Connecting to the router...")
    client = paramiko.SSHClient()
    client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    client.connect(host, port, username, password)
    command = 'sh ip bgp'
    ##print("Executing command...")
    stdin, stdout, stderr = client.exec_command(command)
    output = stdout.read().decode()

    ##print("Command executed. Output:")
    ##print(output)
    
    client.close()
    
    ##print("Parsing output...")
    lines = output.splitlines()
    parsing_bgp = False
    # Find the start of the neighbor table
    #print(lines)
    for line in lines:
        if 'Network' in line:
            parsing_bgp = True
            continue
        

        if parsing_bgp:
            #print(line)
            parts = line.split()
            if parts[0].startswith('*>') and re.search(r'\d', parts[0]):
                network_with_mask = str(parts[0].lstrip('*>i'))
                #print(network_with_mask)
                network = network_with_mask.split('/')[0]
                #print(network_with_mask)
                #print('hoooooooooooo')
                mask=network_with_mask.split('/')[1]
                next_hop = str(parts[1])
                metric = str(parts[2])
                locpref = str(parts[3])
                weight = str(parts[4])
                path = str(" ".join(parts[6:]))
            else:
                path="1"
                #print(parts)
                network_with_mask = str(parts[1])
                network = network_with_mask.split('/')[0]
                #print(network_with_mask)
                #print('daaaa')
                mask=network_with_mask.split('/')[1]
                next_hop = str(parts[2])
                metric = str(parts[3])
                locpref = str(parts[4])
                weight = str(parts[5])
                path = str(" ".join(parts[6:]))
                #path="1"
        

            cursor.execute(
                        'INSERT INTO bgpmonsec_project.sh_bgp_ip (router_id, network_with_mask, network, mask, next_hop, metric, locpref, weight, "path", "timestamp") VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s);',
                        (router_id, network_with_mask, str(network),mask,next_hop,metric,locpref,weight,path,sst_timestamp)
                    )
    conn.commit()
    cursor.close()
    
    ##print("Data collection and storage complete.")


def fetch_bgp_summary_all_routers():
    cursor = conn.cursor()
    cursor.execute('SELECT router_id, r_state from public."ROUTERS_INPUT"')
    conn_details=cursor.fetchall()
    for router_id, state in conn_details:
        if state == 'active':
            #print(router_id)
            fetch_bgp_summary(router_id)
    

def get_unique_prefixes(request):   
    cursor = conn.cursor()

    query = """
    WITH latest_summary AS (
        SELECT 
            router_id, 
            MAX("timestamp") AS latest_timestamp
        FROM 
            bgpmonsec_project.sh_bgp_ip
        GROUP BY 
            router_id
    ),
    filtered_bgp AS (
        SELECT DISTINCT ON (sb.network_with_mask)
            sb.network_with_mask,
            sb.path
        FROM 
            bgpmonsec_project.sh_bgp_ip sb
        JOIN 
            latest_summary ls ON sb.router_id = ls.router_id AND sb."timestamp" = ls.latest_timestamp
        ORDER BY 
            sb.network_with_mask, sb."timestamp" DESC
    )
    SELECT 
        network_with_mask,
        (regexp_matches(sb.path, '(\\d+)\\si$', 'g'))[1] AS as_number
    FROM 
        filtered_bgp sb
    ORDER BY 
        network_with_mask;
    """

    cursor.execute(query)
    results = cursor.fetchall()
    
    # Transform results into a list of dictionaries
    prefixes = []
    for row in results:
        network_with_mask, as_number = row
        prefixes.append({
            "network_with_mask": network_with_mask,
            "as_number": as_number
        })

    cursor.close()

    return JsonResponse({"prefixes": prefixes})



def get_bgp_peers_count():
    cursor = conn.cursor()

    query = """
    SELECT COUNT(DISTINCT t1.neighbor_ip)
    FROM bgpmonsec_project.bgp_summary t1
    INNER JOIN (
        SELECT router_id, MAX("timestamp") AS latest_timestamp
        FROM bgpmonsec_project.bgp_summary
        GROUP BY router_id
    ) t2
    ON t1.router_id = t2.router_id AND t1."timestamp" = t2.latest_timestamp;
    """

    cursor.execute(query)
    result = cursor.fetchone()
    
    total_peers = result[0] if result else 0

    cursor.close()
    return total_peers


def get_total_prefixes_count_latest():
    cursor = conn.cursor()

    query = """
    SELECT COUNT(DISTINCT t1.network_with_mask)
    FROM bgpmonsec_project.sh_bgp_ip t1
    INNER JOIN (
        SELECT router_id, MAX("timestamp") AS latest_timestamp
        FROM bgpmonsec_project.sh_bgp_ip
        GROUP BY router_id
    ) t2
    ON t1.router_id = t2.router_id AND t1."timestamp" = t2.latest_timestamp;
    """

    cursor.execute(query)
    result = cursor.fetchone()
    
    total_prefixes = result[0] if result else 0

    cursor.close()
    

    return total_prefixes


@require_GET
def get_bgp_stats(request):
    num_peers = get_bgp_peers_count()
    num_prefixes_ipv4 = get_total_prefixes_count_latest()

    data = {
        'num_peers': num_peers,
        'num_prefixes_ipv4': num_prefixes_ipv4,
    }
    return JsonResponse(data)

# if __name__ == '__main__':
#     #fetch_bgp_summary('28062414183645219')
#     #get_bgp_peers_count()
#     #get_total_prefixes_count_latest()
#     fetch_bgp_summary_all_routers()



