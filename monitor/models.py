from django.db import models

class Router(models.Model):
    name = models.CharField(max_length=100)
    ip_address = models.GenericIPAddressField()
    rpki_status = models.CharField(max_length=50, default='unknown')  # Status: configured, not_configured, disabled

    def __str__(self):
        return self.name