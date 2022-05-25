#!/bin/bash
# REF: https://aws.amazon.com/premiumsupport/knowledge-center/eks-kubernetes-object-access-error/
# REF: https://docs.aws.amazon.com/eks/latest/userguide/view-kubernetes-resources.html#view-kubernetes-resources-permissions

# Step 1.
# aws sts get-caller-identity

# Step 2.
# kubectl edit configmap aws-auth -n kube-system
# 
# add
# mapUsers: |
#   - userarn: arn:aws:iam::XXXXXXXXXXXX:user/testuser
#     username: testuser
#     groups:
#     - system:bootstrappers
#     - system:nodes
# or
# mapRoles: |
#   - rolearn: arn:aws:iam::XXXXXXXXXXXX:role/testrole
#     username: testrole    
#     groups:
#     - system:bootstrappers
#     - system:nodes
# 
#  To allow superuser access for performing any action on any resource, add system:master

# Step 3.
# kubectl apply -f eks-console-full-access.yaml
# kubectl apply -f eks-console-restricted-access.yaml

# Step 4.
# kubectl edit configmap aws-auth -n kube-system
# 
# add 
# mapUsers: |
#   - userarn: arn:aws:iam::XXXXXXXXXXXX:user/testuser
#     username: testuser
#     groups:
#     - system:bootstrappers
#     - system:nodes
#     - eks-console-dashboard-full-access-group
# or
# mapRoles: |
#   - rolearn: arn:aws:iam::XXXXXXXXXXXX:role/testrole
#     username: testrole    
#     groups:
#     - system:bootstrappers
#     - system:nodes
#     - eks-console-dashboard-full-access-group

# Step 5.
# 
# Check roles
# 
# export AWS_PROFILE=paw
# export AWS_PROFILE=pawcicd
# export AWS_PROFILE=pawdeveloper
# kubectl get pods --all-namespaces
# 
# kubectl get roles --all-namespaces
# kubectl get clusterroles --all-namespaces
# kubectl get clusterrolebindings --all-namespaces
# kubectl describe role -n kube-system
# kubectl describe clusterrole eks-console-dashboard-full-access-clusterrole
