# În monitor/urls.py
from django.urls import path
from .views import monitorizare_retea

urlpatterns = [
    path('monitor/', monitorizare_retea, name='monitor')
]
