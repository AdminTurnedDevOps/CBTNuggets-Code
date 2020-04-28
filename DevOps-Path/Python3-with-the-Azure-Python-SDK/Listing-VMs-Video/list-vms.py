from azure.common.client_factory import get_client_from_cli_profile as azprofile
from azure.mgmt.compute import ComputeManagementClient
import logging

client_auth = azprofile(ComputeManagementClient)

def list_vms():
    try:
        for vm in client_auth.virtual_machines.list_all():
            print(
                "ID: {}\n Name: {}\n Location: {}\n".format(
                    vm.id, vm.name, vm.location
                )
            )
            
    except AuthenticationError:
        logging.error(msg='An authentication error has occurred. Please confirm the AZ Profile you are signed into with "az login" is correct')
    
    except HttpOperationError:
        logging.error(msg='HTTP bad status code from Azure... please try again')

    except TokenExpiredError:
        logging.error(msg='A renewal of credentials or a refresh of existing credentials is needed...')

    except Exception as e:
        logging.error(msg=e)

if __name__ == '__main__':
    list_vms()