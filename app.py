from flask import Flask, jsonify, request
from prometheus_flask_exporter import PrometheusMetrics

app = Flask(__name__)
metrics = PrometheusMetrics(app)
todos = []

@app.route('/')
def home():
    return jsonify({'message': 'Welcome to Web-Application-Automation API!'})

@app.route('/health')
def health():
    return jsonify({'status': 'healthy'})

@app.route('/todo', methods=['POST'])
def add_todo():
    data = request.get_json()
    if not data or 'task' not in data:
        return jsonify({'error': 'Task is required'}), 400
    todo = {'id': len(todos) + 1, 'task': data['task'], 'completed': False}
    todos.append(todo)
    return jsonify({'message': 'Todo added', 'todo': todo}), 200

@app.route('/todo', methods=['GET'])
def get_todos():
    return jsonify({'todos': todos})

@app.route('/todo/<int:id>', methods=['PUT'])
def update_todo(id):
    data = request.get_json()
    for todo in todos:
        if todo['id'] == id:
            todo['completed'] = data.get('completed', todo['completed'])
            return jsonify({'message': 'Todo updated', 'todo': todo})
    return jsonify({'error': 'Todo not found'}), 404

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
