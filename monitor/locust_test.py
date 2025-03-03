from locust import HttpUser, task, between

class LoadTest(HttpUser):
    host = "https://127.0.0.1"  
    wait_time = between(1, 3)

    @task
    def test_router_details(self):
        self.client.get("/monitor/router_details/07112416161534109/", verify=False)  

    @task
    def test_bgp_stats(self):
        self.client.get("/monitor/api/get-bgp-stats/", verify=False)  

    @task
    def test_database_connection_time_request(self):
        self.client.get("/monitor/router_cpu_mem/07112416161534109/", verify=False)  



    
