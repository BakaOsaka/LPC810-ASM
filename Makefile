CROSS_COMPILE := arm-none-eabi-

ASFLAGS += --warn --fatal-warnings -mcpu=cortex-m0 -mthumb

all : start.bin start.hex

clean:
	rm -f *.hex
	rm -f *.bin
	rm -f *.o
	rm -f *.elf

#---------------------------------

start.o : start.S
	$(CROSS_COMPILE)as $(ASFLAGS) start.S -o start.o

start.elf : memmap.ld start.o
	$(CROSS_COMPILE)ld -o start.elf -T memmap.ld start.o

start.bin: start.elf
	$(CROSS_COMPILE)objcopy start.elf start.bin -O binary

start.hex: start.elf
	$(CROSS_COMPILE)objcopy start.elf start.hex -O ihex
