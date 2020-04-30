param(
    [string]$name,
    [string]$resourceGroupName,
    [string]$location,
    [string]$container
)

az storage account create -n $name `
                          -g $resourceGroupName `
                          -l $location

az storage container create -n $container
                            --account-name $name