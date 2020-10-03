#!/bin/sh

# Constants
CURRENT_PROFILE=awsprofile
RESOURCE=stack
ENV=stage

# SQS Channel
aws cloudformation create-stack \
    --stack-name $RESOURCE-profiles-queue-$ENV \
    --template-body file://"${PWD}"/cf/messaging/sqs.yaml \
    --parameters ParameterKey=QueueName,ParameterValue=$RESOURCE-profiles-queue \
                 ParameterKey=DelaySeconds,ParameterValue=5 \
                 ParameterKey=MessageRetentionPeriod,ParameterValue=3600 \
                 ParameterKey=VisibilityTimeout,ParameterValue=30 \
                 ParameterKey=maxReceiveCount,ParameterValue=5 \
                 ParameterKey=AlarmEmail,ParameterValue=operations@virtuelabs.io \
                 ParameterKey=ApplicationTag,ParameterValue=Messaging \
                 ParameterKey=EnvironmentTag,ParameterValue=$ENV \
    --capabilities CAPABILITY_IAM \
    --profile $CURRENT_PROFILE

