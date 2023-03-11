OUTPUT_FORMAT(binary)

SECTIONS {
    .text.start (0) : {
        *(.text.entry)
    }
}
