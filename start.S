@
@ start.S
@
@ Main entrypoint for LPC810-based devices
@
@ 2019.01.10 Created
@
@

.cpu cortex-m0
.thumb

.thumb_func
.global _start
_start:
stacktop: .word 0x10000400
.word Reset_Handler        @ Reset
.word hang                 @ NMI
.word hang                 @ HardFault
.word hang                 @ Reserved
.word hang                 @ Reserved
.word hang                 @ Reserved
.word hang                 @ Reserved
.word hang                 @ Reserved
.word hang                 @ Reserved
.word hang                 @ Reserved
.word hang                 @ SVCall
.word hang                 @ Reserved
.word hang                 @ Reserved
.word hang                 @ PendSV
.word hang                 @ SysTick

.thumb_func
Reset_Handler:
    ldr r1, =0x4000C1C0 @ Load PINENABLE0 address
    ldr r0, =0xFFFFFFBF @ Enable PIO0_0 as GPIO
    str r0, [r1]        @ Store value of r0 in address of r1

    ldr r0, =0xA0002000 @ Load GPIO DIR0 address
    ldr r0, [r0]        @ Assign address to register
    ldr r1, =0xA0002000 @ Load GPIO DIR0 address
    ldr r2, =0x4        @ Load mask value (1 << 2) to set PINO0_0 as output
    orr r0, r2          @ Logical OR the current value + mask value
    str r0, [r1]        @ Store value of ORed value at DIR0 address

    ldr r0, =0xA0002100 @ Load GPIO PIN0 address
    ldr r0, [r0]        @ Assign address to register
    ldr r1, =0xA0002100 @ Load GPIO PIN0 address
    ldr r2, =0x4        @ Load mask value (1 << 2) to toggle PINO0_0
    eor r0, r2          @ Exclusive OR the current value + mask value
    str r0, [r1]        @ Store value of ORed value at DIR0 address

    bl hang

hang:
    b .
.end
