#!/usr/bin/env bash

make clean

ASS_AS=${FAM_CC}

CC=${FAM_CC} \
AR=${FAM_AR} \
AS=${ASS_AS} \
RANLIB=${FAM_RANLIB} \
STRIP=${FAM_STRIP} \
./configure \
    --prefix=${INSTALL_DIR} \
    --host=${TARGET} \
    --disable-dependency-tracking \
    --with-pic \
    --disable-libtool-lock \
    --enable-static \
    --disable-fast-install \
    --disable-test \
    --disable-profile \
    --disable-coretext \
    --disable-require-system-font-provider || exit 1

export FFMPEG_EXTRA_LD_FLAGS="${FFMPEG_EXTRA_LD_FLAGS} -lz"

${MAKE_EXECUTABLE} clean
${MAKE_EXECUTABLE} -j${HOST_NPROC}
${MAKE_EXECUTABLE} install

