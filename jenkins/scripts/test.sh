#!/usr/bin/env sh

response=$(/usr/bin/curl --write-out %{http_code} --silent --output /dev/null https://s3.amazonaws.com/$1/index.html)

if [ $response = "200" ]
then
  echo "https://s3.amazonaws.com/$1/index.html STATUS $response OK"
  exit 0
else
  echo "ERROR: $(/usr/bin/curl -v https://s3.amazonaws.com/$1/index.html)"
  exit 1
fi
