# SAM service

This service is deployed using CloudFormation SAM resources

## Deployment

Ensure that AWS credentials are configured on your machine, and then run:

```
./deploy.sh
```

## Testing

To invoke function in AWS:

```
aws lambda invoke --function-name <FUNCTION NAME HERE> .tmp/test-result.json
```