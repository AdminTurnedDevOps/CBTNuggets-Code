param(
    [string]$appName = 'clouddevnginx',
    [string]$resourceGroup = 'CBTAzure',
    [string]$image = 'nginx:latest',
    [int]$cpu = 1,
    [int]$memory = 1
)

az container create --name $appName `
                    --resource-group $resourceGroup `
                    --image $image `
                    --cpu $cpu `
                    --memory $memory