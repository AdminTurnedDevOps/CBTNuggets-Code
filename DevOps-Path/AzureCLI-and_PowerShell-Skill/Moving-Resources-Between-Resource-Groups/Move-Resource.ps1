function Move-Resource {
    [cmdletbinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    param(
        [parameter(Mandatory,
            ParameterSetName = 'moveresource',
            HelpMessage = 'Specify the resource group name that you will be moving the resource FROM')]
        [alias('sourceRG')]
        [string]$sourceResourceGroupName,

        [parameter(Mandatory,
            ParameterSetName = 'moveresource',
            HelpMessage = 'Specify the resource group name that you will be moving the resource TO')]
        [alias('destinationRG')]
        [string]$destinationResourceGroupName,

        [parameter(Mandatory,
            ParameterSetName = 'moveresource',
            HelpMessage = 'Specify the resource name that you will be moving',
            ValueFromPipeline = $true)]
        [string]$resourceName
    )

    begin {
        $login = Get-AzSubscription
        if (-not($login)) {
            Write-Output 'A login to Azure PowerShell is required. Would you like to log in?'
            $answer = Read-Host 'Type 1 for yes or 2 for no'

            switch ($answer) {
                1 { Login-AzAccount }
                2 {
                    Write-Warning 'Exiting...'
                    Pause
                    exit
                }
            }
        }
    }

    process {
        try {
            $resource = Get-AzResource -ResourceGroupName $sourceResourceGroupName -ResourceName $resourceName
        }
        catch {
            $PSCmdlet.ThrowTerminatingError($_)
        }

        try {
            if ($PSCmdlet.ShouldProcess('resourceName')) {
                Move-AzResource -DestinationResourceGroupName $destinationResourceGroupName -ResourceId $resource.id
            }
        }

        catch {
            $PSCmdlet.ThrowTerminatingError($_)
        }
    }

    end {
        
    }
}