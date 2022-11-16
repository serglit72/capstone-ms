#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath="serglit72/"

# Step 2
# Run the Docker Hub container with kubernetes
kubectl create deploy speedtest --image=serglit72/speedtest:v0.0.1

# Step 3:
# List kubernetes pods
kubectl get deploy,rs,svc,pods

pod_name=$(kubectl get pods --selector=app=speedtest -o jsonpath='{.items[*].metadata.name}')
echo ${pod_name}

# Step 4:
# Forward the container port to a host
kubectl port-forward pod/${pod_name} --address 0.0.0.0 8787:8787
