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
from .models import RouterInput
from django import forms
from .forms import CreateUserForm
import psycopg2
import json
from .connections import test_ssh_connection, generate_router_id, extract_routers_details


# view for rendering homepage
def home(request):
    return render(request, "account/home.html")


# view for rendering signup page
def signupuser(request):
    if request.user.is_authenticated:
        return redirect('/')
    if request.method == 'GET':
        return render(request, 'account/signup.html', {'form': CreateUserForm()})
    else:
        if len(request.POST['username']) > 15:
            messages.error(request, " Username must be max 15 characters, Please try again")
            return render(request, 'account/signup.html', {'form': CreateUserForm()})
        if not request.POST['username'].isalnum():
            messages.error(request, "Username should only contain letters and numbers, Please try again")
            return render(request, 'account/signup.html', {'form': CreateUserForm()})
        if request.POST['password1'] == request.POST['password2']:
            try:
                user = User.objects.create_user(request.POST['username'], password=request.POST['password1'],
                                                first_name=request.POST['first_name'],
                                                last_name=request.POST['last_name'])
                user.save()
                login(request, user)
                return redirect('/')
            except IntegrityError:
                messages.error(request, "Username already taken, Please try something else!")
                return render(request, 'account/signup.html', {'form': CreateUserForm()})
        else:
            messages.error(request, "Passwords did not match, Please try something else!")
            return render(request, 'account/signup.html', {'form': CreateUserForm()})


def loginuser(request):
    if request.user.is_authenticated:
        return redirect('/')
    if request.method == 'GET':
        return render(request, "account/login.html")
    if request.method == "POST":
        user_name = request.POST.get('name', '')
        user_password = request.POST.get('password', '')

        user = authenticate(username=user_name, password=user_password)

        if user is not None:
            login(request, user)
            messages.success(request, " Successfully logged in")
            return redirect('/')
        else:
            messages.error(request, " Invalid Credentials, Please try again")
            return render(request, 'account/home.html')


# view for rendering logout
@login_required
def handlelogout(request):
    logout(request)
    messages.success(request, " Successfully logged out")
    return redirect('/')

def show_routers_details(request):
    # Execută un query SQL pentru a prelua toate datele din tabel
    r_details = extract_routers_details()
    data_routere = [{'IP': row[0].split(',')[0].replace("(",""),'description': row[0].split(',')[1], 'r_state': row[0].split(',')[2]} for row in r_details]
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


# view for rendering change password
class ChangePassword(LoginRequiredMixin, TemplateView):
    template_name = "account/passwordchange.html"

    def post(self, request):
        form = PasswordChangeForm(user=request.user, data=request.POST)
        if form.is_valid():
            form.save()
            update_session_auth_hash(request, user=request.user)
            messages.success(request, "Changed Password successfully")
            return redirect('/')
        else:
            for err in form.errors.values():
                messages.error(request, err)
            return redirect('/changepass')

    def get(self, request):
        form = PasswordChangeForm(user=request.user)
        return render(request, self.template_name, {"form": form})
