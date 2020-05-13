param(
    [string]$resourceGroupName = 'CBTAzure',
    [string]$name = 'python-webapp'

)

az container create --resource-group $resourceGroupName `
                   --name $name `
                   --image python `
                   --cpu 2 `
                   --memory 2
