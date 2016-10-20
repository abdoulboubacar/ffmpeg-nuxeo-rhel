#!/bin/bash -e

RELEASE="1.1.9"

if [ -d "ffmpeg-$RELEASE" ]; then
    pushd ffmpeg-$RELEASE
    if [ -f "Makefile" ]; then
        make distclean || true
    fi
    popd
else
    curl -L -O http://www.ffmpeg.org/releases/ffmpeg-$RELEASE.tar.bz2
    tar xjf ffmpeg-$RELEASE.tar.bz2
    rm ffmpeg-$RELEASE.tar.bz2
fi

pushd ffmpeg-$RELEASE
PKG_CONFIG_PATH="$FFMPEG_BUILD/lib/pkgconfig" ./configure --prefix="$FFMPEG_BUILD" --extra-cflags="-I$FFMPEG_BUILD/include" \
    --extra-ldflags="-L$FFMPEG_BUILD/lib" --bindir="$BIN_DIR" \
    --enable-gpl --enable-libmp3lame \
    --enable-libtheora --enable-libvorbis \
    --enable-libx264 --enable-libvpx --enable-libfaac --enable-nonfree \
    --enable-version3 --extra-libs="-ldl"
make -j 2
make install
make distclean
hash -r
popd

rm -rf ffmpeg-$RELEASE