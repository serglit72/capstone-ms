#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath="serglit72/"

# Step 2
# Run the Docker Hub container with kubernetes
#kubectl create deploy speedee --image=serglit72/speedee:v0.0.2

# Step 3:
# List kubernetes pods
kubectl get deploy,rs,svc,pods

pod_name1=$(kubectl get pods --selector=app=speedee -o jsonpath='{.items[*].metadata.name}')
echo ${pod_name1}
pod_name2=$(kubectl get pods --selector=app=flask-app -o jsonpath='{.items[*].metadata.name}')
echo ${pod_name2}
pod_name3=$(kubectl get pods --selector=app=redis -o jsonpath='{.items[*].metadata.name}')
echo ${pod_name3}


# Step 4:
# Forward the container port to a host
kubectl port-forward pod/${pod_nam1e} --address 0.0.0.0 7777:7777
kubectl port-forward pod/${pod_name2} --address 0.0.0.0 9999:9999
kubectl port-forward pod/${pod_name3} --address 0.0.0.0 6379:6379
