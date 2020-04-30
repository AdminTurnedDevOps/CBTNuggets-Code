param(
    [string]$name,
    [string]$resourceGroupName,
    [string]$location,
    [string]$kubernetesVersion,
    [int]$nodeCount
)

az aks create -g $resourceGroupName `
              -n $name `
              -l $location `
              --generate-ssh-keys `
              --node-count $nodeCount `
              --kubernetes-version $kubernetesVersion
#test