## Local Setup
1. Activate virtual environment: `source venv/bin/activate`
2. Install dependencies: `pip install -r requirements.txt`
3. Run app: `gunicorn --bind 0.0.0.0:5000 --log-level info app:app`
4. Run tests: `pytest`
5. Build Docker: `docker build -t webapp:latest -f deployment/docker/Dockerfile .`
6. Run in Minikube: `kubectl apply -f deployment/kubernetes/`
7. Monitor: `helm install prometheus kube-prometheus-stack --namespace monitoring`
8. Automation: `./scripts/monitor_logs.sh`

## Challenges
- Fixed Minikube by caching images locally.
- Deployed app in Kubernetes with Minikube manifests.
- Fixed `/todo` GET issue by reducing replicas to 1.
- Added ServiceMonitor for Prometheus metrics.
- Created automation script for error logging.
