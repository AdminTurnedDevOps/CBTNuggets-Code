param(
    [string]$logAnalyticsResourceName = 'DefaultWorkspace-220284d2-6a19-4781-87f8-5c564ec4fec9-EUS'
)

Write-Output 'Checking existing permissions...'
$properties = Get-AzResource -ResourceType Microsoft.OperationalInsights/workspaces -ExpandProperties | foreach {$_.ResourceName + ": " + $_.Properties.features.enableLogAccessUsingOnlyResourcePermissions}

if ($properties -like "*True*") {
    Write-Output 'The workspace is configured with resource-context access mode'
    Write-Output 'Adding enable member...'

    $properties | Add-Member enableLogAccessUsingOnlyResourcePermissions $true -Force

    Write-Output 'Setting Workspace...'
    $source = Get-AzResource -Name $logAnalyticsResourceName | Select * 
    Set-AzResource -ResourceId $source.ResourceId -Properties $properties.enableLogAccessUsingOnlyResourcePermissions


}

else {
    Write-Output 'The workspace is configured with workspace-context access mode'
    Pause
    exit
}