#FROM resin/rpi-raspbian:latest
FROM resin/armv7hf-debian

MAINTAINER Peter LaValle <peter.lavalle@gmail.com>

# docker build -t palpi-pivpn .

# setup
USER root
    RUN curl -L https://install.pivpn.io > pivpn.io
    # be sure we're up to date
        RUN apt-get update
        RUN apt-get upgrade
    # install dependencies
        RUN apt-get install -qy \
            ca-certificates \
            iproute2 \
            wget
    
    RUN export TERM=xterm && cat pivpn.io | bash