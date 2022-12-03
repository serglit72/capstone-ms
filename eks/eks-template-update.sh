#!/bin/bash

cd ~/project/eks
# sample value for your variables
# MYVARVALUE="nginx:latest"
PRIVATE_SUB_01=$(aws cloudformation describe-stack-resources --stack-name eks-vpc-9b633a6 --query 'StackResources[?LogicalResourceId==`PrivateSubnet01`].PhysicalResourceId' --output=text)
PRIVATE_SUB_02=$(aws cloudformation describe-stack-resources --stack-name eks-vpc-9b633a6 --query 'StackResources[?LogicalResourceId==`PrivateSubnet02`].PhysicalResourceId' --output=text)
PUBLIC_SUB_01=$(aws cloudformation describe-stack-resources --stack-name eks-vpc-9b633a6 --query 'StackResources[?LogicalResourceId==`PublicSubnet01`].PhysicalResourceId' --output=text)
PUBLIC_SUB_02=$(aws cloudformation describe-stack-resources --stack-name eks-vpc-9b633a6 --query 'StackResources[?LogicalResourceId==`PublicSubnet02`].PhysicalResourceId' --output=text)

for i in 1 2 3 4
do
if test $i == 1  
then
   cat "eks-cluster-spot-copy.yaml" | sed "s/PRIVATE_SUB_01/$PRIVATE_SUB_01/g" > eks-cluster-spot-copy.yaml
elif test $i == 2
then
   cat "eks-cluster-spot-copy.yaml" | sed "s/PRIVATE_SUB_02/$PRIVATE_SUB_02/g" > eks-cluster-spot-copy.yaml
elif test $i == 3
then
   cat "eks-cluster-spot-copy.yaml" | sed "s/PUBLIC_SUB_01/$PUBLIC_SUB_01/g" > eks-cluster-spot-copy.yaml
elif test $i == 4
then
   cat "eks-cluster-spot-copy.yaml" | sed "s/PUBLIC_SUB_02/$PUBLIC_SUB_02/g" > eks-cluster-spot-copy.yaml
fi
done
cat "eks-cluster-spot-copy.yaml"
#sed "s/{{MYVARNAME}}/$MYVARVALUE/g"
# apply the yml with the substituted value
# echo "$tmpconfig" #| kubectl apply -f -
# curl --location "https://github.com/weaveworks/eksctl/releases/download/v0.121.0/eksctl_Linux_amd64.tar.gz" | tar xz -C /tmp

# read the yml template from a file and substitute the string 
# {{MYVARNAME}} with the value of the MYVARVALUE variable
# echo "I'm in :" $(pwd)
# str='PRIVATE_SUB_01/$PRIVATE_SUB_01 PRIVATE_SUB_02/$PRIVATE_SUB_02 \
# PUBLIC_SUB_01/$PUBLIC_SUB_01 PUBLIC_SUB_02/$PUBLIC_SUB_02'; \
# for s in $str; do sed 's/$s/g' eks-cluster-spot-copy.yaml done;