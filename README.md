# Infrastructure

## Steps
- Run `initialise-project.sh` script to create IaC dependencies
- `Configure Network`: convert two of the subnets to private in the existing default VPC. This is done by creating
new route table and NACL. Route tables default route to the internet is taken off, and the NACL allows only internal
traffic.
- `Test the network` if it all works as expected by deploying instances in respective subnets
- Deploy `Cognito Resources`
- Deploy `Elastic Search Resources` 
- `Create indices` with appropriate settings
- `Create SQS` queues necessary
- `Deploy search service`
