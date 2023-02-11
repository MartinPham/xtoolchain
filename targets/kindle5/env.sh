#!/bin/bash

export BUILDROOT=/app

# kindle
export DEV_SDK=x-tools/arm-kindle5-linux-gnueabi
export DEV_SDK_PATH=${BUILDROOT}/${DEV_SDK}
export DEV_SDK_TOOLCHAIN_PREFIX=arm-kindle5-linux-gnueabi
export DEV_SDK_SYSROOT=${DEV_SDK_PATH}/${DEV_SDK_TOOLCHAIN_PREFIX}/sysroot
export DEV_SDK_TOOLCHAIN_BIN_PATH=${DEV_SDK_PATH}/bin
export DEV_SDK_CSTOOLS=${DEV_SDK_SYSROOT}/
export DEV_SDK_PREFIX=/mnt/us/dev

echo "DEV_SDK = $DEV_SDK"
echo "DEV_SDK_PATH = $DEV_SDK_PATH"
echo "DEV_SDK_TOOLCHAIN_PREFIX = $DEV_SDK_TOOLCHAIN_PREFIX"
echo "DEV_SDK_SYSROOT = $DEV_SDK_SYSROOT"
echo "DEV_SDK_TOOLCHAIN_BIN_PATH = $DEV_SDK_TOOLCHAIN_BIN_PATH"
echo "DEV_SDK_CSTOOLS = $DEV_SDK_CSTOOLS"
echo "DEV_SDK_PREFIX = $DEV_SDK_PREFIX"


export CSTOOLS=${DEV_SDK_CSTOOLS}
export TOOLCHAIN_PREFIX=${DEV_SDK_TOOLCHAIN_PREFIX}
export TOOLCHAIN_BIN_PATH=${DEV_SDK_TOOLCHAIN_BIN_PATH}
export TOOLCHAIN_BUILD_PREFIX=${DEV_SDK_PREFIX}



export TOOLCHAIN_BIN=${TOOLCHAIN_BIN_PATH}/${TOOLCHAIN_PREFIX}

export TARGET_ARCH="-mcpu=cortex-a8 -march=armv7-a"
export TARGET_TUNE="-mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb"

export CMAKE_C_COMPILER=${TOOLCHAIN_BIN}-gcc
export CMAKE_CXX_COMPILER=${TOOLCHAIN_BIN}-g++
export AR=${TOOLCHAIN_BIN}-ar
export CC=${TOOLCHAIN_BIN}-gcc
export CXX=${TOOLCHAIN_BIN}-g++
export LINK=${TOOLCHAIN_BIN}-g++
export CPP="${TOOLCHAIN_BIN}-gcc -E"
export LD=${TOOLCHAIN_BIN}-ld
export AS=${TOOLCHAIN_BIN}-as
export CCLD="${TOOLCHAIN_BIN}-gcc ${TARGET_ARCH} ${TARGET_TUNE}"
export NM=${TOOLCHAIN_BIN}-nm
export STRIP=${TOOLCHAIN_BIN}-strip
export OBJCOPY=${TOOLCHAIN_BIN}-objcopy
export RANLIB=${TOOLCHAIN_BIN}-ranlib
export STRIP=${TOOLCHAIN_BIN}-strip
# export F77="arm-linux-gnueabi-g77 ${TARGET_ARCH} ${TARGET_TUNE}"
unset LIBC


export CSTOOLS_INC=${CSTOOLS}/include
export CSTOOLS_LIB=${CSTOOLS}/lib
export ARM_TARGET_LIB=$CSTOOLS_LIB
export GYP_DEFINES="armv7=1"
export CXXFLAGS="-march=armv7-a"
export LDFLAGS="-L${CSTOOLS_LIB} -Wl,-rpath,/mnt/us/system/lib -Wl,-rpath-link,${CSTOOLS_LIB} -Wl,-O1 -Wl,--hash-style=gnu"
export CFLAGS="-I${CSTOOLS_INC} -fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb3"
export CPPFLAGS="-I${CSTOOLS_INC}"
export CCFLAGS="-march=armv7-a"

export SHELL="/bin/bash"
export TERM="screen"
export LANG="en_US.UTF-8"
export MAKE="make"

export HOME=$BUILDROOT
export PATH="${TOOLCHAIN_BIN_PATH}:${CSTOOLS}/bin:${PATH}"


for f in ${DEV_SDK_PATH}/lib/*; do ln -s $f /lib/$(basename $f); done
for f in ${DEV_SDK_SYSROOT}/lib/*; do ln -s $f /lib/$(basename $f); done
for f in ${DEV_SDK_SYSROOT}/usr/lib/*; do ln -s $f /lib/$(basename $f); done