FROM gpechorin/palpi-jdk8:latest

MAINTAINER Peter LaValle <peter.lavalle@gmail.com>

#
# unlike my x86 gitlab image, this has all the shenanigans installed and ready to go ... I think ...
#

# setup pal's enviroment
USER root

# setup the user
    RUN mkdir /var/gitbucket_home
    ENV GITBUCKET_HOME /var/gitbucket_home
    RUN groupadd -r gitbucket && useradd -d $GITBUCKET_HOME gitbucket -g gitbucket
    RUN chown -R gitbucket /var/gitbucket_home
    RUN chown -R gitbucket /usr/local
    RUN usermod -a -G root gitbucket

# finally ... run it!
USER gitbucket
	# get and run the real thing
	WORKDIR /var/gitbucket_home
		# download
		RUN wget https://github.com/gitbucket/gitbucket/releases/download/4.15.0/gitbucket.war

		# setup any plugins now
		RUN mkdir /var/gitbucket_home/plugins
			WORKDIR /var/gitbucket_home/plugins
			# gib network graph!
				RUN wget https://github.com/mrkm4ntr/gitbucket-network-plugin/releases/download/1.4/gitbucket-network-plugin_2.12-1.4.jar
			# gib gists!
				RUN wget https://github.com/gitbucket/gitbucket-gist-plugin/releases/download/4.10.0/gitbucket-gist-plugin_2.12-4.10.0.jar
			# gib pages also purty
				RUN wget https://github.com/gitbucket/gitbucket-pages-plugin/releases/download/v1.5.0/gitbucket-pages-plugin_2.12-1.5.0.jar
	# launch
	WORKDIR /var/gitbucket_home
		# launch!
		CMD java -jar /var/gitbucket_home/gitbucket.war
