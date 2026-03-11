#!/bin/bash
set -eux

apt-get update -y
apt-get install -y docker.io docker-compose-v2 git

systemctl enable docker
systemctl start docker

cd /home/ubuntu

git clone ${github_repo_url}

REPO_DIR=$(basename ${github_repo_url} .git)

cd /home/ubuntu/$REPO_DIR

docker compose up -d