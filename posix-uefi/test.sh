#!/usr/bin/env bash

set -eux

UEFI_ARGS="\
    -Iposix-uefi/uefi \
    posix-uefi/uefi/crt_x86_64.c \
    posix-uefi/uefi/dirent.c \
    posix-uefi/uefi/qsort.c \
    posix-uefi/uefi/stat.c \
    posix-uefi/uefi/stdlib.c \
    posix-uefi/uefi/stdio.c \
    posix-uefi/uefi/string.c \
    posix-uefi/uefi/time.c \
    posix-uefi/uefi/unistd.c \
"

CFLAGS="\
    -target x86_64-unknown-windows \
    -fno-stack-protector \
    -ffreestanding \
    -fshort-wchar \
    -mno-red-zone \
    -mno-mmx \
    -mno-sse \
"
LDFLAGS="\
    -target x86_64-unknown-windows \
    -nostdlib \
    -Wl,-entry:uefi_init \
    -Wl,-subsystem:efi_application \
    -fuse-ld=lld \
"

clang -c \
    $CFLAGS $LDFLAGS \
    $UEFI_ARGS

clang++ \
    *.o \
    main.cc -o main \
    $CFLAGS $LDFLAGS \
    -Iposix-uefi/uefi

mkdir -p disk/EFI/BOOT
cp main disk/EFI/BOOT/BOOTX64.EFI
qemu-system-x86_64 \
    -enable-kvm -cpu host \
    -bios /usr/share/edk2/x64/OVMF.fd \
    -drive format=raw,file=fat:rw:disk
