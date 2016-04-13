#!/bin/bash -e

# TAG="v1.0.0"
TAG="master"

if [ -d "libvpx" ]; then
    pushd libvpx
    if [ -f "Makefile" ]; then
        make clean || true
    fi
    git checkout master
    git pull
    popd
else
    # git clone http://git.chromium.org/webm/libvpx.git
    git clone https://chromium.googlesource.com/chromium/deps/libvpx
fi

pushd libvpx
git checkout $TAG
#./configure
#make
MAJOR=$(grep '#define VERSION_MAJOR' vpx_version.h | awk '{print $3}')
MINOR=$(grep '#define VERSION_MINOR' vpx_version.h | awk '{print $3}')
PATCH=$(grep '#define VERSION_PATCH' vpx_version.h | awk '{print $3}')
VERSION="$MAJOR.$MINOR.$PATCH"
echo "libvpx - Nuxeo version" > description-pak
make
make install
make clean
popd

