#!/bin/bash -e

RELEASE=1.28

if [ -e "faac-$RELEASE.tar.bz2" ]; then
    tar -jxvf faac-$RELEASE.tar.bz2
else
    echo "Download project faac-$RELEASE.tar.bz2"
fi

pushd faac-$RELEASE
./bootstrap
./configure --prefix="$FFMPEG_BUILD" --disable-shared
make
make install
ldconfig
popd

rm -rf faac-$RELEASE