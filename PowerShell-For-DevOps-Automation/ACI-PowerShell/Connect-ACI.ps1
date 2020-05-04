param(
    [string]$aksClusterName,
    [string]$resourceGroupName,
    [string]$connectorName
)

az aks get-credentials --name $aksClusterName `
                      --resource-group $resourceGroupName

az aks install-connector --name 'terraformlive' `
                         --resource-group $resourceGroupName `
                         --connector-name $connectorName `
                         --os-type Both