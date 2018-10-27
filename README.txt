An example of a full CI/CD workflow

github webhook to jenkins for all branch pull request
build web
deploy web
build app docker container
run container
unit test docker container
stop rm container 
push docker container to dockerhub with version ${BRANCH_NAME}${BUILD_NUMBER}
deploy ${BRANCH_NAME}${BUILD_NUMBER} container

Test web
Test app

record results

destroy deployment


++++++


jenkins build docker container and publish to repo


github
jenkins
static website hosted put on s3 and return URL
go API container (get, put)




test form submit
test info get

Set up github with dockerhub
https://docs.docker.com/docker-hub/builds/


go get github.com/golang/example/outyet
docker build -t outyet .
cd go/src/github.com/golang/example/outyet/

docker build -t outyet .

docker run -d --publish 6060:8080 --name test --rm outyet
