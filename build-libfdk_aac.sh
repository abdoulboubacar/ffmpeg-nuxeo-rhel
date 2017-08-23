#!/bin/bash -e

if [ -d "fdk-aac" ]; then
    pushd fdk-aac
    if [ -f "Makefile" ]; then
        make distclean || true
    fi
    popd
else
	git clone --depth 1 https://github.com/mstorsjo/fdk-aac
fi

pushd fdk-aac

autoreconf -fiv
./configure --prefix="$FFMPEG_BUILD" --bindir="$BIN_DIR" --disable-shared
make
make install
make distclean

popd

rm -rf fdk-aac
