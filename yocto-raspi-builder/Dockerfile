FROM ubuntu:16.04
MAINTAINER Mike Mueller <mike@objektarium.de>

ENV YOCTO_INSTALL_PATH "/opt/yocto"
ENV YOCTO_RELEASE "thud"

RUN apt update \
	&& apt -y upgrade \
	&& DEBIAN_FRONTEND=noninteractive apt -y install gawk \
		wget \
		git-core \
		diffstat \
		unzip \
		texinfo \
		gcc-multilib \
		build-essential \
		chrpath \
		socat \
		cpio \
		python \
		python3 \
		python3-pip \
		python3-pexpect \
		xz-utils \
		debianutils \
		iputils-ping \ 
		libsdl1.2-dev \
		xterm \
		curl \
		locales \
		apt-utils \
		sudo \
		mc \
		htop \
		strace \
		vim \
	&& dpkg-reconfigure locales \
	&& apt clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*	

ENV LANG en_US.utf8

RUN locale-gen en_US.UTF-8 \
	&& update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 \
	&& rm /bin/sh \
	&& ln -s /bin/bash /bin/sh \
	&& groupadd -g 1000 build \
	&& useradd -u 1000 -g 1000 -ms /bin/bash build \
	&& install -o 1000 -g 1000 -d $YOCTO_INSTALL_PATH \
	&& usermod -a -G sudo build \
	&& usermod -a -G users build \
	&& curl -o /usr/local/bin/repo https://storage.googleapis.com/git-repo-downloads/repo \
	&& chmod a+x /usr/local/bin/repo

USER build

WORKDIR ${YOCTO_INSTALL_PATH}

# Install Poky
RUN git clone --branch ${YOCTO_RELEASE} git://git.yoctoproject.org/poky.git poky-${YOCTO_RELEASE} \
	&& cd poky-${YOCTO_RELEASE} \
	&& git clone -b ${YOCTO_RELEASE} git://git.openembedded.org/meta-openembedded \
	&& git clone -b ${YOCTO_RELEASE} https://github.com/meta-qt5/meta-qt5 \
	&& git clone -b ${YOCTO_RELEASE} git://git.yoctoproject.org/meta-raspberrypi \
	&& git clone -b ${YOCTO_RELEASE} git://github.com/jumpnow/meta-rpi /home/build/meta-rpi

# Create a build directory for the FSL community BSP
RUN cd /home/build/ \
	&& mkdir work \
	&& source ${YOCTO_INSTALL_PATH}/poky-${YOCTO_RELEASE}/oe-init-build-env /home/build/work \
	&& cd /home/build \
	&& cp meta-rpi/conf/local.conf.sample work/conf/local.conf \
	&& cp meta-rpi/conf/bblayers.conf.sample work/conf/bblayers.conf

# Make /home/build the working directory
WORKDIR /home/build
