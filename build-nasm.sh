#!/bin/bash -e

RELEASE=2.13.01
if [ -d "nasm-$RELEASE" ]; then
    pushd nasm-$RELEASE
    if [ -f "Makefile" ]; then
        make distclean || true
    fi
    popd
else
  curl -L -O http://www.nasm.us/pub/nasm/releasebuilds/$RELEASE/nasm-$RELEASE.tar.bz2
  tar xjvf nasm-$RELEASE.tar.bz2
  rm nasm-$RELEASE.tar.bz2
fi

pushd nasm-$RELEASE
./autogen.sh
./configure --prefix="$FFMPEG_BUILD" --bindir="$BIN_DIR"
make
make install
make distclean

popd

rm -rf nasm-$RELEASE