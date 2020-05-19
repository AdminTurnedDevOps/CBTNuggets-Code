param(
    [string]$acrName = 'cbtacr92',
    [string]$aksCluster = 'clouddevaks',
    [string]$resourceGroupName = 'CBTAzure'
)

# Create the ACR
az acr create --name $acrName `
              --resource-group $resourceGroupName `
              --sku Standard

# Update AKS to use the ACR
az aks update --name $aksCluster `
              --resource-group $resourceGroupName `
              --attach-acr $acrName

# Push Python web API to ACR
az acr login --name $acrName

docker tag pythonwebapp $($acrName + '.azurecr.io/webapps/pythonwebapi:latest')

docker push cbtacr92.azurecr.io/pythonwebapp