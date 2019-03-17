# Serverless service

This service is deployed via the `serverless` framework

## Deployment

Ensure that AWS credentials are configured on your machine, and then run:

```
./deploy.sh
```

## Deployment of function code only

This is faster than running `serverless deploy` as it doesn't rely on `CloudFormation`

```
serverless deploy function --function query
```

## Testing

To invoke function in AWS:

```bash

serverless invoke --function query --path tests/invoke-test.json --log

```
