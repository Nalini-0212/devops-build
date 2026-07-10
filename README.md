# React Application Deployment Using DevOps Practices

## Project Overview

This project demonstrates a complete end-to-end DevOps implementation for deploying a React application using industry-standard DevOps tools and best practices.

The application has been:

- Containerized using Docker
- Managed using Docker Compose
- Version controlled using Git and GitHub
- Automated using Jenkins CI/CD
- Stored in Docker Hub
- Hosted on AWS EC2
- Monitored using Prometheus
- Visualized using Grafana
- Alerted using Alertmanager
- Health checked using Blackbox Exporter

---

# Submission Details

## GitHub Repository

```text
https://github.com/Nalini-0212/devops-build.git
```

## Original Repository

```text
https://github.com/sriram-R-krishnan/devops-build
```

## Deployed Application

```text
http://3.110.154.104
```

---

# Docker Images

## Development Image

```text
naliniselv/react-app-dev
```

## Production Image

```text
naliniselv/react-app-prod
```

---

# Technologies Used

- React
- Docker
- Docker Compose
- Git
- GitHub
- Jenkins
- Docker Hub
- AWS EC2
- Prometheus
- Grafana
- Alertmanager
- Blackbox Exporter

---

# Solution Architecture

```text
                            GitHub Repository
                                    │
                                    ▼
                               DEV Branch
                                    │
                                    ▼
                      Jenkins Development Pipeline
                                    │
                                    ▼
                          Checkout Source Code
                                    │
                                    ▼
                               Docker Login
                                    │
                                    ▼
                           Build Docker Image
                                    │
                                    ▼
                 Push Image to Docker Hub DEV Repository
                                    │
                                    ▼
                          Manual Deployment
                                    │
                                    ▼
                         Testing & Validation
                                    │
                                    ▼
                          Create Pull Request
                                    │
                                    ▼
                               Code Review
                                    │
                                    ▼
                             Merge DEV → MAIN
                                    │
                                    ▼
                      Jenkins Production Pipeline
                                    │
                                    ▼
                          Checkout Source Code
                                    │
                                    ▼
                               Docker Login
                                    │
                                    ▼
                     Build Production Docker Image
                                    │
                                    ▼
                Push Image to Docker Hub PROD Repository
                                    │
                                    ▼
                    Automatic Deployment to AWS EC2
                                    │
                                    ▼
                       React Application (Port 80)

═══════════════════════════════════════════════════════

                        AWS Monitoring Server

                         Blackbox Exporter
                                  │
                                  ▼
                             Prometheus
                                  │
                 ┌────────────────┴────────────────┐
                 │                                 │
                 ▼                                 ▼
              Grafana                       Alertmanager
                 │                                 │
                 └────────────► Email Alert ◄─────┘
```

---

# AWS Infrastructure

## EC2 Instance 1 – Application & Jenkins Server

### Purpose

- Jenkins CI/CD
- Docker Engine
- Docker Compose
- React Application Hosting

### Instance Type

```text
t2.micro
```

### Components Hosted

```text
Jenkins
Docker
Docker Compose
React Application
```

### Application URL

```text
http://3.110.154.104
```

---

## EC2 Instance 2 – Monitoring Server

### Purpose

- Application Monitoring
- Dashboard Visualization
- Alerting

### Components Hosted

```text
Prometheus
Grafana
Alertmanager
Blackbox Exporter
```

---

# Project Structure

```text
# Project Structure

```text
devops-build/
│
├── app/
│   └── build/
│
├── docker/
│   ├── Dockerfile
│   └── docker-compose.yml
│
├── jenkins/
│   └── Jenkinsfile
│
├── scripts/
│   ├── build.sh
│   └── deploy.sh
│
├── monitoring/
│   ├── prometheus.yml
│   ├── blackbox.yml
│   ├── alerts.yml
│   └── alertmanager.yml
│
├── docs/
│   └── Application_Deployment.pdf
│       (Detailed implementation guide,
│        deployment steps, configurations,
│        and supporting screenshots)
|
├── screenshots/
│   ├── application/
│   ├── aws/
│   ├── dockerhub/
│   ├── jenkins/
│   └── monitoring/
│
├── .dockerignore
├── .gitignore
├── LICENSE
└── README.md
```

---

# Docker Configuration

## Dockerfile

The React application is served using Nginx Alpine for lightweight and production-ready deployment.

### Features

- Lightweight image
- Fast startup time
- Static content hosting
- Production-ready configuration
- Port 80 exposure

### Build Command

```bash
docker build -t react-app -f docker/Dockerfile .
```

---

## Docker Compose

### docker-compose.yml

```yaml
version: "3.8"

