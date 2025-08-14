#!/bin/bash

# Script to set up the repository structure for the Web-Application-Automation project
# Project Name: Web-Application-Automation
# GitHub: https://github.com/victordeman/Web-Application-Automation
# This script creates the folder structure and pre-fills key files with content.
# It does not install dependencies or push to Git (to be done manually).

# Define project root directory (current directory)
PROJECT_ROOT=$(pwd)
PROJECT_NAME="Web-Application-Automation"

echo "Creating repository structure for $PROJECT_NAME in $PROJECT_ROOT..."

# Create directory structure
mkdir -p "$PROJECT_ROOT/src/app" \
         "$PROJECT_ROOT/src/scripts" \
         "$PROJECT_ROOT/config" \
         "$PROJECT_ROOT/tests" \
         "$PROJECT_ROOT/deployment/docker" \
         "$PROJECT_ROOT/deployment/kubernetes" \
         "$PROJECT_ROOT/deployment/terraform" \
         "$PROJECT_ROOT/deployment/ansible" \
         "$PROJECT_ROOT/deployment/helm/webapp/templates" \
         "$PROJECT_ROOT/monitoring" \
         "$PROJECT_ROOT/docs" \
         "$PROJECT_ROOT/.github/workflows"

# Create and populate README.md
cat << EOF > "$PROJECT_ROOT/README.md"
# Web-Application-Automation

This project demonstrates a scalable web application deployment pipeline with automation, containerization, orchestration, and monitoring. It showcases DevOps practices using CI/CD, cloud infrastructure, Kubernetes, and observability tools. The application is a simple Python Flask REST API deployed on a Kubernetes cluster with automated provisioning and monitoring.

