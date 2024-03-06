#!/bin/bash

IMAGE_NAME="buildroot-uclibc-toolchain"
BUILDROOT_VERSION="${BUILDROOT_VERSION:-2023.11.1}"
ARCH="${ARCH:-x86_64}"

docker build \
    --build-arg "BUILDROOT_VERSION=${BUILDROOT_VERSION}" \
    --build-arg "ARCH=${ARCH}" \
    --tag ${IMAGE_NAME}:${ARCH}-${BUILDROOT_VERSION} \
    --tag ${IMAGE_NAME}:${ARCH}-latest \
    -f Dockerfile .
