FROM gpechorin/palpi-jdk8:latest

MAINTAINER Peter LaValle <peter.lavalle@gmail.com>

# setup pal's enviroment
USER root
    # be sure we're up to date
        RUN apt-get update
        RUN apt-get upgrade
    # install dependencies
        RUN apt-get install -qy \
            openssh-client \
            openssh-server

# setup the user
    RUN mkdir /var/gitbucket_home
    ENV GITBUCKET_HOME /var/gitbucket_home
    RUN groupadd -r gitbucket && useradd -d $GITBUCKET_HOME gitbucket -g gitbucket
    RUN chown -R gitbucket /var/gitbucket_home
    RUN chown -R gitbucket /usr/local
    RUN usermod -a -G root gitbucket

# finally ... run it!
USER gitbucket
    WORKDIR /var/gitbucket_home
    # oh hai!
        RUN wget https://github.com/gitbucket/gitbucket/releases/download/4.15.0/gitbucket.war
        CMD java -jar /var/gitbucket_home/gitbucket.war
