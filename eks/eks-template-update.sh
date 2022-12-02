#!/bin/bash
echo "Privet"
sed --help
# sample value for your variables
# MYVARVALUE="nginx:latest"

# read the yml template from a file and substitute the string 
# {{MYVARNAME}} with the value of the MYVARVALUE variable
template = cat eks-cluster-spot-copy.yaml | sed -i 's/PRIVATE_SUB_01/${PRIVATE_SUB_01}/g'
template = cat eks-cluster-spot-copy.yaml | sed -i 's/PRIVATE_SUB_01/${PRIVATE_SUB_02}/g'
template = cat eks-cluster-spot-copy.yaml | sed -i 's/PUBLIC_SUB_01/$PUBLIC_SUB_01/g'
template = cat eks-cluster-spot-copy.yaml | sed -i 's/PUBLIC_SUB_02/$PUBLIC_SUB_02/g'
#sed "s/{{MYVARNAME}}/$MYVARVALUE/g"`
ls -la
cat "eks-cluster-spot-copy.yaml"
pwd
echo "$template"

# apply the yml with the substituted value
# echo "$template" | kubectl apply -f -