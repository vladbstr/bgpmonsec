
from .cpu_memory import get_router_info_cpu_mem_spec_all_routers
import time
from django.db import connection

def extract_cpu_memory():
    """Rulează colectarea CPU/memorie pentru toate routerele și loghează latența."""
    start_time = time.time()  # 🕒 Start timer

    result = get_router_info_cpu_mem_spec_all_routers()

    end_time = time.time()  # 🕒 Stop timer
    latency = (end_time - start_time) * 1000  # Convertim în milisecunde

    # 📝 Salvăm latența în baza de date manual
    cursor = connection.cursor()
    cursor.execute("""
        INSERT INTO bgpmonsec_project.latency ("router ID", latency, endpoint, "timestamp")
        VALUES (%s, %s, %s, NOW())
    """, ("Background Task", f"{latency:.2f}", "extract_cpu_memory"))
    connection.commit()
    cursor.close()


    return result

