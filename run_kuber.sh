#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath="serglit72/"

# Step 2
# Run the Docker Hub container with kubernetes
kubectl create deployment balanced --image=docker.io/nginx:1.23
kubectl expose deployment balanced --type=LoadBalancer --port=80
kubectl create deployment flask-app --image=serglit72/flask-app:v2.0
kubectl expose deployment flask-app --type=NodePort --port=80
# Step 3:
# List kubernetes pods
kubectl get deploy,rs,svc,pods flask-app

prod=$(kubectl get pods --selector=app=flask-app -o jsonpath='{.items[*].metadata.name}')
echo ${prod}
stage=$(kubectl get pods --selector=app=flask-app -o jsonpath='{.items[*].metadata.name}')
echo ${stage}
# load_balancer=$(kubectl get pods --selector=app=load-balancer-o jsonpath='{.items[*].metadata.name}')
# echo ${load-balancer}

# Step 4:
# Forward the container port to load-balancer

kubectl port-forward pod/${prod} --address 10.0.10.100 8080:5050
kubectl port-forward pod/${stage} --address 10.0.11.100 8080:5050
# kubectl port-forward pod/${load-balancer} --address 0.0.0.0 80:8080