# You will need to uncomment this and put in a unique bucket name
# echo "Creating bucket for deployment artifacts"
# aws.cmd s3 mb s3://rs-demo-deployment-bucket

echo "Validate template"
sam validate --template cloud-formation.yml

echo "Packaging deployment artifacts"
mkdir -p .tmp
sam package --template-file cloud-formation.yml --s3-bucket rs-demo-deployment-bucket --output-template-file .tmp/packaged.yml

echo "Deployment starting"
sam deploy --template-file .tmp/packaged.yml --stack-name sam-service --capabilities CAPABILITY_IAM

aws --region eu-west-2 cloudformation describe-stack-resources --stack-name sam-service --logical-resource-id MyFunction

# Below is optional
# echo "Deleting bucket for deployment artifacts"
# aws.cmd s3 rm s3://rs-demo-deployment-bucket