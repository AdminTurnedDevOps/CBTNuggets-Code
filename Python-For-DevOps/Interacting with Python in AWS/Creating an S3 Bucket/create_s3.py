import boto3
from botocore.exceptions import *
import sys
import logging
import time


def create_s3(bucket_name):

    try:
        s3 = boto3.client('s3')
        bucket = s3.list_buckets()

        if bucket_name in str(bucket):
            logging.error('Bucket already exists...')
            time.sleep(5)
            exit()

        else:
            print(f'Creating S3 bucket: {bucket_name}\n')
            s3.create_bucket(Bucket=bucket_name)

    except ClientError as e:
        logging.error(e)


bucket_name = sys.argv[1]

if __name__ == '__main__':
    create_s3(bucket_name)
else:
    print('Importing Program...')
    create_s3(bucket_name)

