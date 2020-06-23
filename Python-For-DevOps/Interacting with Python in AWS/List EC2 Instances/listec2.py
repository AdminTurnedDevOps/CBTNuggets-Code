import boto3
from botocore.exceptions import *
import logging


def get_ec2_info():
    try:
        ec2 = boto3.resource('ec2')
        print_instances = ec2.instances.all()

        print('Outputting EC2 Info...\n')

        for ec2instance in print_instances:
            print(
                "ID: {}\nType: {} \nPublic IPv4: {}\nAMI: {}\nState: {}\nTags: {}\nSecurityGroups: {}\n".format(
                    ec2instance.id, ec2instance.instance_type, ec2instance.public_ip_address, ec2instance.image.id,
                    ec2instance.state, ec2instance.tags, ec2instance.security_groups
                )
            )

    except ClientError as e:
        logging.error(e)

    except Exception as e:
        logging.debug('Checking resource')
        logging.warning(e)
        print(e)


if __name__ == '__main__':
    get_ec2_info()
else:
    print('Running As Imported...')
    get_ec2_info()