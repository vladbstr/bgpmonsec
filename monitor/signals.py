import asyncio
from django.db.models.signals import ready
from django.dispatch import receiver
from django.apps import AppConfig
from . import async_tasks

@receiver(ready)
def start_periodic_tasks(sender, **kwargs):
    loop = asyncio.get_event_loop()
    loop.create_task(async_tasks.periodic_task(30, async_tasks.get_router_info_cpu_mem_spec_all_routers))