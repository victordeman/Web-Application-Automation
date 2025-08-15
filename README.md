Web Application AutomationPurposeThis is the Web Application Automation project, a Flask-based web application deployed in a Minikube Kubernetes cluster for managing a todo API. It includes monitoring with Prometheus/Grafana, automation scripts, and a CI/CD pipeline. Future iterations will add persistent storage and enhanced monitoring. Have fun and if you like it, buy me a drink.Model DescriptionThe Web Application Automation project uses Flask, a lightweight Python web framework, to serve a todo API with endpoints for creating, listing, and updating tasks. The app is containerized with Docker, deployed on a Minikube Kubernetes cluster, and monitored with Prometheus and Grafana. The app.py file in the project root defines the API, using in-memory storage by default (todos = []) for simplicity, as specified in app.py. Future updates will integrate a database like PostgreSQL for persistence.Requirements FileThe script generates a requirements.txt file in Web-Application-Automation/ with the following Python dependencies required for the project:Flask (2.0.3)
Gunicorn (20.1.0)
Werkzeug (2.2.3)
Prometheus Flask Exporter (0.22.4)
Flake8 (6.0.0)
Pytest (8.4.1)

Repository: https://github.com/victordeman/Web-Application-AutomationFeaturesTodo API with endpoints for task management (GET /, /health, /todo, POST /todo, PUT /todo/<id>, GET /metrics).
Containerized deployment using Docker and Minikube.
Monitoring with Prometheus metrics and Grafana dashboards.
Automation script (monitor_logs.sh) for capturing pod error logs.
CI/CD pipeline with GitHub Actions for testing and linting.
Unit tests for API endpoints using Pytest.

SetupClone the repository: git clone https://github.com/victordeman/Web-Application-Automation
Install Python 3.10.14 (use pyenv if needed).
Create a virtual environment: python -m venv venv
Activate the virtual environment: source venv/bin/activate
Install dependencies: pip install -r requirements.txt
Run the Flask app locally: gunicorn --bind 0.0.0.0:5000 --log-level info app:app
Test endpoints (e.g., curl http://localhost:5000).
For Kubernetes deployment, install Docker, Minikube, kubectl, and Helm.
Build Docker image: export DOCKER_BUILDKIT=1; docker build -t webapp:latest -f deployment/docker/Dockerfile .
Load image to Minikube: minikube image load webapp:latest
Deploy to Minikube: minikube start; kubectl apply -f deployment/kubernetes/; minikube tunnel
Access monitoring: Install Prometheus/Grafana via Helm and port-forward to localhost:9090 (Prometheus) and localhost:8080 (Grafana).

RequirementsPython 3.10.14
Docker, Minikube, kubectl, Helm
Git, curl

LicenseMIT


