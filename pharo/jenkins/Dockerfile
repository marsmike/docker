
FROM jenkinsci/jenkins:latest
MAINTAINER Mike Müller <mike@objektarium.de>

ENV REFRESHED_AT 2016-05-30

USER root
RUN apt-get update
RUN apt-get install -y software-properties-common python-software-properties

# add sudo to the image
RUN apt-get update \
&& apt-get install -y sudo \
&& rm -rf /var/lib/apt/lists/*
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

# add pharo 40 prerequisites
RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get install -y libx11-6:i386
RUN apt-get install -y libgl1-mesa-glx:i386
RUN apt-get install -y libfontconfig1:i386
RUN apt-get install -y libssl1.0.0:i386

# install dev packages
RUN apt-get install -y build-essential
RUN apt-get install -y --fix-missing gcc g++ cmake lib32c-dev libasound2-dev libgcrypt11-dev libssl-dev \
libfreetype6-dev libgl1-mesa-dev ruby1.9.1 git-all lib32z1 lib32ncurses5 debhelper devscripts \
autoconf g++ make openssl libssl-dev libcurl4-openssl-dev libcurl4-openssl-dev pkg-config libsasl2-dev

# switch back to user jenkins
USER jenkins
