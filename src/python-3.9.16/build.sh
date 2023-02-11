#!/bin/bash

CWD=$(pwd)

. /env.sh

cd $CWD/src

make distclean

rm -rf ${PWD}/release
mkdir -p ${PWD}/release

rm -rf $TOOLCHAIN_BUILD_PREFIX/python3
mkdir -p $TOOLCHAIN_BUILD_PREFIX/python3

./configure \
        --target=$TOOLCHAIN_PREFIX \
        --prefix=$TOOLCHAIN_BUILD_PREFIX/python3 \
        --host=$TOOLCHAIN_PREFIX \
        --build=i586-arm-linux-gnueabi \
        --disable-ipv6 \
        ac_cv_file__dev_ptmx=no \
        ac_cv_file__dev_ptc=no
        # --disable-shared \
        # --with-ensurepip=install \

make HOSTPYTHON=${PWD}/release BLDSHARED="${PB_TOOLCHAIN_PREFIX}-gcc -shared" CROSS-COMPILE=$TOOLCHAIN_PREFIX- CROSS_COMPILE_TARGET=yes HOSTARCH=arm-linux BUILDARCH=$TOOLCHAIN_PREFIX prefix=$TOOLCHAIN_BUILD_PREFIX/python3

make install HOSTPYTHON=${PWD}/release BLDSHARED="${PB_TOOLCHAIN_PREFIX}-gcc -shared" CROSS-COMPILE=$TOOLCHAIN_PREFIX- CROSS_COMPILE_TARGET=yes HOSTARCH=arm-linux BUILDARCH=$TOOLCHAIN_PREFIX prefix=$TOOLCHAIN_BUILD_PREFIX/python3


$STRIP $TOOLCHAIN_BUILD_PREFIX/python3/bin/python3.9
file $TOOLCHAIN_BUILD_PREFIX/python3/bin/python3.9

cp ${DEV_SDK_SYSROOT}/usr/lib/libssl.so.1.1 $TOOLCHAIN_BUILD_PREFIX/lib/
$STRIP $TOOLCHAIN_BUILD_PREFIX/lib/libssl.so.1.1
file $TOOLCHAIN_BUILD_PREFIX/lib/libssl.so.1.1

cp ${DEV_SDK_SYSROOT}/usr/lib/libcrypto.so.1.1 $TOOLCHAIN_BUILD_PREFIX/lib/
$STRIP $TOOLCHAIN_BUILD_PREFIX/lib/libcrypto.so.1.1
file $TOOLCHAIN_BUILD_PREFIX/lib/libcrypto.so.1.1