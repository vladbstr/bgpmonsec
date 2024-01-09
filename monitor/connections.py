import paramiko
import datetime
import random
import psycopg2
from pythonping import ping
import json




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
 
    print(r_details)
    for router in r_details:
        route_split=router[0].split(',')
        state=route_split[2]
        ip=route_split[0].replace("(","")
        print(state,ip)
        if check_router_status(str(ip)) == 200:
            print(r_details)
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

    # Salvează modificările
    ip_router_add=iprouter
    response_list = ping(ip_router_add, count=2, timeout=1)
    if any(response.success for response in response_list):
        return 200 
    else:
        return 500
