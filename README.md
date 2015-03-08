# FFmpeg build with x264 and vpx support

This set of scripts will compile and install FFmpeg packages with x264 and vpx support.
It has been mainly tested on Rhel >= 6.5

By default, it will not include AAC support since the `libfaac` libraries contain some non-free code;
see the `LIBFAAC` parameter.

## Usage

Run as root or with sudo:

    build-all.sh

This will compile the following packages:

- `ffmpeg`
- `x264`
- `libvpx-dev`
- `libx264-dev`
- `yasm` (if `BUILD_YASM=true`)
- `libfaac` (if `BUILD_LIBFAAC=true`)
- `libogg`
- `libvorbis`
- `libtheora`

### Shell parameters

    BUILD_YASM: If true, then yasm is built from sources, else its package is installed if not already present.
    BUILD_LIBFAAC: Whether to include AAC support (i.e. compile 'ffmpeg' with "--enable-libfaac --enable-nonfree" options).
    If true, then the package 'libfaac' will be compiled from sources.
