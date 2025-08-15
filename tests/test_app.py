import pytest
from app import app

@pytest.fixture
def client():
    app.config['TESTING'] = True
    with app.test_client() as client:
        yield client

def test_home(client):
    response = client.get('/')
    assert response.status_code == 200
    assert response.json == {'message': 'Welcome to Web-Application-Automation API!'}

def test_health(client):
    response = client.get('/health')
    assert response.status_code == 200
    assert response.json == {'status': 'healthy'}

def test_todo_post(client):
    response = client.post('/todo', json={'task': 'Test task'})
    assert response.status_code == 200
    assert response.json['message'] == 'Todo added'
    assert response.json['todo']['task'] == 'Test task'

def test_todo_post_invalid(client):
    response = client.post('/todo', json={})
    assert response.status_code == 400
    assert response.json['error'] == 'Task is required'

def test_todo_get(client):
    client.post('/todo', json={'task': 'Test task'})
    response = client.get('/todo')
    assert response.status_code == 200
    assert len(response.json['todos']) > 0

def test_todo_update(client):
    client.post('/todo', json={'task': 'Test task'})
    response = client.put('/todo/1', json={'completed': True})
    assert response.status_code == 200
    assert response.json['message'] == 'Todo updated'
    assert response.json['todo']['completed'] is True
