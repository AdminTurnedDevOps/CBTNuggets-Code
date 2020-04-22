from azure.cli.core import get_default_cli as azcli

version = azcli().get_cli_version()
print(version)

azcli().invoke(['account', 'show'])