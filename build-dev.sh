#! /bin/bash

#### Config #####
# IP's used in the security group to restrict access - I.E 123.123.123.123/32
OFFICE_IPS='["14.203.239.52/32","123.123.123.123/32"]'
#### Vars ##### 
echo "Your AWS Access Key: "
read ACCESS_KEY_ID
export AWS_ACCESS_KEY_ID="$ACCESS_KEY_ID"

echo "Your AWS Secrect Access Key: "
read SECRET_ACCESS_KEY
SECRET_ACCESS_KEY='42i7fRhQew32IJNWInuZhxWT/vsxgU+k3MP/o7IX'
export AWS_SECRET_ACCESS_KEY="$SECRET_ACCESS_KEY"

export AWS_DEFAULT_REGION="ap-southeast-2"

echo "Your AWS Account in ~/.aws/credential: "
read AWS_PROFILE
export AWS_DEFAULT_PROFILE=$AWS_PROFILE
AWS_USERID=`aws sts get-caller-identity --output text --query 'Account'`

TERRAFORM_WORKING_DIR="./terraform"
DOCKER_WORKING_DIR="./docker"

### Building Terraform Stack ####

#Change to the terraform working dir
cd $TERRAFORM_WORKING_DIR

#build with Terraform
terraform apply -var "aws_userid=${AWS_USERID}" -var "office-ips=${OFFICE_IPS}"

#### Building the Docker Image ###

echo "Getting Docker image ready..."

#Change to Docker working dir
cd $DOCKER_WORKING_DIR

# Login to AWS
AWS_LOGIN=`aws ecr get-login --no-include-email --region ap-southeast-2`
sudo $AWS_LOGIN

# Build The Docker Image
sudo docker build -t energyone-dev docker/.

# Tag Image
sudo docker tag energyone-dev:latest ${AWS_USERID}.dkr.ecr.ap-southeast-2.amazonaws.com/energyone-dev:latest

echo "Pushing Image to AWS repo..."
# Push Image
sudo docker push ${AWS_USERID}.dkr.ecr.ap-southeast-2.amazonaws.com/energyone-dev:latest
