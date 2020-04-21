from azure.common.client_factory import get_client_from_cli_profile as azprofile
from azure.mgmt.compute import ComputeManagementClient
import sys
import logging

client_auth = azprofile(ComputeManagementClient)

for vm in client_auth.virtual_machines.list_all():
    print(vm)