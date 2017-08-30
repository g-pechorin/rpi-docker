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
	# setup any plugins now
	RUN mkdir /var/gitbucket_home/plugins
		# gib network graph!
			RUN wget -p /var/gitbucket_home/plugins https://github.com/mrkm4ntr/gitbucket-network-plugin/releases/download/1.4/gitbucket-network-plugin_2.12-1.4.jar
		# gib gists!
			RUN wget -p /var/gitbucket_home/plugins https://github.com/gitbucket/gitbucket-gist-plugin/releases/download/4.10.0/gitbucket-gist-plugin_2.12-4.10.0.jar
		# gib purty files menu
			RUN wget -p /var/gitbucket_home/plugins https://github.com/tomoki1207/gitbucket-explorer-plugin/releases/download/3.0.0/gitbucket-explorer-plugin_2.12-3.0.0.jar
		# gib pages that're also purty
			RUN wget -p /var/gitbucket_home/plugins https://github.com/gitbucket/gitbucket-pages-plugin/releases/download/v1.5.0/gitbucket-pages-plugin_2.12-1.5.0.jar
	# get and run the real thing
	WORKDIR /var/gitbucket_home
		RUN wget https://github.com/gitbucket/gitbucket/releases/download/4.15.0/gitbucket.war
		CMD java -jar /var/gitbucket_home/gitbucket.war
