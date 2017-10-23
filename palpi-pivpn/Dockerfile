#FROM resin/rpi-raspbian:latest
FROM resin/armv7hf-debian

MAINTAINER Peter LaValle <peter.lavalle@gmail.com>

# docker build -t palpi-pivpn .

# setup
USER root
	# be sure we're up to date
		RUN apt-get update
		RUN apt-get upgrade
	# install dependencies
		RUN apt-get install -qy \
			ca-certificates \
			iproute2

# create and configure a user
	RUN useradd pivpn
	RUN mkdir /var/pivpn
	COPY pivpn.io /var/pivpn/pivpn.io
	RUN chmod +=rwx /var/pivpn/pivpn.io
	RUN chown -R pivpn /var/pivpn/
	WORKDIR /var/pivpn

# install/copy the script
	RUN bash /var/pivpn/pivpn.io

#    RUN export TERM=xterm && cat pivpn.io | bash