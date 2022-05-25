#!/bin/bash

kubectl apply \
-f https://raw.githubusercontent.com/hashicorp/learn-terraform-provision-eks-cluster/main/kubernetes-dashboard-admin.rbac.yaml

kubectl \
-n kube-system \
describe secret $(kubectl -n kube-system get secret | grep service-controller-token | awk '{print $1}')

# Access the dashboard here: http://127.0.0.1:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/
# and copy the token
