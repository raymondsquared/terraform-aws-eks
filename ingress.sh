#!/bin/bash

# Unlike all the above examples, Ingress is actually NOT a type of service. 
# Instead, it sits in front of multiple services and act as a “smart router” or entrypoint into your cluster.

# Ingress is probably the most powerful way to expose your services, but can also be the most complicated. 
# There are many types of Ingress controllers, from the Load Balancer (ALB / ELB / NLB), Nginx, Contour, Istio, and more. 
# There are also plugins for Ingress controllers, like the cert-manager, that can automatically provision SSL certificates for your services.
# 
# Ingress is the most useful if you want to expose multiple services under the same IP address, and these services all use the same L7 protocol (typically HTTP). 
# You only pay for one load balancer if you are using the native AWS integration, 
# and because Ingress is “smart” you can get a lot of features out of the box (like SSL, Auth, Routing, etc)

# What advantages does the NLB have over the Application Load Balancer (ALB)?
# A Network Load Balancer is capable of handling millions of requests per second while maintaining ultra-low latencies, making it ideal for load balancing TCP traffic. 
# NLB is optimized to handle sudden and volatile traffic patterns while using a single static IP address per Availability Zone. The benefits of using a NLB are:

# Static IP/elastic IP addresses: For each Availability Zone (AZ) you enable on the NLB, you have a network interface. 
#   Each load balancer node in the AZ uses this network interface to get a static IP address. You can also use Elastic IP to assign a fixed IP address for each Availability Zone.
# Scalability: Ability to handle volatile workloads and scale to millions of requests per second.
# Zonal isolation: The Network Load Balancer can be used for application architectures within a Single Zone.
#   Network Load Balancers attempt to route a series of requests from a particular source to targets in a single AZ while still providing automatic failover should those targets become unavailable.
#   Source/remote address preservation: With a Network Load Balancer, the original source IP address and source ports for the incoming connections remain unmodified. 
#   With Classic and Application load balancers, we had to use HTTP header X-Forwarded-For to get the remote IP address.
#   Long-lived TCP connections: Network Load Balancer supports long-running TCP connections that can be open for months or years, 
#   making it ideal for WebSocket-type applications, IoT, gaming, and messaging applications.
# Reduced bandwidth usage: Most applications are bandwidth-bound and should see a cost reduction (for load balancing) of about 25% compared to Application or Classic Load Balancers.
# SSL termination: SSL termination will need to happen at the backend, since SSL termination on NLB for Kubernetes is not yet available.

# For any NLB usage, the backend security groups control the access to the application (NLB does not have security groups of it own). 
# The worker node security group handles the security for inbound/ outbound traffic.

# REF: https://itnext.io/kubernetes-ingress-controllers-how-to-choose-the-right-one-part-1-41d3554978d2
# REF: https://aws.amazon.com/blogs/opensource/network-load-balancer-nginx-ingress-controller-eks/
# REF: https://kubernetes.io/docs/concepts/services-networking/ingress/
# REF: https://kubernetes.github.io/ingress-nginx/deploy/

# helm repo update

# helm repo add bitnami https://charts.bitnami.com/bitnami
# helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
# helm search repo bitnami
# helm search repo ingress-nginx
# helm repo update

# helm upgrade --install \
# nginx bitnami/nginx \
# --namespace paw --create-namespace
# helm uninstall nginx --namespace paw

# helm upgrade --install \
# ingress-nginx ingress-nginx/ingress-nginx \
# --namespace ingress-nginx --create-namespace
# helm uninstall ingress-nginx --namespace ingress-nginx
  
# helm list -a

# kubectl create deployment app --image=httpd --port=80 --namespace paw
# kubectl delete deployment app --namespace paw

# Expose as cluster IP
# kubectl expose deployment app --namespace paw
# kubectl delete services app --namespace paw

# kubectl create ingress app-ingress \
#   --class=nginx  \
#   --namespace paw \
#   --rule=test.paw.com/*=app:80
# or
# kubectl apply -f ingress.yaml
# Test here: http://test.paw.com

# kubectl port-forward --namespace=ingress-nginx service/ingress-nginx-controller 8080:80
# Test here: http://test.paw.com:8080/

# kubectl get ingress -A
# kubectl describe ingress app-ingress --namespace paw
# kubectl delete ingress app-ingress --namespace paw
