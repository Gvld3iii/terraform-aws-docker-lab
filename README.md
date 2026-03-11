# Terraform AWS Docker Deployment

# Tech Stack

Terraform
AWS EC2
Docker
Docker Compose
FastAPI
Redis
PostgreSQL
GitHub

# Overview

This project provisions cloud infrastructure on AWS using Terraform and automatically deploys a containerized microservices application built with Docker.

The infrastructure launches an EC2 instance, configures networking and security, installs Docker, clones the application repository from GitHub, and starts the full application stack using Docker Compose.

This project demonstrates Infrastructure as Code (IaC) and automated deployment workflows commonly used in modern DevOps environments.

# Architecture

Infrastructure deployed by Terraform:

Developer Machine
        │
        │ Terraform
        ▼
AWS Infrastructure
        │
        ├── EC2 Instance (Ubuntu)
        │
        ├── Security Group
        │     ├── Port 22  → SSH access
        │     └── Port 8000 → FastAPI application
        │
        ▼
Cloud-init Bootstrapping
        │
        ├── Install Docker
        ├── Install Docker Compose
        ├── Install Git
        ├── Clone Application Repo
        └── Launch Docker Containers

Application containers started automatically:

FastAPI API
Redis Cache
PostgreSQL Database


# Infrastructure Components

Terraform provisions the following AWS resources:

# EC2 Instance

Ubuntu Server

Docker runtime

Application host

# Security Group

SSH access (port 22)

Application access (port 8000)

# Cloud-init bootstrap script

Automatically installs:

Docker

Docker Compose

Git

Clones the application repository

Starts the containerized stack

# Deployment Workflow

Infrastructure is created using Terraform from a local machine.

# Initialize Terraform

terraform init

# Preview Infrastructure

terraform plan

# Deploy Infrastructure

terraform apply

Terraform will:

Create AWS infrastructure

Launch EC2 instance

Execute cloud-init bootstrap script

Install Docker

Pull application from GitHub

Launch containers automatically

# Accessing the Application

After deployment completes, Terraform outputs the public EC2 IP address.

Example:

http://<EC2_PUBLIC_IP>:8000

Available endpoints:

/
 /redis
 /db
 /docs

Swagger API documentation:

http://<EC2_PUBLIC_IP>:8000/docs

# Project Structure
terraform-aws-docker-lab
│
├── main.tf
├── variables.tf
├── outputs.tf
├── user-data.sh
├── .terraform.lock.hcl
└── .gitignore

# Skills Demonstrated

Infrastructure as Code
Terraform provisioning
AWS EC2 deployment
Security group configuration
Cloud-init automation
Docker container orchestration
GitHub integration for CI-style deployments

# Related Project

This Terraform deployment automatically runs the Docker microservices project:

# docker-essentials-lab

Features:

FastAPI backend

Redis caching layer

PostgreSQL database

Docker Compose orchestration

# Future Improvements

Possible production-grade upgrades:

Load Balancer (ALB)

Auto Scaling Groups

Terraform remote state (S3 + DynamoDB)

CI/CD pipeline (GitHub Actions)

# Kubernetes deployment (EKS)
Infrastructure lifecycle tested:
terraform apply → deploy
terraform destroy → clean teardown
