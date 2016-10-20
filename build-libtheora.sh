#!/bin/bash -e

RELEASE=1.1.1

if [ -d "libtheora-$RELEASE" ]; then
    pushd libtheora-$RELEASE
    if [ -f "Makefile" ]; then
        make distclean || true
    fi
    popd
else
  curl -O http://downloads.xiph.org/releases/theora/libtheora-$RELEASE.tar.gz
  tar xzvf libtheora-$RELEASE.tar.gz
  rm libtheora-$RELEASE.tar.gz
fi

pushd libtheora-$RELEASE
./configure --prefix="$FFMPEG_BUILD" --with-ogg="$FFMPEG_BUILD" --disable-examples --disable-shared --disable-sdltest --disable-vorbistest
make
make install
make distclean
popd

rm -rf libtheora-$RELEASE