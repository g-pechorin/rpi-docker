FROM frolvlad/alpine-oraclejdk8:slim

MAINTAINER Peter LaValle <peter.lavalle@gmail.com>
#
# this builds with an error/warning, but, works
# ... fixing the error/warn seems beyond my wit
#


# setup pal's enviroment
USER root

# setup the user
	RUN mkdir /var/gitbucket_home
	ENV GITBUCKET_HOME /var/gitbucket_home
	RUN adduser -D -h $GITBUCKET_HOME -g gitbucket gitbucket
	RUN chown -R gitbucket /var/gitbucket_home
	RUN chown -R gitbucket /usr/local

# setup the tomfoolery for wget
	RUN apk update
	RUN apk add --no-cache openssl
	RUN apk add --no-cache ca-certificates && \
		update-ca-certificates
# finally ... run it!
USER gitbucket
	WORKDIR /var/gitbucket_home
	# oh hai!
		RUN wget https://github.com/gitbucket/gitbucket/releases/download/4.15.0/gitbucket.war
		CMD java -jar /var/gitbucket_home/gitbucket.war