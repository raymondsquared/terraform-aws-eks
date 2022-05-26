#!/bin/bash
# REF: https://aws.amazon.com/premiumsupport/knowledge-center/eks-kubernetes-services-cluster/

# Option 1. ClusterIP
# ClusterIP exposes the service on a cluster's internal IP address.

# Use cases:
# Debugging your services, or connecting to them directly from your laptop for some reason
# Allowing internal traffic, displaying internal dashboards, etc.

# kubectl apply -f nginx-deployment.yaml
# kubectl create -f clusterip.yaml
# kubectl get service nginx-service-cluster-ip
# kubectl delete service nginx-service-cluster-ip

# Option 2. NodePort
# NodePort exposes the service on each node’s IP address at a static port.
# LoadBalancer exposes the service externally using a load balancer.

# Use cases:
# You can only have one service per port
# You can only use ports 30000-32767
# If your Node/VM IP address change, you need to deal with that

# kubectl create -f nodeport.yaml
# kubectl get service/nginx-service-nodeport
# kubectl get nodes -o wide |  awk {'print $1" " $2 " " $7'} | column -t
# kubectl get nodes -o wide |  awk {'print $1" " $2 " " $6'} | column -t
# kubectl delete service nginx-service-nodeport

# Option 3. LoadBalancer
# LoadBalancer exposes the service externally using a load balancer.
# Classic Load Balancer.

# Use cases:
# If you want to directly expose a service, this is the default method. 
# All traffic on the port you specify will be forwarded to the service. 
# There is no filtering, no routing, etc. 
# This means you can send almost any kind of traffic to it, like HTTP, TCP, UDP, Websockets, gRPC, or whatever.
#
# The big downside is that each service you expose with a LoadBalancer will get its own IP address, 
# and you have to pay for a LoadBalancer per exposed service, which can get expensive!

# kubectl create -f loadbalancer.yaml
# kubectl get service/nginx-service-loadbalancer |  awk {'print $1" " $2 " " $4 " " $5'} | column -t
# kubectl delete service nginx-service-loadbalancer

# Option 4. Ingress
# check out httpd.sh
