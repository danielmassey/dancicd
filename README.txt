An example of a full CI/CD workflow

github webhook to jenkins for all branch pull request
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

docker run --publish 6060:8080 --name test --rm outyet
