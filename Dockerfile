FROM debian:12 AS build

RUN set -x && \
    apt-get update && \
    apt-get -y install make gcc wget cpio rsync bc

ARG BUILDROOT_VERSION

RUN set -x && \
    wget https://buildroot.org/downloads/buildroot-${BUILDROOT_VERSION}.tar.gz && \
    tar -xzf buildroot-${BUILDROOT_VERSION}.tar.gz && \
    mv buildroot-${BUILDROOT_VERSION} buildroot

COPY .config buildroot/

RUN apt-get install -y file g++ unzip bzip2 patch
RUN apt-get install -y perl

RUN set -x && \
    cd buildroot && \
    make

FROM debian:12

COPY --from=build /buildroot/output/host/ /buildroot-host/

ENV PATH=/buildroot-host/bin:${PATH}
ENV CC=/buildroot-host/bin/x86_64-linux-gcc
ENV CXX=/buildroot-host/bin/x86_64-linux-g++
ENV LD=/buildroot-host/bin/x86_64-linux-ld
