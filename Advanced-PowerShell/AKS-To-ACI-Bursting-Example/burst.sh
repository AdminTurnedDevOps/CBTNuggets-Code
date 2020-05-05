az aks get-credentials --name cbtnuggs92 -g CBTAzure
helm repo add nginx-stable https://helm.nginx.com/stable
helm repo update
helm install nginxfrontend nginx-stable/nginx-ingress
kubectl get deployments
kubectl scale deploy nginxfrontend-nginx-ingress --replicas 15
kubectl get deployments