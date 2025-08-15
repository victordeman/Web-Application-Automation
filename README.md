# Web-Application-Automation

This project is a scalable Flask web application deployed on Kubernetes (Minikube) with a monitoring and automation pipeline. It provides a RESTful API for managing a todo list, with endpoints for health checks, adding, retrieving, and updating todos, and exposing Prometheus metrics. The application is containerized with Docker, deployed using Kubernetes manifests, monitored with Prometheus and Grafana, and includes an automation script for error logging.

## Project Overview
- **Purpose**: Demonstrate a scalable web application with a CI/CD pipeline, Kubernetes deployment, and monitoring setup.
- **Features**:
  - Flask API with endpoints: `/`, `/health`, `/todo` (POST/GET), `/todo/<id>` (PUT), `/metrics`.
  - In-memory todo list storage (single replica for consistency).
  - Prometheus metrics for monitoring HTTP requests and system resources.
  - Grafana dashboards for visualizing metrics.
  - Automation script to log errors from Kubernetes pods.
  - CI pipeline with GitHub Actions for testing and linting.
- **Technologies**: Python 3.10.14, Flask, Gunicorn, Docker, Minikube, Kubernetes, Prometheus, Grafana, Pytest, Flake8.

## Repository Structure

Web-Application-Automation/
├── .github/
│   └── workflows/
│       └── ci.yml              # GitHub Actions CI pipeline for testing and linting
├── .gitignore                  # Ignores Python, Minikube, and editor artifacts
├── .python-version             # Specifies Python version (3.10.14)
├── app.py                      # Flask application with API endpoints
├── deployment/
│   ├── docker/
│   │   └── Dockerfile          # Docker configuration for building the app image
│   ├── helm/
│   │   └── webapp/
│   │       └── templates/
│   │           └── service-monitor.yaml  # Prometheus ServiceMonitor for metrics scraping
│   └── kubernetes/
│       ├── deployment.yaml     # Kubernetes Deployment for the Flask app
│       └── service.yaml        # Kubernetes Service (LoadBalancer) for external access
├── docs/                       # Empty directory for documentation
├── monitoring/                 # Empty directory for monitoring configurations
├── pytest.ini                  # Pytest configuration for running tests
├── README.md                   # Project documentation (this file)
├── requirements.txt            # Python dependencies
├── scripts/
│   └── monitor_logs.sh         # Shell script to monitor and log errors from pods
├── tests/
│   └── test_app.py             # Pytest unit tests for API endpoints


## Prerequisites
- **System Requirements**:
  - Ubuntu (or similar Linux distribution)
  - Python 3.10.14 (managed via `pyenv` recommended)
  - Docker
  - Minikube
  - kubectl
  - Helm
- **Software Installation**:
  ```bash
  # Install pyenv (if not already installed)
  curl https://pyenv.run | bash
  pyenv install 3.10.14
  pyenv global 3.10.14

  # Install Docker
  sudo apt-get update
  sudo apt-get install -y docker.io
  sudo usermod -aG docker $USER

  # Install Minikube
  curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
  sudo install minikube-linux-amd64 /usr/local/bin/minikube

  # Install kubectl
  curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
  chmod +x kubectl
  sudo mv kubectl /usr/local/bin/

  # Install Helm
  curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
