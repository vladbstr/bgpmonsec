from django.db import models


class RouterInput(models.Model):
    ip_address = models.GenericIPAddressField()
    protocol = models.CharField(max_length=10)  # SSH or Telnet
    username = models.CharField(max_length=50)
    password = models.CharField(max_length=50)
