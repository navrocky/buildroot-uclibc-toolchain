# G++ uClibc-ng toolchain (Buildroot)

This toolchain is built with [Buildroot](https://buildroot.org) and can be useful for building very small statically
linked binaries for applications written in C++.

Enabled options:

- x86_64
- g++-13
- uClibc-ng
- linuxthreads
- i18n

To build with this toolchain use followed configuration:

```
export CC=/buildroot-host/bin/x86_64-linux-gcc
export CXX=/buildroot-host/bin/x86_64-linux-g++
export LD=/buildroot-host/bin/x86_64-linux-ld
```
