#!/bin/sh

# Constants
CURRENT_PROFILE=awsprofile
COGNITO_AUTH_NAME=stack

# AWS CF CLI command
aws cloudformation create-stack \
    --stack-name $COGNITO_AUTH_NAME-cognito-resources \
    --template-body file://${PWD}/cf/auth/customer-cognito.yaml \
    --parameters ParameterKey=AuthName,ParameterValue=$COGNITO_AUTH_NAME \
    --capabilities CAPABILITY_IAM \
    --profile $CURRENT_PROFILE
