# Helm search all
helm search hub

# Install package manager/hub
helm repo add stable https://kubernetes-charts.storage.googleapis.com/

# Helm search for wordpress
helm search hub mysql

# install MySQL
helm install stable/mysql --generate-name

# Create a new Helm chart
helm create pythonwebapp