from django.shortcuts import render
from django.shortcuts import render, redirect
from django.views.generic import TemplateView
from django.contrib import messages
from django.contrib.auth import authenticate, login, logout, update_session_auth_hash
from django.contrib.auth.models import User
from django.contrib.auth.forms import PasswordChangeForm
from django.contrib.auth.decorators import login_required
from django.contrib.auth.mixins import LoginRequiredMixin
from django.views.decorators.http import require_GET
from django.views.decorators.csrf import csrf_exempt
from django.http import JsonResponse
from psycopg2.extras import RealDictCursor
from django.db import IntegrityError
from django import forms
import psycopg2
import ipaddress
import json
from .connections import test_ssh_connection, generate_router_id, extract_routers_details, process_router_details, fetch_router_status_and_time
from .bgp_stats import get_bgp_peers_count, get_total_prefixes_count_latest, fetch_bgp_summary_all_routers

import requests
from django.shortcuts import render
import paramiko
import logging,time

@csrf_exempt
def delete_router(request):
    try:
        data=json.loads(request.body.decode('utf-8'))
        router_id = str(data.get('routerId'))
        conn = psycopg2.connect(
                    database="bgpmonsec",
                    user="bgpmonsec_user",
                    password="admin",
                    host="127.0.0.1",
                    port="5432"
                )   
        cursor = conn.cursor()

        cursor.execute('DELETE FROM public."ROUTERS_INPUT" WHERE router_id=%s',(router_id,))
        conn.commit()
        cursor.close()
        conn.close()
        

        # Definește comanda SQL de inser
        
        return JsonResponse({'message': '200 Router Deleted Successfully!'})
    except Exception as e:
        return JsonResponse({'error': str(e)}, status=500)
    

@csrf_exempt
def modify_router(request):
    try:
        data = json.loads(request.body.decode('utf-8'))
        router_id = str(data.get('routerId'))
        ip = data.get('ip')
        username = data.get('username')
        password = data.get('password')
        description = data.get('description')

        print(data)

        conn = psycopg2.connect(
            database="bgpmonsec",
            user="bgpmonsec_user",
            password="admin",
            host="127.0.0.1",
            port="5432"
        )
        cursor = conn.cursor()
        cursor.execute(
            'UPDATE public."ROUTERS_INPUT" SET "IP" = %s, username = %s, password = %s, description = %s WHERE router_id = %s',
            (ip, username, password, description, router_id)
        )
        conn.commit()
        cursor.close()
        conn.close()

        return JsonResponse({'status': 'success', 'message': 'Router modified successfully!'})
    except Exception as e:
        return JsonResponse({'status': 'error', 'message': str(e)}, status=500)
    
def show_routers_details(request):
    # Execută un query SQL pentru a prelua toate datele din tabel
    r_details = extract_routers_details()
    data_routere = [{'IP': row[0].split(',')[0].replace("(",""),'description': row[0].split(',')[1], 'r_state': row[0].split(',')[2], 'router_id': row[0].split(',')[3].replace(")","")} for row in r_details]
    # Transmite datele către șablon
    return JsonResponse(data_routere, safe=False)




@csrf_exempt
def salveaza_datele(request):
    if request.method == 'POST':
        try:
            # Extrage datele din corpul cererii
            data = json.loads(request.body.decode('utf-8'))
            ip = data.get('ip')
            username = data.get('username')
            password = data.get('password')
            description=data.get('description')

            # Afișează datele în consola server-ului Django
            print(f"IP: {ip}, Username: {username}, Parola: {password}, description: {description}")
            if test_ssh_connection (ip,username,password) == 200:
                print ('SSH connection successful!')
                router_id=generate_router_id()
                r_state=str('active')
                # Conectează-te la baza de date PostgreSQL
                conn = psycopg2.connect(
                    database="bgpmonsec",
                    user="bgpmonsec_user",
                    password="admin",
                    host="127.0.0.1",
                    port="5432"
                )   
                
                # Creează un cursor
                cursor = conn.cursor()
                # Definește comanda SQL de insert
                sql_insert = 'INSERT INTO public."ROUTERS_INPUT" ("IP", username, password, description,r_state,router_id) VALUES (%s, %s, %s, %s, %s, %s);'
                #INSERT INTO public."ROUTERS_INPUT" (IP, username, password) VALUES ('192.168.10.1', 'admin', 'admin');
                # Execută comanda SQL folosind parametrii
                cursor.execute(sql_insert, (ip, username, password,description,r_state,router_id))
                # Salvează modificările
                conn.commit()

                # Închide cursorul și conexiunea
                cursor.close()
                conn.close()
                return JsonResponse({'status': 'success'})
            else:
                return JsonResponse({'status': 'error', 'message': f'SSH CONECTION FAILED:'})
        except json.JSONDecodeError as e:
            return JsonResponse({'status': 'error', 'message': f'Eroare la decodificarea JSON: {str(e)}'})
    else:
        return JsonResponse({'status': 'error', 'message': 'Metoda de cerere nu este POST'})

