echo "Deploying cloud-formation service"

Region="eu-west-2"
StackName="cloud-formation-service"

echo "Validating CloudFormation template"

templateBody=`cat cloud-formation.yml`

if ! aws --region $Region cloudformation validate-template --template-body "$templateBody" ;
    then exit 1;
fi

# You will need to uncomment this and put in a unique bucket name
# echo "Creating bucket for deployment artifacts"
# aws.cmd s3 mb s3://rs-demo-deployment-bucket

echo "Creating deployment artifact"
mkdir -p .tmp
7z a .tmp/deployment.zip handler.js

echo "Uploading deployment artifacts"
aws.cmd s3 cp .tmp/deployment.zip s3://rs-demo-deployment-bucket

echo "Creating/updating stack"

if ! aws.cmd cloudformation deploy --template-file cloud-formation.yml --stack-name $StackName --region $Region --no-fail-on-empty-changeset --capabilities CAPABILITY_NAMED_IAM ;
    then exit 1;
fi

aws.cmd --region $Region cloudformation describe-stack-resources --stack-name $StackName --logical-resource-id QueryLambdaFunction

# Below is optional
# echo "Deleting bucket for deployment artifacts"
# aws.cmd s3 rm s3://rs-demo-deployment-bucket