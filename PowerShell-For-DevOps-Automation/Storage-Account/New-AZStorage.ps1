param(
    [string]$name,
    [string]$resourceGroupName,
    [string]$location
)

az storage account create -n $name `
                          -g $resourceGroupName `
                          - l $location

az stroage container create -n $($name | 'container')