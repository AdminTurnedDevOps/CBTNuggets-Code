# Create the Azure Container Registry
param(
    [string]$name = 'cbtacr92',
    [string]$resourceGroupName = 'CBTAzure',
    [string]$sku = 'Basic',
    [string]$adminEnabled = $true
)

az acr create -n $name `
              -g $resourceGroupName `
              --sku $sku `
              --admin-enabled $adminEnabled

# Log in to the Azure Container Registry
az acr login --name $name

# Tag a Docker image with the ACR URI
docker tag python cbtacr92.azurecr.io/pythonwebapp

# Push the Docker image to ACR
docker push cbtacr92.azurecr.io/pythonwebapp