function kubeconfig {
    [cmdletbinding(ConfirmImpact = 'Low')]
    param(
        [parameter(Mandatory,
            HelpMessage = 'Enter the name of the AKS cluster',
            ValueFromPipeline = $true)]
        [alias('aksClusterName')]
        [string]$name,

        [parameter(Mandatory,
            HelpMessage = 'Enter the name of the resource group that the AKS cluster resides in')]
        [alias('RGName')]
        [string]$resourceGroupName
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
            az aks get-credentials --name $name `
                                   --resource-group $resourceGroupName `
                                   --admin
        }

        catch {
            $PSCmdlet.ThrowTerminatingError($_)
        }
    }

    end {
        Write-Output "Command Finished: $($MyInvocation.MyCommand)"
    }
}