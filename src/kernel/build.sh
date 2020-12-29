#!/bin/zsh

time make CFLAGS=-march=native ARCH=x86_64 menuconfig
time make CFLAGS=-march=native ARCH=x86_64 prepare
time make CFLAGS=-march=native ARCH=x86_64 -j8 bzImage modules
time sudo make CFLAGS=-march=native ARCH=x86_64 -j8 modules_install
