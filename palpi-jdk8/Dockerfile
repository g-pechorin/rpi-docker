FROM resin/rpi-raspbian:latest

MAINTAINER Peter LaValle <peter.lavalle@gmail.com>

# setup pal's basic environment
USER root
    # be sure we're up to date
        RUN apt-get update
        RUN apt-get upgrade
    # install dependencies
        RUN apt-get install -qy \
            ca-certificates \
            wget \
            oracle-java8-jdk
