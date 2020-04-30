param(
    [string]$name,
    [string]$resourceGroupName,
    [string]$location,
    [string]$kubernetesVersion,
    [int]$nodeCount = 1,
    [string]$SshKeyValue
)

az aks create -g $resourceGroupName `
              -n $name `
              -l $location `
              --ssh-key-value $SshKeyValue `
              --node-count $nodeCount `
              --kubernetes-version $kubernetesVersion `