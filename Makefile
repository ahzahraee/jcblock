# Makefile for jcblock

CC = arm-linux-gnueabihf-gcc
# CC = arm-linux-gnueabi-gcc

CFLAGS = -mfloat-abi=$(ABI)
# -mtune=$(CPU)
# CFLAGS += -mfpu=$(FPU)

ABI = hard
# ABI = soft

CPU = arm1176jzf-s
FPU = neon

# CFLAGS += -D_DO_TONES -D_ANS_MACHINE -D_ANS_MACHINE

LFLAGS = -ldl -lm
# LFLAGS += -lasound

OBJ = jcblock.o truncate.o radio.o
# OBJ += tones.o

jcblock.o: jcblock.c
	$(CC) $(CFLAGS) -c jcblock.c -o jcblock.o

radio.o: radio.c
	$(CC) $(CFLAGS) -c radio.c -o radio.o

truncate.o: truncate.c
	$(CC) $(CFLAGS) -c truncate.c -o truncate.o

tones.o: tones.c
	$(CC) $(CFLAGS) -c tones.c -o tones.o
			
jcblock: $(OBJ) 
	$(CC) $(CFLAGS) $(OBJ) $(LFLAGS) -o jcblock 

clean:
	rm *.o jcblock