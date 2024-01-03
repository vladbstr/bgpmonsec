from django.shortcuts import render

def monitorizare_retea(request):
    return render(request, 'monitor/monitor.html', {'titlu': 'MONITORIZARE RETEA'})