@login_required
def monitor(request):
    return render(request, 'monitor/monitor.html', {'titlu': 'MONITORIZARE RETEA'})

@csrf_exempt
def configure_rpki(request):
    if request.method == 'GET':
        return render(request, 'monitor/configure_rpki.html', {'titlu': 'RPKI CHECK'})
    if request.method == 'POST':
        try:
            data = json.loads(request.body)
            router_id = data.get('router_id')
            ip_address = data.get('ip_address')
            asn = data.get('asn')

            if not router_id or not ip_address or not asn:
                return JsonResponse({'status': 'error', 'message': 'Missing router_id, ip_address, or ASN'})

            conn = database_connection()
            cursor = conn.cursor()
            cursor.execute('SELECT username, password FROM public."ROUTERS_INPUT" WHERE router_id = %s', (router_id,))
            router = cursor.fetchone()

            if not router:
                return JsonResponse({'status': 'error', 'message': 'Router not found'})

            username, password = router

            ssh = paramiko.SSHClient()
            ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
            ssh.connect(ip_address, username=username, password=password)

            # Debug command

            # Use invoke_shell for interactive commands
            shell = ssh.invoke_shell()
            shell.send("conf t\n")
            shell.send(f"router bgp {asn}\n")
            shell.send("bgp rpki server tcp 192.168.62.129 port 3323 refresh 300\n")
            shell.send("end\n")
            shell.send("wr\n")
            time.sleep(2)
            output = shell.recv(9999).decode("ascii")
            print(f"Shell output:\n{output}")
            ssh.close()

            # Check if configuration was successful
            if "bgp rpki server" in output:
                return JsonResponse({'status': 'success', 'message': 'RPKI configured successfully'})
            else:
                return JsonResponse({'status': 'error', 'message': 'Failed to configure RPKI. Check router logs.'})

        except Exception as e:
            return JsonResponse({'status': 'error', 'message': str(e)})
    else:
        return JsonResponse({'status': 'error', 'message': 'Invalid request method'})

@login_required
def monitorizare_retea(request):
    return render(request, 'monitor/monitor.html', {'titlu': 'MONITORIZARE RETEA'})

@login_required
def bgp_stats(request):
    return render(request, 'monitor/bgp-stats.html')
    
def router_uptime(request, router_id):
    status, time_info = fetch_router_status_and_time(router_id)
    return JsonResponse({'status': status, 'time_info': time_info})

@login_required
def router_statistics(request, router_id):
    return render(request, 'monitor/router_statistics.html', {'router_id': router_id})

def router_details(request,router_id):
    r_details=process_router_details(router_id)
    return JsonResponse(r_details)

@login_required
def rpki_servers_stats(request):
    return render(request, 'monitor/rpki-servers.html', {'titlu': 'RPKI SERVER STATUS'})

@login_required
def alerts_page(request):
    return render(request, 'monitor/alerts.html', {'titlu': 'ALERTS'})

@login_required
def bgp_monitor_page(request):
    return render(request, 'monitor/bgp_monitor.html')  

@login_required
def manage_alert_users(request):
    return render(request, 'monitor/manage_alerts_users.html')  

@login_required
def app_performance_view(request):
    """Returnează pagina pentru analiza performanței aplicației."""
    return render(request, 'monitor/app_performance.html')

@require_GET
def get_bgp_stats(request):
    fetch_bgp_summary_all_routers()
    num_peers = get_bgp_peers_count()
    num_prefixes_ipv4 = get_total_prefixes_count_latest()

    data = {
        'num_peers': num_peers,
        'num_prefixes_ipv4': num_prefixes_ipv4,
    }
    return JsonResponse(data)

import requests
from django.http import JsonResponse