GitHub: [https://github.com/victordeman/Web-Application-Automation](https://github.com/victordeman/Web-Application-Automation)

## Project Structure

- **src/app/**: Core application code (e.g., Flask REST API).
- **src/scripts/**: Utility scripts for automation tasks.
- **config/**: Configuration files for the application and tools.
- **tests/**: Unit and integration tests for the application.
- **deployment/**:
  - **docker/**: Dockerfile and Docker Compose configurations.
  - **kubernetes/**: Kubernetes manifests for deployment.
  - **terraform/**: Infrastructure as Code (IaC) for provisioning.
  - **ansible/**: Ansible playbooks for configuration management.
  - **helm/**: Helm charts for Kubernetes deployment.
- **monitoring/**: Prometheus, Grafana, and logging configurations.
- **docs/**: Documentation for setup, deployment, and usage.
- **.github/workflows/**: GitHub Actions for CI/CD pipelines.

## Prerequisites

- Python 3.8+
- Docker
- Kubernetes (e.g., Minikube or a cloud provider)
- Terraform
- Ansible
- Helm
- Git

## Setup Instructions

1. Clone the repository:
   \`\`\`bash
   git clone https://github.com/victordeman/Web-Application-Automation.git
   cd Web-Application-Automation
   \`\`\`

2. Run the setup script to initialize the project structure:
   \`\`\`bash
   chmod +x setup_web_app_automation.sh
   ./setup_web_app_automation.sh
   \`\`\`

3. Install dependencies (manually for now):
   - Install Python dependencies: \`pip install -r src/app/requirements.txt\`
   - Install other tools as needed (Docker, Kubernetes, etc.).

## Running the Application Locally

1. Start the Flask app:
   \`\`\`bash
   cd src/app
   python app.py
   \`\`\`

2. Access the API at \`http://localhost:5000\`.

## Deployment

- **Docker**: Build and run the Docker container using the Dockerfile in \`deployment/docker/\`.
- **Kubernetes**: Apply manifests in \`deployment/kubernetes/\` or use Helm charts in \`deployment/helm/\`.
- **Terraform**: Provision infrastructure using scripts in \`deployment/terraform/\`.
- **Ansible**: Configure servers using playbooks in \`deployment/ansible/\`.

## CI/CD

GitHub Actions workflows in \`.github/workflows/\` handle linting, testing, building, and deployment.

## Monitoring

Prometheus and Grafana configurations in \`monitoring/\` provide observability for the application.

## Contributing

Contributions are welcome! Please open an issue or pull request on GitHub.

## License

MIT License
EOF

# Create and populate .gitignore
cat << EOF > "$PROJECT_ROOT/.gitignore"
# Python
__pycache__/
*.pyc
*.pyo
*.pyd
.Python
env/
venv/
*.egg-info/
dist/
build/

# IDEs and Editors
.idea/
.vscode/
*.sublime-*

# OS Files
.DS_Store
Thumbs.db

# Virtual Environments
.env
.envrc

# Logs
*.log

# Testing
.coverage
coverage.xml
*.cache

# Docker
docker-compose.override.yml

# Terraform
.terraform/
*.tfstate
*.tfstate.backup

# Kubernetes
*.kube
EOF

# Create a basic Flask app in src/app/app.py
cat << EOF > "$PROJECT_ROOT/src/app/app.py"
from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/')
def home():
    return jsonify({'message': 'Welcome to Web-Application-Automation API!'})

@app.route('/health')
def health():
    return jsonify({'status': 'healthy'})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
EOF

# Create requirements.txt for Python dependencies
cat << EOF > "$PROJECT_ROOT/src/app/requirements.txt"
flask==2.0.3
gunicorn==20.1.0
EOF

# Create a sample Dockerfile
cat << EOF > "$PROJECT_ROOT/deployment/docker/Dockerfile"
FROM python:3.8-slim

WORKDIR /app
COPY src/app /app
RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 5000
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
EOF

# Create a sample Kubernetes deployment manifest
cat << EOF > "$PROJECT_ROOT/deployment/kubernetes/deployment.yaml"
apiVersion: apps/v1
kind: Deployment
metadata:
  name: webapp
  labels:
    app: webapp
spec:
  replicas: 3
  selector:
    matchLabels:
      app: webapp
  template:
    metadata:
      labels:
        app: webapp
    spec:
      containers:
      - name: webapp
        image: webapp:latest
        ports:
        - containerPort: 5000
        resources:
          limits:
            cpu: "500m"
            memory: "512Mi"
          requests:
            cpu: "200m"
            memory: "256Mi"
EOF

# Create a sample Kubernetes service manifest
cat << EOF > "$PROJECT_ROOT/deployment/kubernetes/service.yaml"
apiVersion: v1
kind: Service
metadata:
  name: webapp-service
spec:
  selector:
    app: webapp
  ports:
    - protocol: TCP
      port: 80
      targetPort: 5000
  type: LoadBalancer
EOF

# Create a sample Helm values file
cat << EOF > "$PROJECT_ROOT/deployment/helm/webapp/values.yaml"
replicaCount: 3

image:
  repository: webapp
  tag: latest
  pullPolicy: IfNotPresent

service:
  type: LoadBalancer
  port: 80
  targetPort: 5000

resources:
  limits:
    cpu: "500m"
    memory: "512Mi"
  requests:
    cpu: "200m"
    memory: "256Mi"
EOF

# Create a sample GitHub Actions CI workflow
cat << EOF > "$PROJECT_ROOT/.github/workflows/ci.yml"
name: CI Pipeline

on:
  push:
    branches:
      - main
  pull_request:
    branches:
      - main

jobs:
  build-and-test:
    runs-on: ubuntu-latest
    steps:
    - name: Checkout code
      uses: actions/checkout@v3

    - name: Set up Python
      uses: actions/setup-python@v4
      with:
        python-version: '3.8'

    - name: Install dependencies
      run: |
        python -m pip install --upgrade pip
        pip install -r src/app/requirements.txt

    - name: Run tests
      run: |
        pip install pytest
        pytest tests/

    - name: Build Docker image
      run: |
        docker build -t webapp:latest -f deployment/docker/Dockerfile .
EOF

# Create a sample test file
cat << EOF > "$PROJECT_ROOT/tests/test_app.py"
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
EOF

# Create a sample documentation file
cat << EOF > "$PROJECT_ROOT/docs/setup.md"
# Setup Guide

This guide explains how to set up the Web-Application-Automation project locally.

## Prerequisites

- Python 3.8+
- Docker
- Kubernetes (Minikube or cloud-based)
- Terraform
- Ansible
- Helm

## Steps

1. Clone the repository:
   \`\`\`bash
   git clone https://github.com/victordeman/Web-Application-Automation.git
   cd Web-Application-Automation
   \`\`\`

2. Run the setup script:
   \`\`\`bash
   chmod +x setup_web_app_automation.sh
   ./setup_web_app_automation.sh
   \`\`\`

3. Install Python dependencies:
   \`\`\`bash
   pip install -r src/app/requirements.txt
   \`\`\`

4. Run the application locally:
   \`\`\`bash
   cd src/app
   python app.py
   \`\`\`

5. Access the API at \`http://localhost:5000\`.
EOF

echo "Repository structure and files created successfully!"
echo "Next steps:"
echo "1. Initialize a Git repository: 'git init'"
echo "2. Add files to Git: 'git add .'"
echo "3. Commit changes: 'git commit -m \"Initial commit\"'"
echo "4. Push to GitHub (after setting remote): 'git push origin main'"
echo "5. Install dependencies: 'pip install -r src/app/requirements.txt'"
echo "6. Run tests: 'pytest tests/'"
