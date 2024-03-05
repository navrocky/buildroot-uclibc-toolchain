#!/bin/bash

IMAGE_NAME=buildroot-uclibc-toolchain

docker build --progress plain --tag ${IMAGE_NAME} -f Dockerfile .

docker run --rm -it ${IMAGE_NAME} bash
