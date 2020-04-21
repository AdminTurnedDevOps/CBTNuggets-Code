from azure.mgmt.compute import ComputeManagementClient as vmauth
from azure.common.credentials import ServicePrincipalCredentials
import getpass
import sys

secret = getpass.getpass(prompt='Enter the app registration secret: ')

def app_registration_auth (clientID, tenantID, subscriptionID):

    creds = ServicePrincipalCredentials(
        client_id=clientID,
        secret=secret,
        tenant=tenantID
    )

    vm_client = vmauth(creds, subscriptionID)
    print(vm_client)

clientID = sys.argv[1]
tenantID = sys.argv[2]
subscriptionID = sys.argv[3]

if __name__ == '__main__':
    app_registration_auth (clientID, tenantID, subscriptionID)
else:
    print('Running as imported library...')
    app_registration_auth (clientID, tenantID, subscriptionID)