services:
  react-app:
    image: ${IMAGE_NAME}
    container_name: react-app-container
    ports:
      - "80:80"
    restart: unless-stopped
```

### Development Deployment

```bash
IMAGE_NAME=naliniselv/react-app-dev:latest \
docker compose -f docker/docker-compose.yml up -d
```

### Production Deployment

```bash
IMAGE_NAME=naliniselv/react-app-prod:latest \
docker compose -f docker/docker-compose.yml up -d
```

### Verify Deployment

```bash
docker ps
```

### Verify Docker Compose Configuration

```bash
docker compose -f docker/docker-compose.yml config
```

> **Note:** The docker-compose.yml file uses the `IMAGE_NAME` environment variable. The image name must be passed during deployment or configured in an `.env` file.

---

# Bash Scripts

## build.sh

### Purpose

- Build Docker image
- Tag image appropriately

### Execution

```bash
IMAGE_NAME=naliniselv/react-app-dev:latest ./scripts/build.sh
```

---

## deploy.sh

### Purpose

- Pull latest Docker image
- Remove existing container
- Deploy updated container

### Execution

```bash
IMAGE_NAME=naliniselv/react-app-prod:latest ./scripts/deploy.sh
```

---

# Git Branching Strategy

The project follows a two-branch deployment model.

## Development Branch

### Branch

```text
dev
```

### Purpose

- Feature Development
- Testing
- Validation

### Workflow

```text
Developer Push
      │
      ▼
DEV Branch
      │
      ▼
Jenkins DEV Pipeline
      │
      ▼
Build Docker Image
      │
      ▼
Push Docker Image to Docker Hub DEV Repository
      │
      ▼
Manual Deployment
      │
      ▼
Testing & Validation
```

### Docker Repository

```text
naliniselv/react-app-dev
```

### Deployment

```text
Manual Deployment
```

---

## Pull Request Process

```text
Development Validation
        │
        ▼
Create Pull Request
        │
        ▼
Code Review
        │
        ▼
Merge DEV → MAIN
```

---

## Production Branch

### Branch

```text
main
```

### Purpose

- Stable Releases
- Production Deployment

### Workflow

```text
Merge DEV → MAIN
        │
        ▼
Jenkins Production Pipeline
        │
        ▼
Build Production Docker Image
        │
        ▼
Push Docker Image to Docker Hub PROD Repository
        │
        ▼
Automatic Deployment to AWS EC2
```

### Docker Repository

```text
naliniselv/react-app-prod
```

### Deployment

```text
Automatic Deployment
```

---

# Git Commands Used

## Clone Repository

```bash
git clone https://github.com/Nalini-0212/devops-build.git
```

## Switch Branch

```bash
git checkout dev
```

## Commit Changes

```bash
git add .
git commit -m "Application updates"
git push origin dev
```

---

## Pull Request Workflow

```text
GitHub
   │
   ▼
Create Pull Request
   │
   ▼
dev → main
   │
   ▼
Review & Approve
   │
   ▼
Merge
```

---

# .gitignore

```gitignore
*.log
*.tmp
*.swp

coverage/

.vscode/

.env

node_modules/

.DS_Store
Thumbs.db
```

### Purpose

- Ignore logs
- Ignore environment files
- Ignore IDE files
- Ignore local dependencies

---

# .dockerignore

```dockerignore
.git
.github
.gitignore

node_modules
npm-debug.log

monitoring/
jenkins/
screenshots/

README.md
LICENSE

*.md
*.log
*.tmp

.vscode
.idea
```

### Purpose

- Reduce Docker build context
- Faster image builds
- Exclude unnecessary files

---

# Docker Hub Repository Configuration

## Development Repository

```text
naliniselv/react-app-dev
```

### Visibility

```text
Public
```

---

## Production Repository

```text
naliniselv/react-app-prod
```

### Visibility

```text
Private
```

---

# Jenkins CI/CD Pipeline

## Development Pipeline

### Trigger

```text
Push to DEV Branch
```

### Trigger Method

```text
GitHub Webhook → Jenkins Multibranch Pipeline
```

### Pipeline Flow

```text
Checkout Repository
        ↓
Docker Login
        ↓
Build Docker Image
        ↓
