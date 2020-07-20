param(
    [string]$resourceGroupName = 'AZ-204',
    [string]$location = 'East US',
    [string]$name = 'cbtnuggetsapim92',
    [string]$Org = 'CBT Nuggets',
    [string]$email = 'mlevan1992@outlook.com',
    [string]$SKU = 'Developer'
)

$params = @{
    'ResourceGroupName' = $resourceGroupName
    'Location'          = $location
    'Name'              = $name
    'Organization'      = $Org
    'AdminEmail'        = $email
    'Sku'               = $SKU
}

New-AzApiManagement @params