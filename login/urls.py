
from django.contrib import admin
from django.urls import path, include  # Added include module
from django.conf import settings
from django.conf.urls.static import static
from django.conf import settings

urlpatterns = [

    path('admin/', admin.site.urls),  # Django-Admin
    path('', include('account.urls')),  # Added account app
    path('passwordGenerator/', include('passwordGenerator.urls'), name='passwordGenerator'),  # Added passwords app
    path('userprofile/', include('userprofile.urls'), name='userprofile'),
    path('monitor/', include('monitor.urls'), name='monitor')

]
urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
