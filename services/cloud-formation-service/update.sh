mkdir -p .tmp

echo "Creating deployment artifact"
7z a .tmp/deployment.zip handler.js

echo "Updating and publishing function code"
aws lambda update-function-code --function-name cloud-formation-service-dev-query --zip-file fileb://.tmp/deployment.zip --publish