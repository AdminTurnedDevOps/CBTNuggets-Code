param(
    [string]$name,
    [string]$resourceGroupName,
    [string]$location,
    [string]$container
)

az storage account create -n $name `
                          -g $resourceGroupName `
                          -l $location

$connectionString = az storage account show-connection-string -g $resourceGroupName -n $name --output json | ConvertFrom-Json | select -ExpandProperty *      


az storage container create -n $container `
                            --account-name $name `
                            --connection-string $connectionString