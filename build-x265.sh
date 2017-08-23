#!/bin/bash -e

if [ -d "x265" ]; then
    pushd x265
    if [ -f "Makefile" ]; then
        make distclean || true
    fi
    popd
else
	hg clone https://bitbucket.org/multicoreware/x265
fi

pushd x265/build/linux
cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX="$FFMPEG_BUILD" -DENABLE_SHARED:bool=off ../../source
make
make install
make distclean

popd

rm -rf x265
