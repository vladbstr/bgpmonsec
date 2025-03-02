import os
import django

# Setează Django settings manual
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "settings")
django.setup()

from django_celery_beat.models import PeriodicTask, IntervalSchedule
import json

# Crează un nou interval de 15 secunde (dacă nu există deja)
schedule, created = IntervalSchedule.objects.get_or_create(
    every=15,
    period=IntervalSchedule.SECONDS
)

# Șterge task-ul vechi (dacă există)
PeriodicTask.objects.filter(name="Monitor CPU and Memory").delete()

# Crează un task nou
PeriodicTask.objects.create(
    interval=schedule,
    name="Monitor CPU and Memory",
    task="monitor.tasks.monitor_cpu_memory",
    enabled=True,
    kwargs=json.dumps({})
)

print("✅ Task-ul periodic a fost recreat cu succes!")
