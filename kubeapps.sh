# Step 1: Add Kubeapps Helm Repository
helm repo add bitnami https://charts.bitnami.com/bitnami

# Step 2: Create a Namespace for Kubeapps
kubectl create namespace kubeapps

# Step 3: Install Kubeapps using Helm
helm install kubeapps --namespace kubeapps bitnami/kubeapps

# Step 4: Wait for Kubeapps Pods to be Ready (Optional, but recommended)
# Check the status of the Kubeapps pods until all are in the "Running" state.
kubectl get pods -n kubeapps -w

# Step 5: Determine the Kubeapps Service and Port
kubectl get svc -n kubeapps

# Step 6: Get the External IP or Domain of the Kubernetes Cluster
# Replace <LOAD_BALANCER_EXTERNAL_IP> with the external IP of your Load Balancer (if you have one).
# If you are using kops with NodePort, you can use the following command to get the Minikube IP:
# export KOPS_CLUSTER_NAME=<your-kops-cluster-name>
# export KUBECONFIG=$HOME/.kube/config
# export MINIKUBE_IP=$(kubectl get nodes -o jsonpath='{.items[0].status.addresses[0].address}')
# echo "Minikube IP: $MINIKUBE_IP"

# Step 7: Access the Kubeapps Dashboard
# Replace EXTERNAL_IP_OR_DOMAIN and PORT_NUMBER with the values from Step 5.
# Use the appropriate protocol (http or https) based on your setup.
# If you have an ingress controller or load balancer, use the external address they provide.
# If you are using kops with NodePort, you can access Kubeapps using the Minikube IP and NodePort.
# For example, if the external IP is 192.168.100.101 and the port is 30000:
echo "Access Kubeapps at: http://<LOAD_BALANCER_EXTERNAL_IP>:<PORT_NUMBER>"
# If using NodePort with kops (Minikube-like setup):
# echo "Access Kubeapps at: http://$MINIKUBE_IP:$(kubectl get svc kubeapps -n kubeapps -o=jsonpath='{.spec.ports[0].nodePort}')"

# Step 8: Authenticate and Access Apps
# Follow the instructions on the Kubeapps dashboard to authenticate (if required) and start accessing apps.

# Step 9: Clean Up (Optional)
# If you want to uninstall Kubeapps later, you can use the following Helm command:
# helm uninstall kubeapps --namespace kubeapps

