import pytest
from src.app.app import app

@pytest.fixture
def client():
    app.testing = True
    return app.test_client()

def test_home_endpoint(client):
    response = client.get('/')
    assert response.status_code == 200
    assert response.json == {'message': 'Welcome to Web-Application-Automation API!'}

def test_health_endpoint(client):
    response = client.get('/health')
    assert response.status_code == 200
    assert response.json == {'status': 'healthy'}
