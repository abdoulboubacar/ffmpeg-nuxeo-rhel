#!/bin/bash -e

RELEASE=1.1.5

if [ -d "opus-$RELEASE" ]; then
    pushd opus-$RELEASE
    if [ -f "Makefile" ]; then
        make distclean || true
    fi
    popd
else
  curl -L -O https://archive.mozilla.org/pub/opus/opus-1.1.5.tar.gz
  tar xzvf opus-$RELEASE.tar.gz
  rm opus-$RELEASE.tar.gz
fi

pushd opus-$RELEASE
autoreconf -fiv
./configure --prefix="$FFMPEG_BUILD" --bindir="$BIN_DIR" --disable-shared
make
make install
make distclean

popd

rm -rf opus-$RELEASE
