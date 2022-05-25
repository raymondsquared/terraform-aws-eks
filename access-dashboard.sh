#!/bin/bash

# REF: https://github.com/kubernetes/dashboard/blob/master/docs/user/accessing-dashboard/README.md

# kubectl get deployment -n kubernetes-dashboard

# kubectl \
# get service \
# --all-namespaces

############

# Option 1. Proxy

# kubectl proxy

# We can now access the dashboard here: http://127.0.0.1:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/

############

# Option 2. Port Forward

# kubectl port-forward \
# -n kubernetes-dashboard \
# service/kubernetes-dashboard 8080:443

# URL: https://localhost:8080/

############

# Option 3. NodePort

# kubectl \
# -n kubernetes-dashboard \
# edit service kubernetes-dashboard

# Change type: ClusterIP to type: NodePort and save file.

# Restart
# kubectl scale deployment kubernetes-dashboard --replicas=0 -n kubernetes-dashboard
# kubectl scale deployment kubernetes-dashboard --replicas=1 -n kubernetes-dashboard
# kubectl get pods --all-namespaces

# kubectl \
# -n kubernetes-dashboard \
# get service kubernetes-dashboard

# Run `kubectl cluster-info` to get the ip address
# Access it https://<master-ip>:31707

############
