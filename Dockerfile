FROM ubuntu:16.04
MAINTAINER Peter Mescalchin <peter@magnetikonline.com>

RUN apt-get update && apt-get -y upgrade && \
	apt-get -y install autoconf checkinstall libpng12-dev libtool make nasm pkg-config && \
	apt-get clean

ADD https://github.com/mozilla/mozjpeg/archive/v3.1.tar.gz /root/build/
WORKDIR /root/build
RUN tar -xf v3.1.tar.gz

WORKDIR /root/build/mozjpeg-3.1
RUN autoreconf -fiv
RUN mkdir build
WORKDIR /root/build/mozjpeg-3.1/build
RUN ../configure && make

RUN echo "magnetikonline: mozjpeg v3.1" >description-pak && \
	checkinstall -Dy --install=no --nodoc --pkgname=mozjpeg --pkgversion=3.1 make -i install

CMD ["/bin/bash"]
