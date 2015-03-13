# Makefile for jcblock

CC = arm-linux-gnueabi-gcc
CFLAGS = -mfloat-abi=$(ABI) -mtune=$(CPU) -mfpu=$(FPU)
ABI = softfp
CPU = arm1176jzf-s
FPU = #neon
LFLAGS = -lasound -ldl -lm

.c.o:
	$(CC) -c $(CFLAGS) <$ -o $@

jcblock: jcblock.o tones.o truncate.o radio.o 
	$(CC) $(CFLAGS) <$ $(LFLAGS) -o $@ 

