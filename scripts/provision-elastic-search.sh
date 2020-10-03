#!/bin/sh

# Constants
CURRENT_PROFILE=awsprofile
DOMAIN_NAME=stack

# AWS CF CLI command
aws cloudformation create-stack \
    --stack-name $DOMAIN_NAME-es \
    --template-body file://${PWD}/cf/search/elastic-search.yaml \
    --parameters ParameterKey=DomainName,ParameterValue=$DOMAIN_NAME \
                 ParameterKey=ElasticsearchVersion,ParameterValue=7.7 \
                 ParameterKey=InstanceType,ParameterValue=t3.small.elasticsearch \
                 ParameterKey=InstanceCount,ParameterValue=1 \
                 ParameterKey=IOPS,ParameterValue=0 \
                 ParameterKey=VolumeSize,ParameterValue=20 \
                 ParameterKey=VolumeType,ParameterValue=standard \
                 ParameterKey=DeployInVPC,ParameterValue=NO \
                 ParameterKey=VPCId,ParameterValue=vpc-71a2431a \
                 ParameterKey=SubnetIds,ParameterValue=\"subnet-f3afa09b\" \
                 ParameterKey=DefaultIngressCidrBlock,ParameterValue=172.31.0.0/16 \
                 ParameterKey=AdditionalIngressCidrBlock,ParameterValue=88.104.99.73/32 \
                 ParameterKey=UseCognitoAuthForKibana,ParameterValue=NO \
                 ParameterKey=IdentityPoolId,ParameterValue=none \
                 ParameterKey=UserPoolId,ParameterValue=none \
                 ParameterKey=CognitoAuthenticatedUserRoleARN,ParameterValue=none \
                 ParameterKey=ApplicationTag,ParameterValue=Search \
    --capabilities CAPABILITY_IAM \
    --profile $CURRENT_PROFILE
