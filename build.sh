#!/bin/bash

IMAGE_NAME="buildroot-uclibc-toolchain"
BUILDROOT_VERSION="${BUILDROOT_VERSION:-2023.11.1}"

docker build --progress plain --build-arg "BUILDROOT_VERSION=${BUILDROOT_VERSION}" --tag ${IMAGE_NAME} -f Dockerfile .