def fetch_rpki_data(request):
    url = "http://192.168.62.129:8323/status"
    try:
        # Preia datele de la serverul RPKI
        response = requests.get(url)
        response.raise_for_status()
        text_data = response.text

        # Parsează datele
        lines = text_data.split('\n')  # Împarte datele pe linii
        parsed_data = {}

        for line in lines:
            # Ignoră liniile goale și comentariile
            if line.strip() and not line.startswith('//'):
                # Împarte linia pe baza primului ":"
                if ':' in line:
                    key, value = line.split(':', 1)  # Împarte doar pe primul ":"
                    parsed_data[key.strip()] = value.strip()

        # Verifică dacă datele sunt corect parseate
        #print("Parsed Data:", parsed_data)
        
        # Selectează datele esențiale
        essential_data = {
            'version':parsed_data['version'],
            'last-update-start-at': parsed_data['last-update-start-at'],
            'last-update-start-ago': parsed_data.get('last-update-start-ago'),
            'last-update-done-at': parsed_data.get('last-update-done-at'),
            'valid-roas': parsed_data.get('valid-roas'),
            'vrps': parsed_data.get('vrps'),
            'rtr-connections': parsed_data.get('rtr-connections'),
            'rtr-data': parsed_data.get('rtr-data'),
            'http-connections': parsed_data.get('http-connections'),
            'http-data': parsed_data.get('http-data'),
            'http-requests': parsed_data.get('http-requests'),
        }
        #print(essential_data)
        return JsonResponse({'status': 'success', 'essential_data': essential_data, 'all_data': parsed_data})

    except requests.exceptions.RequestException as e:
        return JsonResponse({'status': 'error', 'message': str(e)}, status=500)


import json
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from .connections import test_ssh_connection, check_rpki_status, database_connection

@csrf_exempt
def check_rpki(request):
    """
    Endpoint pentru verificarea RPKI și actualizarea bazei de date.
    """
    if request.method == 'POST':
        try:
            data = json.loads(request.body)
            router_id = data.get('router_id')

            if not router_id:
                return JsonResponse({'status': 'error', 'message': 'Missing router_id'})

            # Conectare la baza de date pentru a obține informațiile routerului
            conn = database_connection()
            cursor = conn.cursor()

            cursor.execute('SELECT "IP", username, password FROM public."ROUTERS_INPUT" WHERE router_id = %s', (router_id,))
            router = cursor.fetchone()

            if not router:
                return JsonResponse({'status': 'error', 'message': 'Router not found'})

            ip_address, username, password = router

            # Verificăm configurația și conexiunea RPKI
            config_status, connection_status = check_rpki_status(ip_address, username, password)

            # Salvăm rezultatul în baza de date
            cursor.execute('''
                INSERT INTO bgpmonsec_project.rpki_router_connection_config (router_id, config_status, rpki_server_connection_from_router)
                VALUES (%s, %s, %s)
                ON CONFLICT (router_id)
                DO UPDATE SET config_status = EXCLUDED.config_status, rpki_server_connection_from_router = EXCLUDED.rpki_server_connection_from_router
            ''', (router_id, config_status, connection_status))
            conn.commit()

            cursor.close()
            conn.close()
            return JsonResponse({'status': 'success', 'config_status': config_status, 'connection_status': connection_status})
        except Exception as e:
            return JsonResponse({'status': 'error', 'message': str(e)})
    else:
        return JsonResponse({'status': 'error', 'message': 'Invalid request method'})
    

@csrf_exempt
def get_router_asn(request):
    """
    Endpoint pentru obținerea ASN-ului unui router.
    """
    if request.method == 'POST':
        try:
            # Extrage datele din request
            data = json.loads(request.body)
            router_id = data.get('router_id')

            if not router_id:
                return JsonResponse({'status': 'error', 'message': 'Missing router_id'})

            # Conectează-te la baza de date pentru a obține datele routerului
            conn = database_connection()
            cursor = conn.cursor()
            cursor.execute('SELECT "IP", username, password FROM public."ROUTERS_INPUT" WHERE router_id = %s', (router_id,))
            router = cursor.fetchone()

            if not router:
                return JsonResponse({'status': 'error', 'message': 'Router not found'})

            ip_address, username, password = router

            # Conectare SSH pentru a obține ASN-ul
            ssh = paramiko.SSHClient()
            ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
            ssh.connect(ip_address, username=username, password=password)

            # Comandă pentru a obține ASN-ul
            command = "show run | include router bgp"
            stdin, stdout, stderr = ssh.exec_command(command)
            output = stdout.read().decode().strip()

            ssh.close()

            # Extrage ASN-ul din output
            asn = None
            for line in output.splitlines():
                if "router bgp" in line:
                    asn = line.split()[-1]  # Ultimul element din linie este ASN-ul
                    break

            if not asn:
                return JsonResponse({'status': 'error', 'message': 'ASN not found'})

            return JsonResponse({'status': 'success', 'asn': asn})
        except Exception as e:
            return JsonResponse({'status': 'error', 'message': str(e)})
    else:
        return JsonResponse({'status': 'error', 'message': 'Invalid request method'})


