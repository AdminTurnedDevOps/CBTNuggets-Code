param(
    [string]$name = 'cbtaks92',
    [string]$resourceGroupName = "CBTAzure",
    [string]$location = "eastus",
    [string]$kubernetesVersion = "1.16.7",
    [int]$nodeCount = 1,
    [string]$SshKeyValue
)

az aks create -g $resourceGroupName `
              -n $name
              -l $location
              --ssh-key-value $SshKeyValue
              --node-count $nodeCount
              --kubernetes-version $kubernetesVersion