#!/bin/bash -e

export DEBIAN_FRONTEND=noninteractive

yum -y remove ffmpeg || true
yum -y remove ffmpeg-nuxeo || true
yum -y remove x264 || true
yum -y remove x264-nuxeo || true
yum -y remove libvpx-dev || true
yum -y remove libx264-dev || true
if [ "$BUILD_YASM" = "true" ]; then
    yum -y remove yasm || true
fi

yum update
yum -y install build-essential git libjack-jackd2-dev \
    libmp3lame-dev libopencore-amrnb-dev libopencore-amrwb-dev libsdl1.2-dev \
    libtheora-dev libva-dev libvdpau-dev libvorbis-dev libx11-dev \
    libxfixes-dev texi2html zlib1g-dev
if [ "$LIBFAAC" = "true" ]; then
    yum -y install libfaac-dev
fi
if [ "$BUILD_YASM" = "false" ] && ! (hash yasm 2>/dev/null); then
    yum -y install yasm
fi
