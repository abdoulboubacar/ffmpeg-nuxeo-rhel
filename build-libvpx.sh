#!/bin/bash -e

if [ -d "libvpx" ]; then
    pushd libvpx
    if [ -f "Makefile" ]; then
        make clean || true
    fi
    popd
else
    git clone --depth 1 https://chromium.googlesource.com/webm/libvpx.git
fi

pushd libvpx
./configure --prefix="$FFMPEG_BUILD" --disable-examples --disable-unit-tests --enable-vp9-highbitdepth --as=yasm
make
make install
make clean

popd

rm -rf libvpx