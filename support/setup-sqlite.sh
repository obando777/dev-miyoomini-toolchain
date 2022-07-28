#!/bin/sh

wget https://www.sqlite.org/2022/sqlite-autoconf-3390000.tar.gz
tar xvzf sqlite-autoconf-3390000.tar.gz

cd sqlite-autoconf-3390000/

./configure --host=arm-linux --prefix=/opt/miyoomini-toolchain/usr/arm-linux-gnueabihf/sysroot/usr CC=/opt/miyoomini-toolchain/usr/bin/arm-linux-gnueabihf-gcc

make

make install