Push Docker Image to Docker Hub DEV Repository
```

### Generated Images

```text
naliniselv/react-app-dev:latest
naliniselv/react-app-dev:<BUILD_NUMBER>
```

### Deployment

```text
Manual Deployment
```

---

## Production Pipeline

### Trigger

```text
Merge DEV Branch into MAIN Branch
```

### Trigger Method

```text
GitHub Webhook → Jenkins Multibranch Pipeline
```

### Pipeline Flow

```text
Checkout Repository
        ↓
Docker Login
        ↓
Build Docker Image
        ↓
Push Docker Image to Docker Hub PROD Repository
        ↓
Automatic Deployment to AWS EC2
```

### Generated Images

```text
naliniselv/react-app-prod:latest
naliniselv/react-app-prod:<BUILD_NUMBER>
```

### Deployment

```text
Automatic Deployment
```

---

# AWS Security Group Configuration

## Application Access

| Service | Port | Source |
|----------|------|---------|
| HTTP | 80 | 0.0.0.0/0 |

## SSH Access

| Service | Port | Source |
|----------|------|---------|
| SSH | 22 | My Public IP Only |

---

# Monitoring Setup

A dedicated AWS EC2 instance is used for monitoring and alerting.

## Monitoring Components

- Prometheus
- Grafana
- Alertmanager
- Blackbox Exporter

---

# Application Health Monitoring

## Monitored URL

```text
http://3.110.154.104
```

## Health Check Query

```promql
probe_success
```

### Status

```text
1 = Application UP
0 = Application DOWN
```

---

## Alert Condition

```promql
probe_success == 0
```

If the application becomes unavailable, Prometheus triggers Alertmanager, which sends an email notification.

---

# Response Time Monitoring

## Query

```promql
probe_duration_seconds
```

## Metrics Tracked

- Application Availability
- Response Time
- Latency
- Uptime

---

# Grafana Dashboard

A Grafana dashboard has been created for monitoring application health and performance.

## Dashboard Panels

### Application Status

Query:

```promql
probe_success
```

Display:

```text
UP / DOWN
```

---

### Application Response Time

Query:

```promql
probe_duration_seconds
```

Display:

```text
Response Time Graph
```

---

# Alerting

Alertmanager is configured to send notifications when the application becomes unavailable.

## Alert Rule

```yaml
alert: ApplicationDown
expr: probe_success == 0
for: 1m
labels:
  severity: critical
annotations:
  summary: Application is Down
```

## Notification Method

```text
Email Notification
```

## Condition

```text
Email is sent only when the application remains DOWN for more than 1 minute.
```

---

# Documentation

The document provides detailed step-by-step implementation procedures, configuration details, validation results, troubleshooting references, and supporting screenshots.

---

# Screenshots Structure

```text
screenshots/
│
├── aws/
│   ├── ec2-console.png
│   └── security-group.png
│
├── jenkins/
│   ├── login-page.png
│   ├── job-configuration.png
│   ├── successful-pipeline-completion.png
│   ├── docker-build-console.png
│   ├── docker-push-console.png
│   └── console-output.txt
│
├── dockerhub/
│   ├── dev-repository.png
│   └── prod-repository.png
│
├── application/
│   └── deployed-homepage.png
│
└── monitoring/
    ├── grafana-dashboard.png
    ├── application-status-panel.png
    ├── response-time-panel.png
    ├── prometheus-targets.png
    ├── alertmanager.png
    └── email-alert.png
```

---

# Screenshots Included

## Jenkins

- Jenkins Login Page
- Job Configuration
- Pipeline Configuration
- Docker Build Logs
- Docker Push Logs
- Successful Build

## AWS

- EC2 Console
- Security Group Settings

## Docker Hub

- Development Repository
- Production Repository
- Image Tags

## Application

- Deployed Application Home Page

## Monitoring

- Grafana Dashboard
- Application Status Panel
- Response Time Panel
- Prometheus Targets
- Alertmanager Configuration
- Email Alert Notification

---

# Deliverables Completed

✅ Dockerfile Creation

✅ Docker Compose Configuration

✅ Build Script Creation

✅ Deployment Script Creation

✅ Git CLI Workflow

✅ GitHub Branching Strategy

✅ Jenkins Multi-Branch CI/CD

✅ Docker Hub Integration

✅ Development Repository (Public)

✅ Production Repository (Private)

✅ AWS EC2 Deployment

✅ React Application Running on Port 80

✅ Separate Monitoring Infrastructure

✅ Prometheus Monitoring

✅ Grafana Dashboard

✅ Alertmanager Configuration

✅ Email Notifications

✅ Blackbox Exporter Health Monitoring

---

# Author

**Nalini Selvaraj**

GitHub:

```text
https://github.com/Nalini-0212/devops-build.git
```