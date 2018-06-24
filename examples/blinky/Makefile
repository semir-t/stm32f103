# Put your stlink folder here so make burn will work.
STLINK=/home/semir/.stm/stlink/

# Binaries will be generated with this name (.elf, .bin, .hex, etc)
PROJ_NAME=main

# Put your STM32F4 library code directory here
STM_COMMON = /home/semir/.stm/Libraries/STM32F1

# Put your source files here (or *.c, etc)
SRCS = main.c 
SRCS += system_stm32f1xx.c 
SRCS += delay.c

MCPU = cortex-m3
STARTUP = startup_stm32f103xb.s


# Normally you shouldn't need to change anything below this line!
#######################################################################################
# GNUGCC = $(STM_COMMON)/gcc-arm-none-eabi/bin
# CC = $(GNUGCC)/arm-none-eabi-gcc
# OBJCOPY = $(GNUGCC)/arm-none-eabi-objcopy
# SIZE =  $(GNUGCC)/arm-none-eabi-size

# GNUGCC = $(STM_COMMON)/gcc-arm-none-eabi/bin
CC = arm-none-eabi-gcc
OBJCOPY = arm-none-eabi-objcopy
SIZE = arm-none-eabi-size

CFLAGS  = -g -O2 -Wall -Tstm32_flash.ld 
CFLAGS += -mlittle-endian -mthumb -mcpu=$(MCPU) -mthumb-interwork
# important flag is -fsingle-precision-constant which prevents the double precision emulation
# CFLAGS += -mfloat-abi=hard -mfpu=fpv4-sp-d16 -fsingle-precision-constant
# CFLAGS += -mfloat-abi=hard 
CFLAGS += -I.

# Include files from STM libraries
#CFLAGS += -I$(STM_COMMON)/Utilities/STM32F4-Discovery
CFLAGS += -I$(STM_COMMON)/CMSIS/Include 
CFLAGS += -I$(STM_COMMON)/CMSIS/Device/ST/STM32F1xx/Include
# CFLAGS += -I$(STM_COMMON)/Libraries/STM32F4xx_StdPeriph_Driver/inc
# CFLAGS += -I$(STM_COMMON)/STM32F1xx/Include

# add startup file to build
SRCS += startup_stm32f103xb.s 
OBJS = $(SRCS:.c=.o)


.PHONY: proj

all: $(PROJ_NAME).elf

$(PROJ_NAME).elf: $(SRCS)
	make clean
	$(CC) $(CFLAGS) $^ -lm -lc -lnosys -o $@ 
	$(CC) $(CFLAGS) -S $< $^
	$(OBJCOPY) -O ihex $(PROJ_NAME).elf $(PROJ_NAME).hex
	$(OBJCOPY) -O binary $(PROJ_NAME).elf $(PROJ_NAME).bin
	$(SIZE) -B  $(PROJ_NAME).elf
	ls -l $(PROJ_NAME).bin


clean:
	mv $(STARTUP) startup_tmp
	rm -rf *.o $(PROJ_NAME).elf $(PROJ_NAME).hex $(PROJ_NAME).bin *.s
	mv startup_tmp $(STARTUP)
	ls

# Flash the STM32F1
upload: proj
	make
	$(STLINK)/st-flash write $(PROJ_NAME).bin 0x8000000
	make clean

