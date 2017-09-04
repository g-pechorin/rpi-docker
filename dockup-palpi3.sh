#!/bin/bash

docker build -t palpi-jdk8 ./palpi-jdk8
	docker tag palpi-jdk8 gpechorin/palpi-jdk8

docker build -t palpi-jenkins ./palpi-jenkins
	docker tag palpi-jenkins gpechorin/palpi-jenkins

docker build -t palpi-gitbucket ./palpi-gitbucket
	docker tag palpi-gitbucket gpechorin/palpi-gitbucket
