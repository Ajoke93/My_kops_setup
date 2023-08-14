# Delete the Kubernetes cluster
kops delete cluster ajoke.k8s.local --state s3://ajoke30.k8s.local --yes

# Delete the S3 State Store
aws s3 rb s3://ajoke30.k8s.local --force

# Clean up local configuration
rm -rf ~/.kube/config

