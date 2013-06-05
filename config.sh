#!/bin/sh
ROOTDIR=/home/taoanran/git/anrdroid4.0
TMPDIR=$ROOTDIR/tmp
#toolchain
PREBUILT=$ROOTDIR/prebuilt/linux-x86/toolchain/arm-eabi-4.4.3
#PREBUILT=$ROOTDIR/prebuilt/linux-x86/toolchain/arm-linux-androideabi-4.4.x
#NDK
#PLATFORM=$ROOTDIR/prebuilt/ndk/android-ndk-r6/platforms/android-9/arch-arm
PLATFORM=$ROOTDIR/prebuilt/ndk/android-ndk-r4/platforms/android-8/arch-arm

./configure --target-os=linux \
    --enable-version3 \
    --arch=arm \
    --cpu=armv7-a \
    --enable-cross-compile \
    --extra-cflags="-fPIC -DANDROID -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64" \
    --cc=$PREBUILT/bin/arm-linux-androideabi-gcc \
    --cross-prefix=$PREBUILT/bin/arm-linux-androideabi- \
    --nm=$PREBUILT/bin/arm-linux-androideabi-nm \
    --enable-static \
    --disable-shared \
    --disable-asm \
    --disable-yasm \
    --prefix=$ROOTDIR/ffmpeg_android_bin \
    --extra-ldflags="-Wl,-T,$PREBUILT/arm-linux-androideabi/lib/ldscripts/armelf_linux_eabi.x -Wl,\
        -rpath-link=$PLATFORM/usr/lib \
        -L$PLATFORM/usr/lib -nostdlib \
        $PREBUILT/lib/gcc/arm-linux-androideabi/4.4.3/crtbegin.o \
        $PREBUILT/lib/gcc/arm-linux-androideabi/4.4.3/crtend.o -lc -lm -ldl"
