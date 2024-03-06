# GNU C++ with uClibc-ng toolchain (Buildroot)
[![Docker Image CI](https://github.com/navrocky/buildroot-uclibc-toolchain/actions/workflows/docker-image.yml/badge.svg)](https://github.com/navrocky/buildroot-uclibc-toolchain/actions/workflows/docker-image.yml)
[![Static Badge](https://img.shields.io/badge/Github-Repository%20link-white?style=plastic&logo=github)](https://github.com/navrocky/buildroot-uclibc-toolchain)
[![Docker Pulls](https://img.shields.io/docker/pulls/navrocky/buildroot-uclibc-toolchain?style=plastic&logo=docker)](https://hub.docker.com/repository/docker/navrocky/buildroot-uclibc-toolchain)

This toolchain is built with [Buildroot](https://buildroot.org) and can be useful for building very small statically
linked binaries for applications written in C++.

Enabled options:

- x86_64 or i686
- g++-13
- uClibc-ng
- linuxthreads (pthreads)
- i18n

To build with this toolchain use followed configuration for x86_64:

```
export CC=/buildroot-host/bin/x86_64-linux-gcc
export CXX=/buildroot-host/bin/x86_64-linux-g++
export LD=/buildroot-host/bin/x86_64-linux-ld
```

And for i686:

```
export CC=/buildroot-host/bin/i686-linux-gcc
export CXX=/buildroot-host/bin/i686-linux-g++
export LD=/buildroot-host/bin/i686-linux-ld
```
