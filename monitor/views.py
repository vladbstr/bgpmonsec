from django.shortcuts import render
from django.shortcuts import render, redirect
from django.views.generic import TemplateView
from django.contrib import messages
from django.contrib.auth import authenticate, login, logout, update_session_auth_hash
from django.contrib.auth.models import User
from django.contrib.auth.forms import PasswordChangeForm
from django.contrib.auth.decorators import login_required
from django.contrib.auth.mixins import LoginRequiredMixin
from django.views.decorators.csrf import csrf_exempt
from django.http import JsonResponse
from django.db import IntegrityError
from django import forms
import psycopg2
import json
from .connections import test_ssh_connection, generate_router_id, extract_routers_details

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



def monitorizare_retea(request):
    return render(request, 'monitor/monitor.html', {'titlu': 'MONITORIZARE RETEA'})
