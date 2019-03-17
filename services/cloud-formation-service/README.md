# CloudFormation service
This service is deployed using pure CloudFormation.

## Dependencies

The deployment script depends on [7zip](https://www.7-zip.org/) and the `aws-sam-cli` package.

```
pip install --user aws-sam-cli
```

## Deployment

Ensure that AWS credentials are configured on your machine, and then run:

```
./deploy.sh
```

## Testing
To test the deployed function, run:

```
aws lambda invoke --function-name cloud-formation-service-dev-query .tmp/test-result.json
```

## Update function code

This is faster than doing a full deployment if you're just updating the function's code

```
mkdir -p .tmp
7z a .tmp/deployment.zip handler.js
aws lambda update-function-code --function-name cloud-formation-service-dev-query --zip-file fileb://.tmp/deployment.zip --publish
```
