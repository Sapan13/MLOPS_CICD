from fastapi.testclient import TestClient
from app.main import app

client = TestClient(app)


def test_home():
    response = client.get("/")
    assert response.status_code == 200
    assert response.json()["message"] == (
        "Python CI/CD deployed successfully"
    )


def test_add():
    response = client.get("/add?a=2&b=3")
    assert response.status_code == 200
    assert response.json() == {"result": 5}


def test_add_negative_numbers():
    response = client.get("/add?a=-2&b=-3")
    assert response.status_code == 200
    assert response.json() == {"result": -5}