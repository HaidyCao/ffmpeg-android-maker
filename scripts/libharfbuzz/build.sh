#!/usr/bin/env bash

make clean

VPX_AS=${FAM_AS}

case $ANDROID_ABI in
  x86)
    EXTRA_BUILD_FLAGS="--target=x86-android-gcc"
    VPX_AS=${FAM_YASM}
    ;;
  x86_64)
    EXTRA_BUILD_FLAGS="--target=x86_64-android-gcc"
    VPX_AS=${FAM_YASM}
    ;;
  armeabi-v7a)
    EXTRA_BUILD_FLAGS="--target=armv7-android-gcc"
    ;;
  arm64-v8a)
    EXTRA_BUILD_FLAGS="--target=arm64-android-gcc"
    ;;
esac

set -x

CC=${FAM_CC} \
CXX=${FAM_CXX} \
AR=${FAM_AR} \
LD=${FAM_LD} \
CXXLD=${FAM_LD} \
AS=${VPX_AS} \
STRIP=${FAM_STRIP} \
NM=${FAM_NM} \
RANLIB=${FAM_RANLIB} \
./configure \
    ${EXTRA_BUILD_FLAGS} \
    --prefix=${INSTALL_DIR} \
    --with-sysroot=${SYSROOT_PATH} \
    --host=${TARGET} \
    --with-pic \
    --enable-static \
    --disable-shared || exit 1

export FFMPEG_EXTRA_LD_FLAGS="${FFMPEG_EXTRA_LD_FLAGS} -lz"

${MAKE_EXECUTABLE} clean
${MAKE_EXECUTABLE} -j${HOST_NPROC}
${MAKE_EXECUTABLE} install

