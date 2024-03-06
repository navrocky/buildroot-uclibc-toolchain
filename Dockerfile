FROM debian:12 AS build

RUN set -x && \
    apt-get update && \
    apt-get -y install make gcc wget cpio rsync bc file g++ unzip bzip2 patch perl

ARG BUILDROOT_VERSION
ARG ARCH

RUN set -x && \
    wget https://buildroot.org/downloads/buildroot-${BUILDROOT_VERSION}.tar.gz && \
    tar -xzf buildroot-${BUILDROOT_VERSION}.tar.gz && \
    mv buildroot-${BUILDROOT_VERSION} buildroot

COPY .config.${ARCH} buildroot/.config

RUN set -x && \
    cd buildroot && \
    make

FROM debian:12

ARG ARCH

COPY --from=build /buildroot/output/host/ /buildroot-host/

ENV PATH=/buildroot-host/bin:${PATH}
ENV CC=/buildroot-host/bin/${ARCH}-linux-gcc
ENV CXX=/buildroot-host/bin/${ARCH}-linux-g++
ENV LD=/buildroot-host/bin/${ARCH}-linux-ld
