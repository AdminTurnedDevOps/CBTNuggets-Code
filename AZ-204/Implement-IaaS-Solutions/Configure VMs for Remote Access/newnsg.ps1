param(

    [string]$resourceGroupName = 'CBTAzure',
    [string]$region = 'eastus'
)

az network nsg create --name 'clouddev' `
                      --resource-group $resourceGroupName `
                      --location $region

az network nsg rule create --name 'clouddevrule' `
                           --nsg-name 'clouddev' `
                           --access Allow `
                           --source-port-range 22 `
                           --resource-group $resourceGroupName `
                           --priority 100