function New-AKSCluster {
    [cmdletbinding(ConfirmImpact = 'Low')]
    param(
        [parameter(Mandatory,
            ParameterSetName = 'AKSBuild',
            HelpMessage = 'Enter a name of the new AKS cluster',
            ValueFromPipeline = $true)]
        [alias('aksClusterName')]
        [string]$name,

        [parameter(Mandatory,
            ParameterSetName = 'AKSBuild',
            HelpMessage = 'Enter the name of the resource group that the AKS cluster will reside in')]
        [alias('RGName')]
        [string]$resourceGroupName,

        [parameter(Mandatory,
            ParameterSetName = 'AKSBuild',
            HelpMessage = 'Enter the region that the AKS cluster will reside in')]
        [string]$region,

        [parameter(ParameterSetName = 'AKSBuild',
            HelpMessage = 'Enter how many worker nodes will be deployed for the AKS Ckuster')]
        [int]$nodeCount = 2,

        [parameter(ParameterSetName = 'AKSBuild',
            HelpMessage = 'Enter the Kubernetes API version that AKS will use')]
        [alias('k8sVersion', 'version')]
        [string]$kubernetesVersion = "1.17.3",

        [parameter(ParameterSetName = 'AKSBuild',
            HelpMessage = 'Enter the path that the public SSH key you will be using to SSH into the worker nodes exists')]
        [string]$sshKeyPath = '~/.ssh/id_rsa.pub'
    )

    begin {
        $azAccount = az account show
        if (-not($azAccount)) {
            Write-Warning 'No Azure subscription is logged into with the Azure CLI'
            $login = Read-Host 'Would you like to log in? 1 for yes and 2 for no'

            switch ($login) {
                1 {
                    az login
                }
                2 {
                    exit
                }
            }
        }
    }

    process {
        try {
            az aks create --name $name `
                --resource-group $resourceGroupName `
                --network-plugin 'azure' `
                --location $region `
                --outbound-type 'loadBalancer' `
                --node-count $nodeCount `
                --kubernetes-version $kubernetesVersion `
                --load-balancer-sku standard `
                --ssh-key-value $sshKeyPath
        }

        catch {
            $PSCmdlet.ThrowTerminatingError($_)
        }
    }

    end {
        Write-Output "Command Finished: $($MyInvocation.MyCommand)"
    }
}