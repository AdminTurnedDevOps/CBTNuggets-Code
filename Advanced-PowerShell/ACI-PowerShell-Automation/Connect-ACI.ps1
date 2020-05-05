param(
    [string]$aksClusterName = 'cbtnuggs92',
    [string]$resourceGroupName = 'CBTAzure',
    [string]$connectorName = 'aciaks',
    [string]$subnetName = 'aci'
)

az aks get-credentials -n $aksClusterName `
                      --resource-group $resourceGroupName

#az aks install-connector --name 'terraformlive' `
#                         --resource-group $resourceGroupName `
#                         --connector-name $connectorName `
#                         --os-type Both

az aks enable-addons --resource-group $resourceGroupName `
                     --name $aksClusterName `
                     --addons virtual-node `
                     --subnet-name $subnetName 