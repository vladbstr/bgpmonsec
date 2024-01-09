# În monitor/urls.py
from django.urls import path
from .views import monitorizare_retea
from monitor import views
app_name = 'monitor'
urlpatterns = [
    path('monitor/', monitorizare_retea, name='monitor'),
    path('monitor', views.monitor, name="monitor"),
    path('salveaza-datele/', views.salveaza_datele, name='salveaza_datele'),
    path('show-routers-details/', views.show_routers_details, name='show_routers_details'),
    path('delete-router/', views.delete_router, name='delete_router')

]
