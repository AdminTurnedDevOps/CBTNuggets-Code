# Install AWS CLI

# Windows
https://awscli.amazonaws.com/AWSCLIV2.msi

# MacOS
https://awscli.amazonaws.com/AWSCLIV2.pkg

# aws configuration on the terminal
# For the configuration, you will need to create an IAM user that has access to the resource you want to interact with at the programmatic level. You will need;
# 1. Log into the AWS console and go to: https://console.aws.amazon.com/iam/home?region=us-east-1#/home
# 2. Click on Users
# 3. Click Add User
# 4. Create a new user with Programmatic Access
# 5. Attach an existing policy. For the purposes of the demo, we'll give the user full admin

aws configure

