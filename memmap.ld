OUTPUT_FORMAT("elf32-littlearm", "elf32-bigarm", "elf32-littlearm")
OUTPUT_ARCH(arm)

MEMORY
{
    rom (rx) : ORIGIN = 0x00000000, LENGTH = 0x00001000 /* 4 Kbytes */
    ram (rwx) :  ORIGIN = 0x10000000, LENGTH = 0x00000400 /* 1 Kbyte */
}

SECTIONS
{
    . = 0x0;
    .text : { *(.text*) } > rom
    .rodata : { *(.rodata*) } > rom
    .bss : { *(.bss*) } > ram
    . = ALIGN(8);
}

