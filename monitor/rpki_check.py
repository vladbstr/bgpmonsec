from django.shortcuts import render
from .models import Router
import paramiko

def check_rpki_status(ip_address, username, password):
    try:
        # Conectare SSH la router
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
        ssh.connect(ip_address, username=username, password=password)
        
        # Execută comanda pentru a verifica configurația BGP
        stdin, stdout, stderr = ssh.exec_command("show run | section bgp")
        output = stdout.read().decode('utf-8')
        ssh.close()

        # Verifică configurația RPKI
        if "bgp rpki server tcp" in output:
            return "configured"
        elif "bestpath rpki disable" in output:
            return "disabled"
        else:
            return "not_configured"
    except Exception as e:
        return "error"

def router_list(request):
    routers = Router.objects.all()

    # Verifică statusul RPKI pentru fiecare router
    for router in routers:
        router.rpki_status = check_rpki_status(router.ip_address, 'admin', 'admin')
        router.save()

    return render(request, 'routers/router_list.html', {'routers': routers})

from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
import json

