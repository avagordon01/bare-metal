# bare metal c++ options

this repository contains a few experiments at getting c++ (with standard library) running on bare metal x86

- bios: c++, no c++ standard library, no libc, print using [interrupts](https://wiki.osdev.org/BIOS#Common_functions)
- uefi: c++, no c++ standard library, no libc, print using uefi api (via [gnu-efi](https://wiki.osdev.org/GNU-EFI) headers and edk2 ovmf uefi implementation)
- posix-uefi: c++, no c++ standard library, libc provided by [posix-uefi](https://gitlab.com/bztsrc/posix-uefi), print using `printf`. _might_ be able to port a c++ lib to the small posix api provided
- [includeos](https://www.includeos.org/): c++, uses [libc++ from llvm](https://libcxx.llvm.org/), and [musl](http://musl.libc.org/), print using e.g. `<iostream>`
