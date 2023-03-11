#!/usr/bin/env bash

set -eux

if [ ! -d out ]; then
    meson setup out --cross-file x86_64-unknown-uefi.mesoncross
fi
meson install -C out

dd if=/dev/zero of=image bs=1k count=1440
mformat -i image -f 1440 ::
mmd -i image ::/EFI
mmd -i image ::/EFI/BOOT
mcopy -i image packaged/bin/main ::/EFI/BOOT/BOOTX64.EFI

qemu-system-x86_64 \
    -enable-kvm -cpu host \
    -bios /usr/share/edk2/x64/OVMF.fd \
    -drive if=none,id=stick,format=raw,file=./image \
    -device nec-usb-xhci,id=xhci \
    -device usb-storage,bus=xhci.0,drive=stick
