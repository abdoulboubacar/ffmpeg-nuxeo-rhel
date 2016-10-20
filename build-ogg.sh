#!/bin/bash -e

RELEASE=1.3.2

if [ -d "libogg-$RELEASE" ]; then
    pushd libogg-$RELEASE
    if [ -f "Makefile" ]; then
        make distclean || true
    fi
    popd
else
  curl -O http://downloads.xiph.org/releases/ogg/libogg-$RELEASE.tar.gz
  tar xzvf libogg-$RELEASE.tar.gz
  rm libogg-$RELEASE.tar.gz
fi

pushd libogg-$RELEASE
./configure --prefix="$FFMPEG_BUILD" --disable-shared
make
make install
make distclean
popd

rm -rf libogg-$RELEASE