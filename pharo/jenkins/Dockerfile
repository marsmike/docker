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
RUN apt-get install -y cmake zip bash-completion ruby git xz-utils debhelper devscripts
RUN apt-get install -y libc6-dev:i386 libasound2:i386 libasound2-dev:i386 libasound2-plugins:i386 libssl-dev:i386 libfreetype6-dev:i386 libx11-dev:i386 libsm-dev:i386 libice-dev:i386
RUN apt-get install -y build-essential gcc-multilib g++ libxext-dev
RUN apt-get install -y libgl1-mesa-dev libgl1-mesa-glx:i386 mesa-common-dev

RUN ln -s /usr/lib/i386-linux-gnu/mesa/libGL.so /usr/lib/i386-linux-gnu/libGL.so
#RUN ln -s /usr/lib/i386-linux-gnu/mesa/libGL.so.1 /usr/lib/i386-linux-gnu/mesa/libGL.so

# switch back to user jenkins
USER jenkins
