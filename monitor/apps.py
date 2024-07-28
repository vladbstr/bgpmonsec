from django.apps import AppConfig
import asyncio
import threading

class MyAppConfig(AppConfig):
    name = 'monitor'

    def ready(self):
        from . import async_tasks
        
        def start_async_tasks():
            loop = asyncio.new_event_loop()
            asyncio.set_event_loop(loop)
            loop.create_task(async_tasks.periodic_task(30, async_tasks.get_router_info_cpu_mem_spec_all_routers))
            loop.create_task(async_tasks.periodic_task(30, async_tasks.extract_and_update_router_details))
            loop.run_forever()

        threading.Thread(target=start_async_tasks, daemon=True).start()
