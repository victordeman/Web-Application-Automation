import sys
import os
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))
try:
    from app import app
except ImportError as e:
    print(f"ImportError: {e}")
    raise

import pytest

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

def test_add_todo(client):
    response = client.post('/todo', json={'task': 'Buy groceries'})
    assert response.status_code == 201
    assert response.json['message'] == 'Todo added'
    assert response.json['todo']['task'] == 'Buy groceries'

def test_get_todos(client):
    client.post('/todo', json={'task': 'Buy groceries'})
    response = client.get('/todo')
    assert response.status_code == 200
    assert len(response.json['todos']) > 0

def test_update_todo(client):
    client.post('/todo', json={'task': 'Buy groceries'})
    response = client.put('/todo/1', json={'completed': True})
    assert response.status_code == 200
    assert response.json['todo']['completed'] is True