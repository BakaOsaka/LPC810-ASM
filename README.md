# LPC810-ASM

Raw start-up code (assembly) to initialise an Cortex-M0 LPC810 SOC.

This application code will initialise a dummy vector table and configure Pin 0
as an output GPIO. This can be used, for example, to illuminate an LED.

To build this project, use `make`. This requires the `arm-none-eabi` compiler
toolchain. The compiled binary will be output in a number of different formats
including "hex" and "bin".

These binaries can be flashed to the target using tools such as:
- [Flash Magic](http://www.flashmagictool.com/)
- [lpc2isp](https://sourceforge.net/projects/lpc21isp/).
To flash the binary using these tools tie Pin 5 to GND to enable ISP.

For more information, refer to the document
"LPC81x User Manual - UM10601".