# Web-Application-Automation

This project demonstrates a scalable web application deployment pipeline with automation, containerization, orchestration, and monitoring. It showcases DevOps practices using CI/CD, cloud infrastructure, Kubernetes, and observability tools. The application is a simple Python Flask REST API deployed on a Kubernetes cluster with automated provisioning and monitoring.

GitHub: [https://github.com/victordeman/Web-Application-Automation](https://github.com/victordeman/Web-Application-Automation)

## Project Structure

- **app.py**: Core Flask application code.
- **requirements.txt**: Python dependencies for the application.
- **tests/**: Unit and integration tests.
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
   ```bash
   git clone https://github.com/victordeman/Web-Application-Automation.git
   cd Web-Application-Automation
   ```

2. Run the setup script to initialize the project structure:
   ```bash
   chmod +x setup_web_app_automation.sh
   ./setup_web_app_automation.sh
   ```

3. Install dependencies (from the root directory):
   ```bash
   pip install -r requirements.txt
   ```

## Running the Application Locally

1. Start the Flask app (from the root directory):
   ```bash
   python app.py
   ```

2. Access the API at `http://localhost:5000`.

## Deployment

- **Docker**: Build and run the Docker container using the Dockerfile in `deployment/docker/`.
- **Kubernetes**: Apply manifests in `deployment/kubernetes/` or use Helm charts in `deployment/helm/`.
- **Terraform**: Provision infrastructure using scripts in `deployment/terraform/`.
- **Ansible**: Configure servers using playbooks in `deployment/ansible/`.

## CI/CD

GitHub Actions workflows in `.github/workflows/` handle linting, testing, building, and deployment.

## Monitoring

Prometheus and Grafana configurations in `monitoring/` provide observability for the application.

## Contributing

Contributions are welcome! Please open an issue or pull request on GitHub.

## License

MIT License
