Install-Module Az -Force
Import-Module Az -Force

param(
    [string]$name,
    [string]$resourceGroupName,
    [string]$location,
    [string]$kubernetesVersion,
    [int]$nodeCount
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