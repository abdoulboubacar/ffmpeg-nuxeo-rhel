#!/bin/bash -e

RELEASE="1.1.9"

if [ "$BUILD_LIBFAAC" = "true" ]; then
    FAACOPTIONS="--enable-libfaac --enable-nonfree"
fi

if [ -d "ffmpeg-$RELEASE" ]; then
    pushd ffmpeg-$RELEASE
    if [ -f "Makefile" ]; then
        make distclean || true
    fi
    popd
else
    wget http://www.ffmpeg.org/releases/ffmpeg-$RELEASE.tar.bz2
    tar xjf ffmpeg-$RELEASE.tar.bz2
fi

pushd ffmpeg-$RELEASE
./configure --enable-gpl --enable-libmp3lame \
    --enable-libtheora --enable-libvorbis \
    --enable-libx264 --enable-libvpx $FAACOPTIONS \
    --enable-version3 --extra-libs="-ldl"

make
echo "ffmpeg - Nuxeo version" > description-pak
make
make install
make distclean
popd

