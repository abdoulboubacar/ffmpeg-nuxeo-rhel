#!/bin/bash -e

BRANCH="stable"

if [ -d "x264" ]; then
    pushd x264
    git checkout $BRANCH
    if [ -f "Makefile" ]; then
        make distclean || true
    fi
    popd
else
    git clone git://git.videolan.org/x264
fi

pushd x264
git checkout $BRANCH
./configure --enable-static
make
VERSION=$(./version.sh | awk -F'[" ]' '/POINT/{print $4"+git"$5}')
echo "x264 - Nuxeo version" > description-pak
make install
make distclean
popd

