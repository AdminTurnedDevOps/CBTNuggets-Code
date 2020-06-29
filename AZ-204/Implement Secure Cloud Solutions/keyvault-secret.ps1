# Sometimes, when you are adding passwords into a system with PowerShell, they must be passed in as plain text.
# With Key Vault, it's the opposite. The value MUST be passed in as a secure string because of not, you will get a type error
# stating that System.String cannot convert to System.Security.SecureString. Example below
#$convert = $pass | ConvertFrom-SecureString

function New-Secret {
    param(
        [string]$keyVaultName,
        [string]$secretName
    )
    
    $pass = Read-Host -AsSecureString 'Input Secret Value...'

    $params = @{
        'VaultName'   = $vaultName
        'Name'        = $secretName
        'SecretValue' = $pass
    }
    
    try {
        Set-AzKeyVaultSecret @params
    }

    catch {
        $PSCmdlet.ThrowTerminatingError($_)
    }
}