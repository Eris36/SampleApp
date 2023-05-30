#!/bin/bash

mkdir tempdirjen

echo "FROM jenkins/jenkins:lts" > tempdirjen/Dockerfile
echo "USER root" >> tempdirjen/Dockerfile
echo "RUN apt update" >> tempdirjen/Dockerfile
echo "RUN apt install docker.io -y" >> tempdirjen/Dockerfile
echo "EXPOSE  5050" >> tempdirjen/Dockerfile

cd tempdirjen
docker build -t jenkinsapp .
docker run --rm -u root --net=host -it  -p 8080:8080 -v jenkins-data:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock -v "$HOME":/home --name jenkinsapp_server jenkinsapp

docker ps -a
