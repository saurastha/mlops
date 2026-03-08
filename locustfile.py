from locust import HttpUser, between, task


class MyMLAppUser(HttpUser):
    wait_time = between(1, 2)

    @task
    def test_root_get(self):
        self.client.get("/")

    @task
    def test_health_get(self):
        self.client.get("/health")
