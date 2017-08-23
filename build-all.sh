#!/bin/bash -e

export BIN_DIR=/usr/bin
export FFMPEG_BUILD=/home1/nuxeo-ffmpeg
export PATH=$PATH:$BIN_DIR

cd $(dirname "$0")

yum -y install unzip tar autoconf automake bzip2 cmake freetype-devel nasme gcc gcc-c++ git libtool make mercurial pkgconfig zlib-devel
yum -y install poppler-utils texi2html dcraw freetype-devel libwpd-tools ghostscript
yum -y install ImageMagick ImageMagick-devel

./build-yasm.sh
./build-x264.sh
./build-x265.sh
./build-libfdk_aac.sh
./build-mp3lame.sh
./build-libopus.sh
./build-ogg.sh
./build-vorbis.sh
./build-libvpx.sh

./build-libtheora.sh
./build-faad.sh
./build-faac.sh

./build-ffmpeg.sh

yum -y remove git mercurial

