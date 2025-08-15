## Repository Structure

```
Reco-AI-Agent/
├── api/
│   ├── endpoints/           # FastAPI endpoint definitions
│   ├── models/             # Pydantic models for data validation
│   ├── services/           # Business logic and AI agent integration
├── frontend/               # Streamlit frontend code
├── tests/                  # Pytest test cases
├── config/                 # Configuration files (e.g., database, environment)
├── migrations/             # Alembic migration scripts for PostgreSQL
├── scripts/                # Utility scripts
├── docs/                   # Documentation
├── .gitignore              # Git ignore file
├── README.md               # Project documentation
├── requirements.txt         # Python dependencies
├── main.py                 # FastAPI application entry point
└── docker-compose.yml      # Docker Compose for local development
```
Setup InstructionsClone the Repository:bash

git clone https://github.com/victordeman/Web-Application-Automation
cd Web-Application-Automation

Set Up Python Environment:bash

pyenv install 3.10.14
pyenv local 3.10.14
python -m venv venv
source venv/bin/activate
pip install -r requirements.txt

Run Locally:bash

gunicorn --bind 0.0.0.0:5000 --log-level info app:app

Run Tests:bash

pytest tests/

Build Docker Image:bash

export DOCKER_BUILDKIT=1
docker build -t webapp:latest -f deployment/docker/Dockerfile .
minikube image load webapp:latest

Deploy to Minikube:bash

minikube start
kubectl apply -f deployment/kubernetes/
minikube tunnel

Set Up Monitoring:bash

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
helm install prometheus prometheus-community/kube-prometheus-stack --namespace monitoring --create-namespace

UsageAccess the API at http://192.168.49.2:30663 (Minikube) or http://localhost:5000 (local) to manage todos, check health, or view metrics.
Monitor metrics at http://localhost:9090 (Prometheus) or http://localhost:8080 (Grafana) after port-forwarding:bash

kubectl port-forward svc/prometheus-kube-prometheus-prometheus 9090:9090 -n monitoring
kubectl port-forward svc/grafana 8080:80 -n monitoring

Run the automation script to monitor logs:bash

./scripts/monitor_logs.sh

ContributingFork the repository.
Create a feature branch (git checkout -b feature/your-feature).
Commit changes (git commit -m "Add your feature").
Push to the branch (git push origin feature/your-feature).
Open a pull request.

LicenseMIT License

