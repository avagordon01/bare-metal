#!/usr/bin/env bash

set -eux

if [ ! -d out ]; then
    meson setup out --cross-file x86_64-unknown-uefi.mesoncross
fi
meson install -C out

mkdir -p disk/EFI/BOOT
cp packaged/bin/main disk/EFI/BOOT/BOOTX64.EFI
qemu-system-x86_64 \
    -enable-kvm -cpu host \
    -bios /usr/share/edk2/x64/OVMF.fd \
    -drive format=raw,file=fat:rw:disk
