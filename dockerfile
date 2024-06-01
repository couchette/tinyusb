FROM ubuntu:22.04

WORKDIR /app

RUN mkdir /sdk
RUN apt-get update
RUN sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list
RUN sed -i s@/security.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list
RUN apt-get clean
RUN apt-get update
RUN set -x \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        bash-completion \
        curl \
        wget \
        git \
        less \
        make \
		nano \
        tar \
        unzip \
        zip \
		python3-dev \
		ca-certificates \
    && apt-get clean && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

RUN set -x \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        cmake \
		gcc-arm-none-eabi \
		libnewlib-arm-none-eabi \
		build-essential \
		libstdc++-arm-none-eabi-newlib \
    && apt-get clean && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

RUN set -x \
    && cd /sdk \
    && git clone -b master https://github.com/raspberrypi/pico-sdk.git \
    && cd pico-sdk \
    && git submodule update --init \
    && cd .. \
    && git clone -b master https://github.com/raspberrypi/pico-examples.git
    
ENV PICO_SDK_PATH /sdk/pico-sdk