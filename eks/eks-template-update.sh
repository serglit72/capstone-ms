#!/bin/bash

cd ~/project/eks
# sample value for your variables
# MYVARVALUE="nginx:latest"
echo my_stack=$(aws ec2 describe-subnets --profile myHomeLinux --query 'Subnets[].["AvailabilityZone","SubnetId","VpcId","State",Tags[?Key==`Name`].Value]' --output=text)
PRIVATE_SUB_01=$(aws cloudformation describe-stack-resources --stack-name eks-vpc --query 'StackResources[?LogicalResourceId==`PrivateSubnet01`].PhysicalResourceId' --output=text)
PRIVATE_SUB_02=$(aws cloudformation describe-stack-resources --stack-name eks-vpc --query 'StackResources[?LogicalResourceId==`PrivateSubnet02`].PhysicalResourceId' --output=text)
PUBLIC_SUB_01=$(aws cloudformation describe-stack-resources --stack-name eks-vpc --query 'StackResources[?LogicalResourceId==`PublicSubnet01`].PhysicalResourceId' --output=text)
PUBLIC_SUB_02=$(aws cloudformation describe-stack-resources --stack-name eks-vpc --query 'StackResources[?LogicalResourceId==`PublicSubnet02`].PhysicalResourceId' --output=text)





for i in 1 2 3 4
do
if test $i == 1  
then
   cat "eks-cluster-spot-copy.yaml" | sed "s/PRIVATE_SUB_01/$PRIVATE_SUB_01/g"  > eks-cluster-spot-copy1.yaml
elif test $i == 2
then
   cat "eks-cluster-spot-copy1.yaml" | sed "s/PRIVATE_SUB_02/$PRIVATE_SUB_02/g" > eks-cluster-spot-copy2.yaml
elif test $i == 3
then
   cat "eks-cluster-spot-copy2.yaml" | sed "s/PUBLIC_SUB_01/$PUBLIC_SUB_01/g" > eks-cluster-spot-copy3.yaml
elif test $i == 4
then
   cat "eks-cluster-spot-copy3.yaml" | sed "s/PUBLIC_SUB_02/$PUBLIC_SUB_02/g" > eks-cluster-spot-copy4.yaml
   rm eks-cluster-spot-copy1.yaml eks-cluster-spot-copy2.yaml eks-cluster-spot-copy3.yaml
fi
done
cat "eks-cluster-spot-copy4.yaml"

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