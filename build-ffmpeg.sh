#!/bin/bash -e

RELEASE="3.3"

if [ -d "ffmpeg-$RELEASE" ]; then
    pushd ffmpeg-$RELEASE
    if [ -f "Makefile" ]; then
        make distclean || true
    fi
    popd
else
    curl -L -O http://www.ffmpeg.org/releases/ffmpeg-$RELEASE.tar.bz2
    tar xjvf ffmpeg-$RELEASE.tar.bz2
    rm ffmpeg-$RELEASE.tar.bz2
fi

pushd ffmpeg-$RELEASE
PKG_CONFIG_PATH="$FFMPEG_BUILD/lib/pkgconfig" ./configure --prefix="$FFMPEG_BUILD" --extra-cflags="-I$FFMPEG_BUILD/include" \
    --extra-ldflags="-L$FFMPEG_BUILD/lib" --bindir="$BIN_DIR" --pkg-config-flags="--static" \
    --enable-gpl \
    --enable-libfdk_aac \
    --enable-libfreetype \
    --enable-libmp3lame \
    --enable-libopus \
    --enable-libvorbis \
    --enable-libtheora \
    --enable-libvpx \
    --enable-libx264 \
    --enable-libx265 \
    --enable-nonfree 

#--enable-libfaac # deprecated

make -j 2
make install
make distclean
hash -r
popd

rm -rf ffmpeg-$RELEASE

