#!/usr/bin/env sh

cd app

docker build -t dancicd .

docker run -d --publish 6060:8080 --name test${1} dancicd

sleep 3

response=$(/usr/bin/curl --write-out %{http_code} --silent --output /dev/null localhost:6060)

if [ $response = "200" ]
then
  echo "localhost:6060 STATUS $response OK"
  exit 0
else
  echo "ERROR: $(/usr/bin/curl -v localhost:6060)"
  exit 1
fi
