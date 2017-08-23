#!/bin/bash -e

BRANCH="master"

if [ -d "x264" ]; then
    pushd x264
    git checkout $BRANCH
    if [ -f "Makefile" ]; then
        make distclean || true
    fi
    popd
else
    git clone --depth 1 http://git.videolan.org/git/x264
fi

pushd x264
git checkout $BRANCH
PKG_CONFIG_PATH="$FFMPEG_BUILD/lib/pkgconfig"
./configure --prefix="$FFMPEG_BUILD" --bindir="$BIN_DIR" --enable-static --disable-asm
make
VERSION=$(./version.sh | awk -F'[" ]' '/POINT/{print $4"+git"$5}')
echo "x264 - Nuxeo version" > description-pak
make install
make distclean
popd

