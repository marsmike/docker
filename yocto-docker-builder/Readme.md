Run with:

docker run -it --rm -v $PWD:/home/build marsmike/yocto-builder:latest

Then:
source /opt/yocto/poky/oe-init-build-env qemuarm
MACHINE=qemuarm bitbake core-image-minimal
