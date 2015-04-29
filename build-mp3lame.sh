#!/bin/bash -e

MAJOR=3.99
RELEASE=3.99.5

if [ -d "lame-$RELEASE" ]; then
    pushd lame-$RELEASE
    if [ -f "Makefile" ]; then
        make distclean || true
    fi
    popd
else
    curl -L -O http://downloads.sourceforge.net/project/lame/lame/$MAJOR/lame-$RELEASE.tar.gz
    tar -xvf lame-$RELEASE.tar.gz
    rm lame-$RELEASE.tar.gz
fi

pushd lame-3.99.5
./configure --disable-shared --enable-nasm
make
make install
make distclean

popd

rm -rf lame-$RELEASE