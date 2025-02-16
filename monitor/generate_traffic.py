import requests
import threading
import time

URL = "https://127.0.0.1/monitor/get_unread_alerts_count/"  # Modifică URL-ul dacă e cazul
NUM_REQUESTS = 1000  # Numărul total de request-uri
CONCURRENCY = 20  # Câte request-uri se trimit simultan

def send_request():
    try:
        response = requests.get(URL, verify=False)  # Dezactivează verificarea SSL local
        print(f"Status Code: {response.status_code}")
    except Exception as e:
        print(f"Error: {e}")

def stress_test():
    threads = []
    for _ in range(NUM_REQUESTS):
        thread = threading.Thread(target=send_request)
        thread.start()
        threads.append(thread)
        time.sleep(0.01)  # Mică pauză pentru a simula trafic real

    for thread in threads:
        thread.join()

if __name__ == "__main__":
    print("Starting stress test...")
    stress_test()
    print("Test completed.")