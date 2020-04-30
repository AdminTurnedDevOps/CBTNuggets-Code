param(
    [string]$name = 'cbtaks92',
    [string]$resourceGroupName = "CBTAzure",
    [string]$location = "eastus",
    [string]$kubernetesVersion = "1.16.7",
    [int]$nodeCount = 1
)

$NewAZParams = @{
    'Name'              = $name
    'ResourceGroupName' = $resourceGroupName
    'location'          = $location
    'KubernetesVersion' = $kubernetesVersion
    'NodeCount'         = $nodeCount
    'Force'             = $true
}

New-AzAks @NewAZParams