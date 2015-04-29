#!/bin/bash
export TMPDIR=/home/djia/tmpdir

NDK=/home/djia/android/android-ndk-r10
SYSROOT=$NDK/platforms/android-16/arch-x86/
TOOLCHAIN=/home/djia/android/android-ndk-r10/toolchains/x86-4.9/prebuilt/linux-x86_64

CPU=x86
PREFIX=/root/workspace/ffmpeg_shared_compile/dxjia_ffmpeg_install/x86/

function build_one
{
./configure \
  --prefix=$PREFIX \
  --enable-shared \
  --disable-static \
  --disable-doc \
  --disable-ffmpeg \
  --disable-ffplay \
  --disable-ffprobe \
  --disable-ffserver \
  --disable-doc \
  --disable-symver \
  --enable-small \
  --disable-yasm \
  --cross-prefix=$TOOLCHAIN/bin/i686-linux-android- \
  --target-os=linux \
  --arch=x86 \
  --enable-cross-compile \
  --sysroot=$SYSROOT \
  --extra-cflags="-Os -fpic" \
$ADDITIONAL_CONFIGURE_FLAG
make clean
make
make install
}

build_one
