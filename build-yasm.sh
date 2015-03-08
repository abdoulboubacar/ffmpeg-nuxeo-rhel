#!/bin/bash -e

wget http://www.tortall.net/projects/yasm/releases/yasm-1.2.0.tar.gz
tar xzvf yasm-1.2.0.tar.gz
pushd yasm-1.2.0
./configure
make
make install
make distclean
popd
rm yasm-1.2.0.tar.gz
