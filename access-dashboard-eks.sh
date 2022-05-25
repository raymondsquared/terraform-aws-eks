#!/bin/bash

# REF: https://aws.amazon.com/premiumsupport/knowledge-center/eks-kubernetes-services-cluster/

# kubectl get deployment -n kubernetes-dashboard

# kubectl \
# get service \
# --all-namespaces

############

# Option 1. ClusterIP

# kubectl create -f cluster-ip.yaml
# or
# kubectl expose \
# deployment kubernetes-dashboard \
# --type=ClusterIP \
# --name=kubernetes-dashboard-service-cluster-ip

# kubectl get service kubernetes-dashboard-service-cluster-ip

# kubectl delete service kubernetes-dashboard-service-cluster-ip

############

# Option 2. NodePort

# kubectl create -f node-port.yaml
# or
# kubectl expose \
# deployment kubernetes-dashboard  \
# --type=NodePort \
# --name=kubernetes-dashboard-service-node-port

# kubectl \
# get service \
# --all-namespaces

# kubectl get nodes -o wide |  awk {'print $1" " $2 " " $7'} | column -t

# kubectl get nodes -o wide |  awk {'print $1" " $2 " " $6'} | column -t

# kubectl delete service kubernetes-dashboard-service-node-port

############

# Option 3. LoadBalancer

# kubectl create -f load-balancer.yaml
# or
# kubectl expose deployment kubernetes-dashboard  \
# --type=LoadBalancer  \
# --name=kubernetes-dashboard-service-load-balancer

# kubectl \
# get service \
# --all-namespaces

# kubectl delete service kubernetes-dashboard-service-load-balancer

############
