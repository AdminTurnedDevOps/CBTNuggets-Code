param(
    [string]$aksClusterName = 'cbtnuggs92',
    [string]$resourceGroupName = 'CBTAzure',
    [string]$connectorName = 'aciaks'
)

az aks get-credentials -n $aksClusterName `
                      --resource-group $resourceGroupName

#az aks install-connector --name 'terraformlive' `
#                         --resource-group $resourceGroupName `
#                         --connector-name $connectorName `
#                         --os-type Both

az aks install-connector --resource-group $resourceGroupName `
                         -n $aksClusterName `
                         --connector-name virtual-kubelet