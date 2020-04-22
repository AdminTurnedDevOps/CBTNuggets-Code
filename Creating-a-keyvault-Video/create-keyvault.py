from azure.common.client_factory import get_client_from_cli_profile as azprofile
from azure.mgmt.keyvault import KeyVaultManagementClient
import logging
from azure import *


def create_keyvault(resource_group_name, vault_name, location, tenant, obj):
    try:
        vault = azprofile(KeyVaultManagementClient)
    except AuthenticationError:
        logging.error(
            msg='Please confirm the AZ Profile you are using has access to keyvault in Azure...')

    vault.vaults.create_or_update(
        resource_group_name,
        vault_name,
        {
            'location': location,
            'properties': {
                'sku': {
                    'name': 'standard'
                },
                'tenant_id': tenant,
                'access_policies': [{
                    'object_id': obj,
                    'tenant_id': tenant,
                    'permissions': {
                        'keys': ['Delete'],
                        'secrets': ['Delete']
                    }
                }]
            }
        }
    )


create_keyvault(resource_group_name='', vault_name='', location='', tenant='', obj='')
