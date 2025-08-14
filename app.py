from flask import Flask, jsonify, request

app = Flask(__name__)
todos = []  # In-memory store for to-do items

@app.route('/')
def home():
    return jsonify({'message': 'Welcome to Web-Application-Automation API!'})

@app.route('/health')
def health():
    return jsonify({'status': 'healthy'})

@app.route('/todo', methods=['GET'])
def get_todos():
    return jsonify({'todos': todos})

@app.route('/todo', methods=['POST'])
def add_todo():
    todo = request.json.get('task')
    if todo:
        todos.append({'id': len(todos) + 1, 'task': todo, 'completed': False})
        return jsonify({'message': 'Todo added', 'todo': todos[-1]}), 201
    return jsonify({'error': 'Task is required'}), 400

@app.route('/todo/<int:id>', methods=['PUT'])
def update_todo(id):
    todo = next((item for item in todos if item['id'] == id), None)
    if todo:
        todo['completed'] = request.json.get('completed', todo['completed'])
        return jsonify({'message': 'Todo updated', 'todo': todo})
    return jsonify({'error': 'Todo not found'}), 404

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)