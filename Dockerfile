FROM sdhibit/rpi-raspbian:jessie
MAINTAINER Yannick Croissant <yannick.croissant@gmail.com>

ENV QEMU_EXECVE 1
# Force armv6l
ENV QEMU_CPU arm1176

COPY . /usr/bin

RUN [ "cross-build-start" ]

# Packages
RUN apt-get update && \
    apt-get -y install git wget python make curl \
    build-essential g++ flex bison gperf ruby perl libsqlite3-dev \
    libfontconfig1-dev libicu-dev libfreetype6 libssl-dev \
    libpng-dev libjpeg-dev python libx11-dev libxext-dev

RUN [ "cross-build-end" ]


