#!/bin/sh

# NOTES:
#   1) This script should be run only once.
#   2) This script should be run right after necessary admin and developer roles are created

# Constants
CURRENT_PROFILE=awsprofile

# AWS CLI commands
# Create Service Linked Role for ES to access VPC resources
aws iam create-service-linked-role --aws-service-name es.amazonaws.com --profile $CURRENT_PROFILE
