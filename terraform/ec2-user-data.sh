#!/bin/bash
yum update -y
yum install -y docker
service docker start
usermod -a -G docker ec2-user
docker run -d -p 9000:9000 your-dockerhub-username/myjava-app:latest
