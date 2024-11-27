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
from django.db import IntegrityError
from django import forms
import psycopg2
import json
from .connections import test_ssh_connection, generate_router_id, extract_routers_details, process_router_details, fetch_router_status_and_time
from .bgp_stats import get_bgp_peers_count, get_total_prefixes_count_latest, fetch_bgp_summary_all_routers
import requests
from django.shortcuts import render
import paramiko
import logging

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
    
def monitor(request):
    return render(request, 'monitor/monitor.html', {'titlu': 'MONITORIZARE RETEA'})

def configure_rpki(request):
    if request.method == 'GET':
        return render(request, 'monitor/configure_rpki.html', {'titlu': 'RPKI CHECK'})


def monitorizare_retea(request):
    return render(request, 'monitor/monitor.html', {'titlu': 'MONITORIZARE RETEA'})

def bgp_stats(request):
    return render(request, 'monitor/bgp-stats.html')
    
def router_uptime(request, router_id):
    status, time_info = fetch_router_status_and_time(router_id)
    return JsonResponse({'status': status, 'time_info': time_info})

def router_statistics(request, router_id):
    return render(request, 'monitor/router_statistics.html', {'router_id': router_id})

def router_details(request,router_id):
    r_details=process_router_details(router_id)
    return JsonResponse(r_details)

def rpki_servers_stats(request):
    return render(request, 'monitor/rpki-servers.html', {'titlu': 'RPKI SERVER STATUS'})

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
    Endpoint pentru verificarea RPKI pe un router.
    Primește router_id, verifică statusul RPKI și returnează JSON cu rezultatul.
    """
    if request.method == 'POST':
        #logger.info("check_rpki called")
        try:
            # Decodificăm corpul cererii
            data = json.loads(request.body)
            router_id = data.get('router_id')  # Preluăm ID-ul routerului

            if not router_id:
                return JsonResponse({'status': 'error', 'message': 'Missing router_id'})

            # Conectare la baza de date pentru a obține informațiile routerului
            conn = database_connection()
            cursor = conn.cursor()

            cursor.execute('SELECT "IP", username, password FROM public."ROUTERS_INPUT" WHERE router_id = %s', (router_id,))
            router = cursor.fetchone()
            cursor.close()
            conn.close()

            if not router:
                return JsonResponse({'status': 'error', 'message': 'Router not found'})

            # Extragem informațiile despre router
            ip_address, username, password = router

            # Verificăm conexiunea SSH
            ssh_status = test_ssh_connection(ip_address, username, password)
            if ssh_status != 200:
                return JsonResponse({'status': 'error', 'message': 'SSH connection failed'})

            # Verificăm dacă RPKI este configurat
            rpki_status = check_rpki_status(ip_address, username, password)

            return JsonResponse({'status': 'success', 'rpki_status': rpki_status})
        except Exception as e:
            return JsonResponse({'status': 'error', 'message': str(e)})
    else:
        return JsonResponse({'status': 'error', 'message': 'Invalid request method'})
    



    
    
