#!/bin/bash

# Get kubectl
curl -L https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl -o /tmp/kubectlvagrant
chmod +x /tmp/kubectlvagrant

# Get config file from master node 
CONFIG=$(vagrant ssh kubemaster1 -c "sudo cat /etc/rancher/k3s/k3s.yaml")

#Create kubectl config
cat << EOF >  /tmp/kubectlvagrantconfig.yml
${CONFIG}
EOF

# Create temp vars to use kubectl with vagrant
export KUBECONFIG=/tmp/kubectlvagrantconfig.yml
alias kubectl="/tmp/kubectlvagrant"

# Check if k3s cluster work
kubectl get nodes