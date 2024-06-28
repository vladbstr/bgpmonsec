import paramiko
import datetime
import random
import psycopg2
from pythonping import ping
import json
import re
from netmiko import ConnectHandler
from django.http import JsonResponse

def database_connection():
    conn = psycopg2.connect(
        database="bgpmonsec",
        user="bgpmonsec_user",
        password="admin",
        host="127.0.0.1",
        port="5432"
    )   
    return conn



def check_router_status(ip_router):
    response_list = ping(ip_router, count=2, timeout=1)
    return 200 if any(response.success for response in response_list) else 500

def update_router_status(ip_router, status):
    conn = psycopg2.connect(
        database="bgpmonsec",
        user="bgpmonsec_user",
        password="admin",
        host="127.0.0.1",
        port="5432"
    )   

    cursor = conn.cursor()
    if status==200:
        status='active'
    else:
        status='inactive'
    cursor.execute('UPDATE public."ROUTERS_INPUT" SET r_state = %s WHERE "IP" = %s', (status, ip_router))
    conn.commit()

    cursor.close()
    conn.close()


def extract_routers_details():
    conn = psycopg2.connect(
                        database="bgpmonsec",
                        user="bgpmonsec_user",
                        password="admin",
                        host="127.0.0.1",
                        port="5432"
                    )   

    cursor = conn.cursor()

    cursor.execute('SELECT ("IP", description, r_state,router_id) FROM public."ROUTERS_INPUT" ORDER BY id DESC')

    r_details=cursor.fetchall()
    routers=r_details
    for router_tuple in r_details:
        # Despărțiți tuplul în componente
        router_string = router_tuple[0].strip('()')  # Eliminați parantezele din jurul tuplului
        ip_router, description, r_state, router_id = map(str.strip, router_string.split(','))

        # Apelați funcția check_router_status() cu adresa IP
        status = check_router_status(ip_router)
        
        # Actualizați starea routerului în baza de date
        update_router_status(ip_router, status)
    # for router in routers:
    #     ip_router = router[0]
    #     status = check_router_status(ip_router)
    #     update_router_status(ip_router, status)
    cursor.close()
    conn.close()
    return r_details




def test_ssh_connection(router_ip, username, password):
    try:
        # Create an SSHClient object
        ssh_client = paramiko.SSHClient()

        # Add the server's public key to the known_hosts to avoid warnings
        ssh_client.set_missing_host_key_policy(paramiko.AutoAddPolicy())

        # Connect to the router
        ssh_client.connect(router_ip, username=username, password=password)

        print("SSH connection successful!")

        # Close the SSH connection
        ssh_client.close()

        return 200
    except Exception as e:
        print(f"Error during connection attempt: {str(e)}")
        return 401
    


def generate_router_id():
    # Obține informații despre timp
    now = datetime.datetime.now()

    # Formatul pentru zi, lună, oră, minut, secundă
    time_format = "%d%m%y%H%M%S"

    # Generează un cod format din timestamp și 5 cifre aleatoare
    code = f"{now.strftime(time_format)}{random.randint(10000, 99999)}"

    return str(code)

def check_router_status(iprouter):
    ip_router_add=iprouter
    response_list = ping(ip_router_add, count=2, timeout=1)
    if any(response.success for response in response_list):
        return 200 
    else:
        return 500


def process_router_details(router_id):
    conn = psycopg2.connect(
                    database="bgpmonsec",
                    user="bgpmonsec_user",
                    password="admin",
                    host="127.0.0.1",
                    port="5432"
                )   
    cursor = conn.cursor()

    # cursor.execute('DELETE FROM public."ROUTERS_INPUT" WHERE router_id=%s',(router_id,))
    # conn.commit()
    # cursor.close()
    # cursor.close()
    cursor.execute('SELECT router_id, version, memory, "IP", hostname, uptime, ios, serial, model FROM bgpmonsec_project.router_details where router_id=%s',(router_id,))
    r_details=cursor.fetchall()
    if not r_details:
        cursor.execute('SELECT "IP", username, password FROM public."ROUTERS_INPUT" where router_id=%s',(router_id,))
        router_ssh_details=cursor.fetchall()
        print(router_ssh_details)
        username=router_ssh_details[0][1]
        ip=router_ssh_details[0][0]
        password=router_ssh_details[0][2]
        details=get_router_info(router_id, ip, username, password,cursor,conn)
        print(details)
        data = {
            'ip': details[3],
            'hostname' : details[4],
            'uptime': details[5],
            'version':details[1],
            'ios':details[6],
            'serial':details[7],
            'model':details[8],
            'memory':details[2]
        }
        return data
        
    else:
        data = {
            'ip': r_details[0][3],
            'hostname' : r_details[0][4],
            'uptime': r_details[0][5],
            'version':r_details[0][1],
            'ios':r_details[0][6],
            'serial':r_details[0][7],
            'model':r_details[0][8],
            'memory':r_details[0][2]
        }
        return data
    
    cursor.close()

def get_router_info(router_id, ip, username, password, cursor,conn):
    device=[]
    cisco = {
            'device_type':'cisco_ios',
            'ip':ip,
            'username':username,     #ssh username
            'password':password,  #ssh password
            'secret': password,   #ssh_enable_password
            'ssh_strict':False,  
            'fast_cli':False,
            }
    
    try:
        net_connect = ConnectHandler(**cisco)
        sh_ver_output = net_connect.send_command('show version')   
        #finding hostname in output using regular expressions
        regex_hostname = re.compile(r'(\S+)\suptime')
        hostname = regex_hostname.findall(sh_ver_output)
        #finding uptime in output using regular expressions
        regex_uptime = re.compile(r'\S+\suptime\sis\s(.+)')
        uptime = regex_uptime.findall(sh_ver_output)
        uptime = str(uptime).replace(',' ,'').replace("'" ,"")
        uptime = str(uptime)[1:-1] 
        
        
        #finding version in output using regular expressions
        regex_version = re.compile(r'Cisco\sIOS\sSoftware.+Version\s([^,]+)')
        version = regex_version.findall(sh_ver_output)
        #finding serial in output using regular expressions
        regex_serial = re.compile(r'Processor\sboard\sID\s(\S+)')
        serial = regex_serial.findall(sh_ver_output)
        #finding ios image in output using regular expressions
        regex_ios = re.compile(r'System\simage\sfile\sis\s"([^ "]+)')
        ios = regex_ios.findall(sh_ver_output)
        #finding model in output using regular expressions
        regex_model = re.compile(r'[Cc]isco\s(\S+).*memory.')
        model = regex_model.findall(sh_ver_output)
        
        #finding the router's memory using regular expressions
        regex_memory = re.search(r'with (.*?) bytes of memory', sh_ver_output).group(1)
        memory = regex_memory
    
        #append results to table [hostname,uptime,version,serial,ios,model]
        device=[ip, hostname[0],uptime,version[0],ios[0], serial[0],model[0], memory]
        print(device)
        

        cursor.execute('INSERT INTO bgpmonsec_project.router_details (router_id, version, memory, "IP", hostname, uptime, ios, serial, model) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s);',(router_id,device[3],device[7],ip,device[1],device[2],device[4],device[5],device[6],))
        cursor.close()
        conn.commit()
        conn.close()
        net_connect.disconnect()
        return device
        

    except Exception as e:
        print(f"Error: {str(e)}")

    finally:
        # Închide conexiunea SSH
        net_connect.disconnect()