# ARM Compiler Docker Image

[![Build Status](https://travis-ci.org/tfazli/arm-compiler-docker.svg?branch=master)](https://travis-ci.org/tfazli/arm-compiler-docker) [![License: MIT](https://img.shields.io/github/license/tfazli/arm-compiler-docker)](https://github.com/tfazli/arm-compiler-docker/blob/master/LICENSE) [![DockerHub](https://img.shields.io/badge/DockerHub--blue.svg?style=flat&logo=docker)](https://hub.docker.com/r/kulebyaka/arm-compiler-ubuntu-18-04)

## Description

This repository includes a Dockerfile for building a Docker Image with support for [GNU ARM Embedded Toolchain](https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain). The result image is **based on the Ubuntu 18.04** and is useful for cross-compiling applications for any target **arm-none-eabi** platform.

One of the possible applications is to use the result image to run any CI pipelines that build your applications for stm32 microcontrollers or any other embedded hardware on the ARM architecture.

# List of Docker Image contents

1. **`GNU ARM Embedded Toolchain (version 9-2019-q4-major)`** - ready-to-use suite of tools for C, C++ and assembly cross-compiling for arm-none-eabi targets (32-bit Arm Cortex-A, Cortex-M, and Cortex-R processor families). You can change this pack to more modern version if needed.
2. **`CMake pack`** - make and CMake tools for building, testing and packaging software.
3. **`third-party tools for GoogleTest`** - is needed to build GoogleTesting libraries from sources. Allows you to build firmware with unit tests.

> **`NOTE:`** If you will to change GNU ARM Embedded Toolchain pack, **don't forget** to update Dockerfile accordingly.


# Where to find ready to use Docker Image

The Docker Image from this repository is open-source and free to use. You can find the result image on [DockerHub page](https://hub.docker.com/r/kulebyaka/arm-compiler-ubuntu-18-04). Use command below to clone this image to your local machine:

```bash
docker pull kulebyaka/arm-compiler-ubuntu-18-04
```


# Build and Push Procedure

## Dependencies

1. Docker - read [this guide](https://docs.docker.com/engine/install/ubuntu/) to install Docker. It is recomended to [manage Docker as a non-root user](https://docs.docker.com/engine/install/linux-postinstall/) after the installation.

## Docker Image Build Procedure

1. Clone this repository
2. Run commands below to build the Dicker Image. It is recomended to use **`"arm-compiler-ubuntu-18-04"`**, but you can use any other name. Depending on your preference LOCAL_VERSION may not be specified (in this case the resulting Docker Image will have an "latest" tag).

```bash
docker build -t LOCAL_IMAGE_NAME:LOCAL_VERSION .
```

## Docker Image Push Procedure

To use this Docker Image with your CI pipelines you should push it to your Docker Hub or any other registry. Run following commands in case you are using Docker Hub as an images storage: 

```bash
docker login
docker tag LOCAL_IMAGE_NAME:LOCAL_VERSION DOCKERHUB_USERNAME/arm-compiler-ubuntu-18-04:latest
docker push DOCKERHUB_USERNAME/arm-compiler-ubuntu-18-04:latest
```

> **`NOTE:`** Do not change the image name in case you are pushing different versions of the same image (different tags are allowed).

