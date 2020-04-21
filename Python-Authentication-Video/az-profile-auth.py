from azure.common.client_factory import get_client_from_cli_profile as azprofile
from azure.mgmt.compute import ComputeManagementClient

compute_auth = azprofile(ComputeManagementClient)

for vm in compute_auth.virtual_machines.list_all():
    print(
        "id: {}\nName: {}".format(
            vm.id, vm.name
        )
    )