
from django.urls import path, include 
from . import views
app_name = 'userprofile'
urlpatterns = [
    path('saveProfile', views.saveProfile, name='saveProfile'),
    path('<str:username>', views.userprofile, name='userprofile'),
    path('monitor/', include('monitor.urls'))
]
