OUTPUT_FORMAT(binary)

SECTIONS {
    .text : ALIGN(CONSTANT(MAXPAGESIZE)) {
        *(.text)
    }
    .data : ALIGN(CONSTANT(MAXPAGESIZE)) {
        *(.data)
    }
    .bss : ALIGN(CONSTANT(MAXPAGESIZE)) {
        *(.bss)
    }
}
