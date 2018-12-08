rm -rf /yocto/cache/* \
	&& rm -rf /yocto/ramdisk/* \
	&& rm -rf /yocto/deploy/* \
	&& source /opt/yocto/poky-thud/oe-init-build-env /yocto/build \
	&& echo -e 'BB_NUMBER_THREADS = "32"' > ./extra.conf \
	&& echo -e 'PARALLEL_MAKE = "-j 32"' >> ./extra.conf \
	&& echo -e 'DL_DIR = "/yocto/downloads"' >> ./extra.conf \
	&& echo -e 'SSTATE_DIR = "/yocto/cache"' >> ./extra.conf \
	&& echo -e 'TMPDIR="/yocto/ramdisk/tmpdir"' >> ./extra.conf \
	&& echo -e 'DEPLOY_DIR="/yocto/deploy"' >> ./extra.conf \
	&& MACHINE=raspberrypi-cm3 bitbake --read=./extra.conf console-image
