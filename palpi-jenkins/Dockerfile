FROM gpechorin/palpi-jdk8:latest

MAINTAINER Peter LaValle <peter.lavalle@gmail.com>
# previously Martin Dilger <martin@effectivetrainings.de>

# setup pal's build enviroment
USER root
    # be sure we're up to date
        RUN apt-get update
        RUN apt-get upgrade
    # install dependencies
        RUN apt-get install -qy \
            mercurial \
            openssh-client \
            cmake \
            build-essential \
            git \
            g++

# setup the user
    RUN mkdir /var/jenkins_home
    ENV JENKINS_HOME /var/jenkins_home
    RUN groupadd -r jenkins && useradd -d $JENKINS_HOME jenkins -g jenkins
    RUN chown -R jenkins /var/jenkins_home
    RUN chown -R jenkins /usr/local
    RUN usermod -a -G root jenkins
    RUN echo 'org.gradle.daemon=false' > /var/jenkins_home/.gradle/gradle.properties

# finally ... run it!
USER jenkins
    WORKDIR /var/jenkins_home
    # oh hai!
        RUN wget http://mirrors.jenkins-ci.org/war/latest/jenkins.war
        CMD java -jar /var/jenkins_home/jenkins.war
