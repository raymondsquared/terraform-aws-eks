#!/bin/bash
# REF: https://aws.amazon.com/premiumsupport/knowledge-center/eks-kubernetes-services-cluster/

# Option 1. ClusterIP
# ClusterIP exposes the service on a cluster's internal IP address.

# kubectl apply -f nginx-deployment.yaml
# kubectl create -f clusterip.yaml
# kubectl get service nginx-service-cluster-ip
# kubectl delete service nginx-service-cluster-ip

# Option 2. NodePort
# NodePort exposes the service on each node’s IP address at a static port.
# LoadBalancer exposes the service externally using a load balancer.

# kubectl create -f nodeport.yaml
# kubectl get service/nginx-service-nodeport
# kubectl get nodes -o wide |  awk {'print $1" " $2 " " $7'} | column -t
# kubectl get nodes -o wide |  awk {'print $1" " $2 " " $6'} | column -t
# kubectl delete service nginx-service-nodeport

# Option 3. LoadBalancer
# LoadBalancer exposes the service externally using a load balancer.

# kubectl create -f loadbalancer.yaml
# kubectl get service/nginx-service-loadbalancer |  awk {'print $1" " $2 " " $4 " " $5'} | column -t
# kubectl delete service nginx-service-loadbalancer
