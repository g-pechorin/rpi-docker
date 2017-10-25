FROM frolvlad/alpine-oraclejdk8:slim

MAINTAINER Peter LaValle <peter.lavalle@gmail.com>

# setup pal's enviroment
USER root
    # be sure we're up to date
        RUN apk update
    # install dependencies
		RUN apk add --no-cache mercurial
		RUN apk add --no-cache openssl
		RUN apk add --no-cache ca-certificates
		RUN apk add --no-cache openssh-client

# setup the user
    RUN mkdir /var/jenkins_home
    ENV JENKINS_HOME /var/jenkins_home
	RUN adduser -S -h $JENKINS_HOME jenkins
    RUN chown -R jenkins /var/jenkins_home

# finally ... run it!
	USER jenkins
    WORKDIR /var/jenkins_home
    # oh hai!
        RUN wget http://mirrors.jenkins-ci.org/war/latest/jenkins.war
        CMD java -jar /var/jenkins_home/jenkins.war

# docker run -p 1983:8080 --restart unless-stopped palx86-jenkins