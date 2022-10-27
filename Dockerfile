FROM nvidia/cuda:11.8.0-devel-ubuntu20.04
MAINTAINER Joe Drugan

LABEL h265ize_version="bleeding edge" architecture="amd64"
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC
RUN apt update -y && apt upgrade -y && apt install curl -y && \
    curl -fsSL https://deb.nodesource.com/setup_19.x | bash - && \
    apt install -y git ffmpeg nodejs vim nvidia-driver-520 && \
    npm install FallingSnow/h265ize --global && \
    apt remove git -y && \
    apt autoremove -y && \
    mkdir /input && mkdir /output

VOLUME ["/input", "/output"]
WORKDIR /h265ize

ENTRYPOINT ["/usr/bin/h265ize", "/input", "-d", "/output"]