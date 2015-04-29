#!/bin/bash -e

cd $(dirname "$0")

BUILD_LIBFAAC=${BUILD_LIBFAAC:-"false"}
BUILD_YASM=${BUILD_YASM:-"false"}

export LIBFAAC
export BUILD_YASM

./prepare-packages.sh
if [ "$BUILD_YASM" = "true" ]; then
    ./build-yasm.sh
fi
if [ "$BUILD_LIBFAAC" = "true" ]; then
    ./build-faac.sh
fi
./build-x264.sh
./build-libvpx.sh
./build-ogg.sh
./build-vorbis.sh
./build-libtheora.sh
./build-mp3lame.sh
./build-ffmpeg.sh

