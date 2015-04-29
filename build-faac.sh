#!/bin/bash -e

RELEASE=1.28

if [ ! -f "faac-$RELEASE" ]; then
    wget http://downloads.sourceforge.net/faac/faac-$RELEASE.tar.bz2
    tar -jxvf faac-$RELEASE.tar.bz2
    pushd faac-$RELEASE
    # Fix bug on compilation
    sed -i '126d' common/mp4v2/mpeg4ip.h
    popd
fi

pushd faac-$RELEASE
./bootstrap
./configure --disable-shared
make
make install
ldconfig
popd

rm -rf faac-$RELEASE