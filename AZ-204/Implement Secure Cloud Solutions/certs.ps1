param(
    [string]$vaultName = "cbtkeyvault92",
    [string]$certName = "cbttest2"
)
$policy = "@.\AZ-204\Implement Secure Cloud Solutions\policy.json"

az keyvault certificate create --name $certName `
                               --policy $policy `
                               --vault-name $vaultName