#!/bin/bash -e

RELEASE=2.7

if [ -e "faad2-$RELEASE.tar.bz2" ]; then
    tar -jxvf faad2-$RELEASE.tar.bz2
else
    echo "Download project faad2-$RELEASE"
fi

pushd faad2-$RELEASE
autoreconf -fiv
./configure --prefix="$FFMPEG_BUILD" --disable-shared -disable-drm -disable-mpeg4ip
make
make install
ldconfig
popd

rm -rf faad2-$RELEASE