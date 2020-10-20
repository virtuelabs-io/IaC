#!/bin/sh

# Constants
CURRENT_PROFILE=awsprofile
RESOURCE=bus-name
ENV=stage

# SQS Channel
aws cloudformation create-stack \
    --stack-name $RESOURCE-dlq-$ENV \
    --template-body file://"${PWD}"/cf/messaging/event-bus-dlq.yaml \
    --parameters ParameterKey=DLQName,ParameterValue=$RESOURCE-dlq \
                 ParameterKey=ApplicationTag,ParameterValue=Messaging \
                 ParameterKey=EnvironmentTag,ParameterValue=$ENV \
    --capabilities CAPABILITY_IAM \
    --profile $CURRENT_PROFILE

