# account/urls.py
from django.urls import path, include
from account import views


urlpatterns = [
    path('', views.home, name="home"),
    path('signup/', views.signupuser, name="signupuser"),
    path('login/', views.loginuser, name="loginuser"),
    path('handlelogout/', views.handlelogout, name="handlelogout"),
    path('changepass', views.ChangePassword.as_view(), name="changepass"),
    path('monitor', views.monitor, name="monitor"),
    path('salveaza-datele/', views.salveaza_datele, name='salveaza_datele'),
    path('show-routers-details/', views.show_routers_details, name='show_routers_details')

]
