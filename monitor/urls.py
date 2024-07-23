# În monitor/urls.py
from django.urls import path
from .views import monitorizare_retea
from monitor import views
from pathlib import Path
from .bgp_stats import get_unique_prefixes
from .cpu_memory import get_router_stats

app_name = 'monitor'

urlpatterns = [
    path('monitor/', monitorizare_retea, name='monitor'),
    path('monitor', views.monitor, name="monitor"),
    path('salveaza-datele/', views.salveaza_datele, name='salveaza_datele'),
    path('show-routers-details/', views.show_routers_details, name='show_routers_details'),
    path('delete-router/', views.delete_router, name='delete_router'),
    path('router-statistics/<str:router_id>/', views.router_statistics, name='router_statistics'),
    path('router_cpu_mem/<str:router_id>/', get_router_stats, name='router_stats'),
    path('router_details/<str:router_id>/', views.router_details, name='router_details'),
    path('bgp-stats/', views.bgp_stats, name='bgp_stats'),
    path('api/get-bgp-stats/', views.get_bgp_stats, name='get_bgp_stats'),
    path('api/get-unique-prefixes/', get_unique_prefixes, name='get_unique_prefixes')

    
   # /monitor/api/get-bgp-stats/

]
