#!/usr/bin/env sh

BucketName=$1

/usr/bin/aws --version
/usr/bin/aws s3api create-bucket --acl public-read --bucket $BucketName
/usr/bin/aws s3 website $BucketName --index-document index.html --error-document error.html
/usr/bin/aws s3 cp $WORKSPACE/web/index.html s3://$BucketName/index.html --grants read=uri=http://acs.amazonaws.com/groups/global/AllUsers
