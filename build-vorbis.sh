#!/bin/bash -e

RELEASE=1.3.4

if [ -d "libvorbis-$RELEASE" ]; then
    pushd libvorbis-$RELEASE
    if [ -f "Makefile" ]; then
        make distclean || true
    fi
    popd
else
  curl -L -O http://downloads.xiph.org/releases/vorbis/libvorbis-$RELEASE.tar.gz
  tar xzvf libvorbis-$RELEASE.tar.gz
  rm libvorbis-$RELEASE.tar.gz
fi

pushd libvorbis-$RELEASE
./configure --prefix="$FFMPEG_BUILD" --with-ogg="$FFMPEG_BUILD" --disable-shared
make
make install
make distclean
popd

rm -rf libvorbis-$RELEASE
