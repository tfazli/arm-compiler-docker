FROM ubuntu:18.04
MAINTAINER Tamash Fazli <kulebyaka2101@gmail.com>
ENV TZ Europe/Moscow
ENV DEBIAN_FRONTEND noninteractive

# GNU ARM Embedded Toolchain Installation
RUN apt-get clean && apt-get update \
    && apt-get install -y apt-utils bzr wget && apt-get clean
RUN cd /home && wget https://developer.arm.com/-/media/Files/downloads/gnu-rm/9-2019q4/gcc-arm-none-eabi-9-2019-q4-major-x86_64-linux.tar.bz2 \
    && tar -vxf gcc-arm-none-eabi-9-2019-q4-major-x86_64-linux.tar.bz2 \
    && cp -rf /home/gcc-arm-none-eabi-9-2019-q4-major/* /usr/ \
    && rm -rf /home/gcc-arm-none-eabi-9-2019-q4-major \
    && rm /home/gcc-arm-none-eabi-9-2019-q4-major-x86_64-linux.tar.bz2

# CMake, Make & third-party tools for GoogleTest Installation
RUN apt-get install -y make cmake autoconf libtool automake \
    && apt-get clean
