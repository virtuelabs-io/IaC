#!/bin/sh

# Constants
CURRENT_PROFILE=awsprofile
RESOURCE=bus-name
ENV=stage

# SQS Channel
aws cloudformation create-stack \
    --stack-name $RESOURCE-$ENV \
    --template-body file://"${PWD}"/cf/messaging/event-bus.yaml \
    --parameters ParameterKey=EventBusName,ParameterValue=$RESOURCE-bridge \
                 ParameterKey=ApplicationTag,ParameterValue=Messaging \
                 ParameterKey=EnvironmentTag,ParameterValue=$ENV \
    --capabilities CAPABILITY_IAM \
    --profile $CURRENT_PROFILE