def get_unread_alerts_count(request):
    """
    Endpoint pentru obținerea numărului de alerte necitite.
    """
    try:
        conn = database_connection()
        cursor = conn.cursor()
        cursor.execute('SELECT COUNT(*) FROM bgpmonsec_project.alerts WHERE was_readed = %s', ('false',))
        count = cursor.fetchone()[0]
        conn.close()
        return JsonResponse({'status': 'success', 'count': count})
    except Exception as e:
        return JsonResponse({'status': 'error', 'message': str(e)})
    

def get_alerts(request):
    """
    Endpoint pentru obținerea tuturor alertelor.
    """
    try:
        conn = database_connection()
        cursor = conn.cursor()
        cursor.execute('SELECT * FROM bgpmonsec_project.alerts ORDER BY "timestamp" DESC')
        alerts = cursor.fetchall()

        alert_list = [
            {
                'router_id': row[1],
                'alert_type': row[2],
                'alert_name': row[3],
                'description': row[4],
                'timestamp': row[5],
                'was_readed': row[6]
            }
            for row in alerts
        ]
        conn.close()
        return JsonResponse({'status': 'success', 'alerts': alert_list})
    except Exception as e:
        return JsonResponse({'status': 'error', 'message': str(e)})

@csrf_exempt
def mark_alerts_as_read(request):
    """
    Endpoint pentru a marca alertele ca citite.
    """
    if request.method == 'POST':
        try:
            conn = database_connection()
            cursor = conn.cursor()
            cursor.execute('UPDATE bgpmonsec_project.alerts SET was_readed = %s WHERE was_readed = %s', ('true', 'false'))
            conn.commit()
            conn.close()
            return JsonResponse({'status': 'success', 'message': 'Alerts marked as read'})
        except Exception as e:
            return JsonResponse({'status': 'error', 'message': str(e)})
    else:
        return JsonResponse({'status': 'error', 'message': 'Invalid request method'})
    

def cidr_to_wildcard(prefix):
    """
    Transforma un prefix CIDR (ex. 1.30.153.0/24) în format wildcard mask (ex. 1.30.153.0 0.0.0.255).
    """
    network = ipaddress.IPv4Network(prefix, strict=False)
    ip = str(network.network_address)
    netmask = str(network.netmask)

    # Transformăm netmask-ul în wildcard mask
    wildcard = '.'.join(str(255 - int(octet)) for octet in netmask.split('.'))
    return f"{ip} {wildcard}"

