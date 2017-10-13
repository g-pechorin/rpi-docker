FROM frolvlad/alpine-oraclejdk8:slim

MAINTAINER Peter LaValle <peter.lavalle@gmail.com>
#
# this builds with an error/warning, but, works
# ... fixing the error/warn seems beyond my wit
#


# setup pal's enviroment
USER root

# setup the user
	RUN mkdir /var/sonarqube_home
	ENV SONARQUBE_HOME /var/sonarqube_home
	RUN adduser -D -h $SONARQUBE_HOME -g sonarqube sonarqube
	RUN chown -R sonarqube /var/sonarqube_home
	RUN chown -R sonarqube /usr/local

# setup the tomfoolery for wget
	RUN apk update
	RUN apk add --no-cache openssl
	RUN apk add --no-cache ca-certificates && \
		update-ca-certificates
# finally ... run it!
USER sonarqube
	WORKDIR /var/sonarqube_home
	# oh hai!
		RUN wget https://sonarsource.bintray.com/Distribution/sonarqube/sonarqube-6.5.zip
		RUN unzip sonarqube-6.5.zip
		RUN rm sonarqube-6.5.zip
		RUN chmod +=rx /var/sonarqube_home/sonarqube-6.5/bin/linux-x86-64/sonar.sh
		CMD sonarqube-6.5/bin/linux-x86-64/sonar.sh console