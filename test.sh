#!/usr/bin/env bash

set -eux

gcc \
    boot.s main.cc -T boot.ld -o image \
    -ffreestanding -nostdlib -fno-exceptions -fno-rtti \
    -fcoroutines -std=c++23
#objcopy -O binary myfile.elf myfile.bin
qemu-system-x86_64 -enable-kvm -cpu host -drive format=raw,file=image
