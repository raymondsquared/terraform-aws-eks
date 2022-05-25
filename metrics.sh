#!/bin/bash

wget -O v0.3.6.tar.gz https://codeload.github.com/kubernetes-sigs/metrics-server/tar.gz/v0.3.6 && tar -xzf v0.3.6.tar.gz

kubectl apply -f metrics-server-0.3.6/deploy/1.8+/

kubectl get deployment metrics-server -n kube-system
