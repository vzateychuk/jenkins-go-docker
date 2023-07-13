# Setup Jenkins on Docker
Deploy jenkins on Docker + install Golang

## Create jenkins network
```shell
docker network create jenkins
```

## Build docker image
```shell
docker build jenkins-go
```

## Run jenkins on Docker
```shell
docker run \
  --name jenkins-go \
  --restart=on-failure \
  --detach \
  --network jenkins \
  --env DOCKER_HOST=tcp://docker:2376 \
  --env DOCKER_CERT_PATH=/certs/client \
  --env DOCKER_TLS_VERIFY=1 \
  --publish 8080:8080 \
  --publish 50000:50000 \
  --volume jenkins-data:/var/jenkins_home \
  --volume jenkins-docker-certs:/certs/client:ro \
  jenkins-go
```

## Links
[Jenkins - Docker handbook. Как запустить Jenkins на Docker](https://www.jenkins.io/doc/book/installing/docker/)