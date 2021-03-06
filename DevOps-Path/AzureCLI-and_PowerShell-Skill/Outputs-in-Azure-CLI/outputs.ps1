az webapp list --query "[].{hostName: defaultHostName, state: state}"

# Different outputs

# Default JSON
az webapp list --output json

# jsonc - Colorized JSON
az webapp list --output jsonc

# YAML output
az webapp list --output yaml

# Table output
az webapp list --output table

# Output combining AZ CLI and PowerShell
az webapp list --output json | ConvertFrom-Json | Select Name, Location, State