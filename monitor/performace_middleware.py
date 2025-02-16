import time
import psycopg2
from django.utils.deprecation import MiddlewareMixin
from .connections import database_connection

class ThroughputMiddleware(MiddlewareMixin):
    def __init__(self, get_response):
        self.get_response = get_response
        self.last_request_time = time.time()
        self.request_count = 0
        self.timeframe = 5  # 🕒 Măsurăm la fiecare 5 secunde

    def __call__(self, request):
        start_time = time.time()
        response = self.get_response(request)
        end_time = time.time()

        # Incrementăm numărul de request-uri
        self.request_count += 1
        elapsed_time = end_time - self.last_request_time

        if elapsed_time > self.timeframe:  # ✅ Salvăm la fiecare `timeframe` secunde
            throughput = self.request_count / self.timeframe
            self.request_count = 0
            self.last_request_time = end_time

            # Salvăm throughput-ul în baza de date
            try:
                conn = database_connection()
                cursor = conn.cursor()
                cursor.execute("""
                    INSERT INTO bgpmonsec_project.throughput (throughput_value, timeframe)
                    VALUES (%s, %s);
                """, (throughput, self.timeframe))
                conn.commit()
                cursor.close()
                conn.close()
                print(f"✅ Throughput salvat: {throughput:.2f} requests/sec în {self.timeframe}s")
            except Exception as e:
                print(f"❌ Eroare la salvarea throughput-ului: {e}")

        return response