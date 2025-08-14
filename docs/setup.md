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
   ```bash
   git clone https://github.com/victordeman/Web-Application-Automation.git
   cd Web-Application-Automation
   ```

2. Run the setup script:
   ```bash
   chmod +x setup_web_app_automation.sh
   ./setup_web_app_automation.sh
   ```

3. Install Python dependencies:
   ```bash
   pip install -r src/app/requirements.txt
   ```

4. Run the application locally:
   ```bash
   cd src/app
   python app.py
   ```

5. Access the API at `http://localhost:5000`.
