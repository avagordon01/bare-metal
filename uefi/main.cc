/*
#include <cstddef>
#include <limits>
#include <climits>
#include <version>
#include <cstdint>
#include <cstdlib>
#include <new>
#include <typeinfo>
#include <source_location>
#include <exception>
#include <initializer_list>
#include <compare>
#include <coroutine>
#include <cstdarg>
#include <concepts>
#include <type_traits>
#include <bit>
#include <atomic>
#include <utility>
#include <tuple>
#include <memory>
#include <functional>
#include <ratio>
#include <iterator>
#include <ranges>
*/

void* LibStubStriCmp;
void* LibStubMetaiMatch;
void* LibStubStrLwrUpr;

#include <efi.h>
#include <efilib.h>

EFI_STATUS
EFIAPI
efi_main(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable) {
    EFI_STATUS Status;
    EFI_INPUT_KEY Key;
 
    /* Store the system table for future use in other functions */
    EFI_SYSTEM_TABLE *ST = SystemTable;

    Status = ST->ConOut->ClearScreen(ST->ConOut);
    if (EFI_ERROR(Status))
        return Status;
 
    Status = ST->ConOut->OutputString(ST->ConOut, const_cast<unsigned short*>(reinterpret_cast<const unsigned short*>(L"hello\n")));
    if (EFI_ERROR(Status))
        return Status;
 
    /* Now wait for a keystroke before continuing, otherwise your
       message will flash off the screen before you see it.
 
       First, we need to empty the console input buffer to flush
       out any keystrokes entered before this point */
    Status = ST->ConIn->Reset(ST->ConIn, FALSE);
    if (EFI_ERROR(Status))
        return Status;
 
    /* Now wait until a key becomes available.  This is a simple
       polling implementation.  You could try and use the WaitForKey
       event instead if you like */
    while ((Status = ST->ConIn->ReadKeyStroke(ST->ConIn, &Key)) == EFI_NOT_READY) {};
 
    return Status;
}
