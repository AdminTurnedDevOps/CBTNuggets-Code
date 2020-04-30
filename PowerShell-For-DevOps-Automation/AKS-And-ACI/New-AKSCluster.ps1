param(
    [string]$name = 'cbtaks',
    [string]$resourceGroupName = "CBTAzure",
    [string]$location = "eastus",
    [string]$kubernetesVersion = "1.16.7",
    [int]$nodeCount = 1
)

#Uninstall-AzureRm
#Install-Module Az -Force
#Import-Module Az -Force


$NewAZParams = @{
    'Name'              = $name
    'ResourceGroupName' = $resourceGroupName
    'location'          = $location
    'KubernetesVersion' = $kubernetesVersion
    'NodeCount'         = $nodeCount
    'Force'             = $true
}

New-AzAks @NewAZParams