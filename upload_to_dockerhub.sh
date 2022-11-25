#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
dockerpath="serglit72/"

# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"
docker tag flask-app serglit72/flask-app:v2.0
docker login

# Step 3:
# Push image to a docker repository
docker push serglit72/flask-app:v2.0
