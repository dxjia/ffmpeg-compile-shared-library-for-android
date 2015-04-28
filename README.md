# ffmpeg for android shared library
  移植ffmpeg到android，编译可用于jni调用的so库.
本项目使用的是ffmpeg 2.6.2版本

# 环境
  ubuntu 12.04LTS x86_64<br>
  android-ndk64-r10-linux-x86_64

# 获取代码
```
  git clone git@github.com:dxjia/ffmpeg-for-android-shared-library.git
```

# 介绍
build_android.sh<br>
```java
#!/bin/bash
export TMPDIR=/home/djia/tmpdir
NDK=/home/djia/android/android-ndk-r10
SYSROOT=$NDK/platforms/android-16/arch-arm/
TOOLCHAIN=/home/djia/android/android-ndk-r10/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64
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
--cross-prefix=$TOOLCHAIN/bin/arm-linux-androideabi- \
--target-os=linux \
--arch=arm \
--enable-cross-compile \
--sysroot=$SYSROOT \
--extra-cflags="-Os -fpic $ADDI_CFLAGS" \
--extra-ldflags="$ADDI_LDFLAGS" \
$ADDITIONAL_CONFIGURE_FLAG
make clean
make
make install
}
CPU=arm
PREFIX=/root/workspace/ffmpeg_shared_compile/dxjia_ffmpeg_install
ADDI_CFLAGS="-marm"
build_one
```


#编译
```
cd source/ffmpeg<br>
./build_andrioid.sh
```

# Reference & Thanks
  [android-ffmpeg-tutorial](https://github.com/roman10/android-ffmpeg-tutorial)
