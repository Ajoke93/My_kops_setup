#!/bin/bash

# Function to print usage
function print_usage() {
  echo "Usage: $0 <cluster-name> <state-store>"
  echo "Example: $0 ajoke.k8s.local s3://ajoke30.k8s.local"
}

# Check if both cluster name and state store are provided as arguments
if [ $# -ne 2 ]; then
  print_usage
  exit 1
fi

CLUSTER_NAME=$1
STATE_STORE=$2

# Verify the cluster name and state store before proceeding
kops get clusters --state $STATE_STORE | grep $CLUSTER_NAME
if [ $? -ne 0 ]; then
  echo "Cluster not found: $CLUSTER_NAME in state store $STATE_STORE"
  exit 1
fi

# Delete the Kubernetes cluster
echo "Deleting Kubernetes cluster: $CLUSTER_NAME"
kops delete cluster $CLUSTER_NAME --state $STATE_STORE --yes

# Delete the S3 State Store
echo "Deleting S3 state store: $STATE_STORE"
aws s3 rb $STATE_STORE --force

# Clean up local configuration
echo "Cleaning up local configuration"
rm -rf ~/.kube/config

echo "Kubernetes cluster $CLUSTER_NAME and associated resources have been deleted."

