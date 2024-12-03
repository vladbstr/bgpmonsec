# În monitor/urls.py
from django.urls import path
from .views import monitorizare_retea
from monitor import views
from monitor import bgp_monitor
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
    path('rpki-servers-stats/', views.rpki_servers_stats, name='rpki-servers-stats'),
    path('api/get-bgp-stats/', views.get_bgp_stats, name='get_bgp_stats'),
    path('api/get-unique-prefixes/', get_unique_prefixes, name='get_unique_prefixes'),
    path('router_status/<str:router_id>/', views.router_uptime, name='router_uptime'),
    path('modify-router/', views.modify_router, name='modify_router'),
    path('rpki-data/', views.fetch_rpki_data, name='fetch_rpki_data'),
    path('configure_rpki/', views.configure_rpki, name='configure_rpki'),
    path('check_rpki/', views.check_rpki, name='check_rpki'),
    path('configure_rpki/', views.configure_rpki, name='configure_rpki'),
    path('get_router_asn/', views.get_router_asn, name='get_router_asn'),
    path('get_unread_alerts_count/', views.get_unread_alerts_count, name='get_unread_alerts_count'),
    path('get_alerts/', views.get_alerts, name='get_alerts'),
    path('mark_alerts_as_read/', views.mark_alerts_as_read, name='mark_alerts_as_read'),
    path('alerts/', views.alerts_page, name='alerts_page'),
    path('get_routes/', bgp_monitor.get_routes, name='get_routes'),
    path('get_rpki_trends/', bgp_monitor.get_rpki_trends, name='get_rpki_trends'),
    path('bgp-monitor/', views.bgp_monitor_page, name='bgp_monitor_page'),
   

    
   # /monitor/api/get-bgp-stats/

]
