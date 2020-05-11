function Create-PythonWebApp {
    [cmdletbinding(ConfirmImpact = 'low')]
    param(
        [string]$webappName,
        [string]$resourceGroupName,
        [string]$runtime = "python|3.6"
    )

    begin {
        $login = Get-AzSubscription
        $azlogin = az account show
        if (-not($login) -or -not($azlogin)) {
            Write-Warning 'Please sign in with Azure PowerShell and/or AZ CLI'
        }
    }

    process {
        try {
            az appservice plan create --name $($webappName + '-plan') `
                --resource-group $resourceGroupName `
                --is-linux `
                --sku 'FREE'

            az webapp create --name $webappName `
                --plan $($webappName + '-plan') `
                --resource-group $resourceGroupName `
                --runtime $runtime
        }
        catch {
            Write-Warning 'An error has occurred'
            $PSCmdlet.ThrowTerminatingError($_)
        }
    }

    end {

    }
}