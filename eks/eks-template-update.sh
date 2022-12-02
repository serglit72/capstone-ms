#!/bin/bash

# sample value for your variables
MYVARVALUE="nginx:latest"

# read the yml template from a file and substitute the string 
# {{MYVARNAME}} with the value of the MYVARVALUE variable
template=`cat "eks-cluster-spot-copy.yaml" | sed -i 's/{{PRIVATE_SUB_01}}/$RIVATE_SUB_01/g'
#sed "s/{{MYVARNAME}}/$MYVARVALUE/g"`


# apply the yml with the substituted value
# echo "$template" | kubectl apply -f -