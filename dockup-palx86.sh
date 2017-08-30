#!/bin/bash

docker build -t palx86-gitbucket ./palx86-gitbucket
	docker tag palx86-gitbucket gpechorin/palx86-gitbucket

docker build -t palx86-sonarqube ./palx86-sonarqube
        docker tag palx86-sonarqube gpechorin/palx86-sonarqube
