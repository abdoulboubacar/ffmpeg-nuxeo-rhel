#!/bin/bash -e

RELEASE=1.3.0

if [ -d "yasm-$RELEASE" ]; then
    pushd yasm-$RELEASE
    if [ -f "Makefile" ]; then
        make distclean || true
    fi
    popd
else
  curl -L -O http://www.tortall.net/projects/yasm/releases/yasm-$RELEASE.tar.gz
  tar xzvf yasm-$RELEASE.tar.gz
  rm yasm-$RELEASE.tar.gz
fi

pushd yasm-$RELEASE
autoreconf -fiv
./configure --prefix="$FFMPEG_BUILD" --bindir="$BIN_DIR"
make
make install
make distclean

popd

rm -rf yasm-$RELEASE
