# This script is to create the credentials needed to generate a GitHub secret for Azure authentication from the Python
# By default it takes the subscription ID that you are currently signed in with, but this isn't mandatory. You can
# add in whatever subscription ID you prefer.

param(
    [string]$name = 'git',
    [string]$subID = $($account = az account show --output json | ConvertFrom-Json
                       $account.id)
)

az ad sp create-for-rbac --name $name `
                         --role contributor `
                         --scopes /subscriptions/$subID `
                         --sdk-auth