@csrf_exempt
def manage_bgp_route(request):
    if request.method == 'POST':
        try:
            data = json.loads(request.body)
            prefix = data.get('prefix')
            router_id = data.get('router_id')
            action = data.get('action')
            rpki_status = data.get('rpki_status')

            # Conectare la baza de date
            conn = database_connection()
            cursor = conn.cursor(cursor_factory=RealDictCursor)

            # Obține detalii despre router
            cursor.execute('''
                SELECT "IP", username, password
                FROM public."ROUTERS_INPUT"
                WHERE router_id = %s
            ''', (router_id,))
            router_details = cursor.fetchone()

            if not router_details:
                return JsonResponse({'status': 'error', 'message': f'Router {router_id} not found'}, status=404)

            router_ip = router_details["IP"]
            username = router_details["username"]
            password = router_details["password"]

            # Verificăm dacă ruta există deja în baza de date
            cursor.execute('''
                SELECT * FROM bgpmonsec_project.bgp_route_monitor
                WHERE prefix = %s AND router_id = %s
            ''', (prefix, router_id))
            route = cursor.fetchone()

            # Configurare pe router
            cisco_device = {
                'device_type': 'cisco_ios',
                'host': router_ip,
                'username': username,
                'password': password,
                'secret': password
            }

            if action == 'install':
                if route and route['status_actions'] == 'installed':
                    return JsonResponse({'status': 'success', 'message': f'Route {prefix} is already installed.'})

                if route and route['status_actions'] == 'deny':
                    # Creează conexiunea la router
                    from netmiko import ConnectHandler
                    net_connect = ConnectHandler(**cisco_device)
                    print('intra')
                    # Găsim și ștergem regula din access-list
                    acl_name = "BLOCK_PREFIXES"
                    acl_output = net_connect.send_command(f"show run | s ip access-list extended {acl_name}")
                    print(acl_output)
                    print(prefix)
                    wildcard_prefix = cidr_to_wildcard(prefix)
                    print(wildcard_prefix)

                    print(f"ip access-list extended {acl_name}")
                    print(f"no permit ip {prefix} any")
                    if f"permit ip {wildcard_prefix}" in acl_output:
                        net_connect.send_config_set([f"ip access-list extended {acl_name}", f"no permit ip {wildcard_prefix} any"])
                        print(f"Prefix {wildcard_prefix} removed from access-list {acl_name}.")

                    # Actualizăm baza de date
                    cursor.execute('''
                        UPDATE bgpmonsec_project.bgp_route_monitor
                        SET status_actions = %s, configured_in_router = %s
                        WHERE prefix = %s AND router_id = %s
                    ''', ('installed', True, prefix, router_id))
                    conn.commit()

                    net_connect.save_config()
                    net_connect.disconnect()

                    return JsonResponse({'status': 'success', 'message': f'Route {prefix} successfully installed.'})

                return JsonResponse({'status': 'error', 'message': f'Route {prefix} is not configured for deny.'})

            elif action == 'deny':
                if route and route['status_actions'] == 'deny':
                    return JsonResponse({'status': 'success', 'message': f'Route {prefix} is already denied.'})

                # Creează conexiunea la router
                from netmiko import ConnectHandler
                net_connect = ConnectHandler(**cisco_device)

                # Adăugăm regula în access-list
                acl_name = "BLOCK_PREFIXES"
                acl_output = net_connect.send_command(f"show run | s ip access-list extended {acl_name}")

                # Transform prefix în wildcard pentru access-list
                import ipaddress
                ip_network = ipaddress.IPv4Network(prefix, strict=False)
                wildcard = str(ip_network.network_address) + " " + str(ip_network.hostmask)

                if f"permit ip {wildcard} any" not in acl_output:
                    net_connect.send_config_set([f"ip access-list extended {acl_name}", f"permit ip {wildcard} any"])
                    print(f"Prefix {prefix} added to access-list {acl_name}.")

                # Actualizăm baza de date
                cursor.execute('''
                    INSERT INTO bgpmonsec_project.bgp_route_monitor 
                    (prefix, next_hop, asn_path, rpki_status, status_actions, router_id, configured_in_router, "timestamp")
                    VALUES (%s, %s, %s, %s, %s, %s, %s, NOW())
                    ON CONFLICT (prefix) DO UPDATE SET 
                        status_actions = EXCLUDED.status_actions, 
                        configured_in_router = EXCLUDED.configured_in_router
                ''', (prefix, data.get('next_hop'), data.get('asn_path'), rpki_status, 'deny', router_id, True))
                conn.commit()

                net_connect.save_config()
                net_connect.disconnect()

                return JsonResponse({'status': 'success', 'message': f'Route {prefix} successfully denied and added to database.'})

            else:
                return JsonResponse({'status': 'error', 'message': 'Invalid action'}, status=400)

        except Exception as e:
            print(f"Error: {e}")
            return JsonResponse({'status': 'error', 'message': str(e)}, status=500)

    return JsonResponse({'status': 'error', 'message': 'Invalid request method'}, status=405)



def get_throughput_data(request):
    try:
        conn = database_connection()
        cursor = conn.cursor(cursor_factory=RealDictCursor)

        # Selectăm ultimele 50 de înregistrări, în ordine descrescătoare după timestamp
        cursor.execute("""
            SELECT "timestamp", throughput_value 
            FROM bgpmonsec_project.throughput 
            ORDER BY "timestamp" DESC
            LIMIT 50;
        """)
        results = cursor.fetchall()
        conn.close()

        # Extragem timestamp-urile și valorile de throughput
        timestamps = [row["timestamp"].strftime('%Y-%m-%d %H:%M:%S') for row in results]
        throughput_values = [row["throughput_value"] for row in results]

        # ✅ Le inversăm ca să fie de la cele mai vechi la cele mai noi
        timestamps.reverse()
        throughput_values.reverse()

        return JsonResponse({
            'status': 'success',
            'data': {
                'timestamps': timestamps,
                'throughput_values': throughput_values
            }
        })

    except Exception as e:
        return JsonResponse({'status': 'error', 'message': str(e)})



