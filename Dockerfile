# this image is an updated version of madharjan/docker-base using Ununtu 18.04
FROM ubuntu:18.04
MAINTAINER Dmitry Dodetsky <colirs.developer@gmail.com>

ARG VCS_REF
ARG UBUNTU_VERSION
ARG DEBUG=false

LABEL description="Docker Base Image" os_version="Ubuntu ${UBUNTU_VERSION}" \
      org.label-schema.vcs-ref=${VCS_REF} org.label-schema.vcs-url="https://github.com/dmitryr117/docker-base"

ENV HOME /root
ENV UBUNTU_VERSION ${UBUNTU_VERSION}

RUN mkdir -p /build
COPY . /build

RUN /build/scripts/install.sh && /build/scripts/cleanup.sh

WORKDIR /root

CMD ["/sbin/my_init"]
