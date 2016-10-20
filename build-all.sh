#!/bin/bash -e

export BIN_DIR=/usr/bin
export FFMPEG_BUILD=/home1/nuxeo-ffmpeg
export PATH=$PATH:$BIN_DIR

cd $(dirname "$0")

yum -y install gcc tar unzip git autoconf automake gcc-c++ libtool make nasm pkgconfig zlib-devel bzip2
yum -y install java-1.8.0-openjdk libreoffice libreoffice-headless poppler-utils texi2html dcraw freetype-devel libwpd-tools ghostscript
yum -y install ImageMagick ImageMagick-devel

./build-yasm.sh
./build-x264.sh
./build-libvpx.sh
./build-mp3lame.sh
./build-ogg.sh
./build-libtheora.sh
./build-vorbis.sh
./build-faad.sh
./build-faac.sh
./build-ffmpeg.sh

