	.syntax unified
	.cpu cortex-m3
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.thumb
	.file	"main.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.thumb
	.thumb_func
	.type	main, %function
main:
.LFB63:
	.file 1 "main.c"
	.loc 1 12 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL0:
	push	{r4, r5, lr}
	.cfi_def_cfa_offset 12
	.cfi_offset 4, -12
	.cfi_offset 5, -8
	.cfi_offset 14, -4
	.loc 1 14 0
	movs	r4, #0
	.loc 1 12 0
	sub	sp, sp, #52
	.cfi_def_cfa_offset 64
	.loc 1 14 0
	strb	r4, [sp, #6]
	.loc 1 15 0
	strb	r4, [sp, #7]
	.loc 1 18 0
	bl	sim800_init
.LVL1:
	.loc 1 19 0
	mov	r0, #312
	bl	usart2_init
.LVL2:
	.loc 1 20 0
	bl	usart2_irq_enable
.LVL3:
	.loc 1 21 0
	ldr	r0, .L22
	bl	print_init
.LVL4:
	.loc 1 22 0
	bl	help
.LVL5:
	.loc 1 24 0
	ldr	r1, .L22+4
	.loc 1 25 0
	ldr	r3, .L22+8
	.loc 1 24 0
	ldr	r2, [r1, #24]
	ldr	r5, .L22+12
	orr	r2, r2, #16
	str	r2, [r1, #24]
	.loc 1 25 0
	ldr	r2, [r3, #4]
	bic	r2, r2, #15728640
	str	r2, [r3, #4]
	.loc 1 26 0
	ldr	r2, [r3, #4]
	orr	r2, r2, #3145728
	str	r2, [r3, #4]
	.loc 1 27 0
	str	r4, [r3, #12]
	.loc 1 30 0
	ldr	r2, [r3, #12]
	bic	r2, r2, #8192
	str	r2, [r3, #12]
.LVL6:
.L2:
.LBB2:
	.loc 1 34 0
	bl	usart2_read_rx_buffer
.LVL7:
	.loc 1 35 0
	cmp	r0, #0
	beq	.L2
	.loc 1 37 0
	add	r2, sp, #7
	add	r1, sp, #6
	add	r3, sp, #8
	bl	find_command
.LVL8:
	.loc 1 38 0
	ldrsb	r2, [sp, #6]
	cmp	r2, #1
	beq	.L4
	cmp	r2, #2
	beq	.L5
	cbz	r2, .L20
	.loc 1 50 0
	ldr	r0, .L22+16
	bl	print
.LVL9:
.L9:
	.loc 1 61 0
	ldr	r0, .L22+20
	bl	print
.LVL10:
	b	.L2
.LVL11:
.L4:
	.loc 1 44 0
	ldr	r3, [r5, #20]
.L18:
	.loc 1 47 0
	ldrb	r0, [sp, #7]	@ zero_extendqisi2
	add	r1, sp, #8
	movs	r2, #0
	blx	r3
.LVL12:
	mov	r4, r0
.LVL13:
.L7:
	.loc 1 50 0
	ldr	r0, .L22+16
	bl	print
.LVL14:
	.loc 1 51 0
	lsls	r2, r4, #30
	bmi	.L21
	.loc 1 56 0
	lsls	r3, r4, #31
	bpl	.L9
	.loc 1 58 0
	ldr	r0, .L22+24
	bl	print
.LVL15:
	b	.L9
.L21:
	.loc 1 53 0
	ldrsb	r3, [sp, #6]
	ldr	r0, .L22+28
	add	r3, r3, r3, lsl #1
	ldr	r1, [r5, r3, lsl #2]
	bl	print
.LVL16:
	b	.L9
.LVL17:
.L20:
	.loc 1 41 0
	ldr	r3, [r5, #8]
	ldrb	r0, [sp, #7]	@ zero_extendqisi2
	add	r1, sp, #8
	blx	r3
.LVL18:
	mov	r4, r0
.LVL19:
	.loc 1 42 0
	b	.L7
.LVL20:
.L5:
	.loc 1 47 0
	ldr	r3, [r5, #32]
	b	.L18
.L23:
	.align	2
.L22:
	.word	usart2_tx_byte
	.word	1073876992
	.word	1073811456
	.word	commands
	.word	.LC0
	.word	.LC3
	.word	.LC2
	.word	.LC1
.LBE2:
	.cfi_endproc
.LFE63:
	.size	main, .-main
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"\033[1m\000"
	.space	3
.LC1:
	.ascii	"\033[31m  %s:\033[34msome of arguments do not have "
	.ascii	"correct type!\012\000"
.LC2:
	.ascii	"\033[31m  ERROR:\033[34m unknown command\012\000"
.LC3:
	.ascii	"\033[0m\000"
	.text
.Letext0:
	.file 2 "/home/semir/.stm/gcc-arm-none-eabi/arm-none-eabi/include/machine/_default_types.h"
	.file 3 "/home/semir/.stm/gcc-arm-none-eabi/arm-none-eabi/include/stdint.h"
	.file 4 "/home/semir/.stm/Libraries/STM32F1/CMSIS/Device/ST/STM32F1xx/Include/stm32f103xb.h"
	.file 5 "cli.h"
	.file 6 "/home/semir/.stm/Libraries/STM32F1/CMSIS/Include/core_cm3.h"
	.file 7 "../../lib/print.h"
	.file 8 "usart.h"
	.file 9 "sim800.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x492
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF49
	.byte	0x1
	.4byte	.LASF50
	.4byte	.LASF51
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.4byte	.LASF0
	.byte	0x2
	.byte	0x1b
	.4byte	0x30
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.4byte	.LASF2
	.uleb128 0x2
	.4byte	.LASF1
	.byte	0x2
	.byte	0x1d
	.4byte	0x42
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.4byte	.LASF3
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.4byte	.LASF4
	.uleb128 0x2
	.4byte	.LASF5
	.byte	0x2
	.byte	0x2b
	.4byte	0x5b
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.4byte	.LASF6
	.uleb128 0x2
	.4byte	.LASF7
	.byte	0x2
	.byte	0x3f
	.4byte	0x6d
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.4byte	.LASF8
	.uleb128 0x2
	.4byte	.LASF9
	.byte	0x2
	.byte	0x41
	.4byte	0x7f
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF10
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.4byte	.LASF11
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.4byte	.LASF12
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF13
	.uleb128 0x2
	.4byte	.LASF14
	.byte	0x3
	.byte	0x14
	.4byte	0x25
	.uleb128 0x2
	.4byte	.LASF15
	.byte	0x3
	.byte	0x15
	.4byte	0x37
	.uleb128 0x2
	.4byte	.LASF16
	.byte	0x3
	.byte	0x21
	.4byte	0x50
	.uleb128 0x2
	.4byte	.LASF17
	.byte	0x3
	.byte	0x2c
	.4byte	0x62
	.uleb128 0x2
	.4byte	.LASF18
	.byte	0x3
	.byte	0x2d
	.4byte	0x74
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF19
	.uleb128 0x5
	.4byte	0xce
	.uleb128 0x6
	.byte	0x1c
	.byte	0x4
	.2byte	0x178
	.4byte	0x14a
	.uleb128 0x7
	.ascii	"CRL\000"
	.byte	0x4
	.2byte	0x17a
	.4byte	0xe0
	.byte	0
	.uleb128 0x7
	.ascii	"CRH\000"
	.byte	0x4
	.2byte	0x17b
	.4byte	0xe0
	.byte	0x4
	.uleb128 0x7
	.ascii	"IDR\000"
	.byte	0x4
	.2byte	0x17c
	.4byte	0xe0
	.byte	0x8
	.uleb128 0x7
	.ascii	"ODR\000"
	.byte	0x4
	.2byte	0x17d
	.4byte	0xe0
	.byte	0xc
	.uleb128 0x8
	.4byte	.LASF20
	.byte	0x4
	.2byte	0x17e
	.4byte	0xe0
	.byte	0x10
	.uleb128 0x7
	.ascii	"BRR\000"
	.byte	0x4
	.2byte	0x17f
	.4byte	0xe0
	.byte	0x14
	.uleb128 0x8
	.4byte	.LASF21
	.byte	0x4
	.2byte	0x180
	.4byte	0xe0
	.byte	0x18
	.byte	0
	.uleb128 0x9
	.4byte	.LASF22
	.byte	0x4
	.2byte	0x181
	.4byte	0xe5
	.uleb128 0x6
	.byte	0x28
	.byte	0x4
	.2byte	0x1ba
	.4byte	0x1e1
	.uleb128 0x7
	.ascii	"CR\000"
	.byte	0x4
	.2byte	0x1bc
	.4byte	0xe0
	.byte	0
	.uleb128 0x8
	.4byte	.LASF23
	.byte	0x4
	.2byte	0x1bd
	.4byte	0xe0
	.byte	0x4
	.uleb128 0x7
	.ascii	"CIR\000"
	.byte	0x4
	.2byte	0x1be
	.4byte	0xe0
	.byte	0x8
	.uleb128 0x8
	.4byte	.LASF24
	.byte	0x4
	.2byte	0x1bf
	.4byte	0xe0
	.byte	0xc
	.uleb128 0x8
	.4byte	.LASF25
	.byte	0x4
	.2byte	0x1c0
	.4byte	0xe0
	.byte	0x10
	.uleb128 0x8
	.4byte	.LASF26
	.byte	0x4
	.2byte	0x1c1
	.4byte	0xe0
	.byte	0x14
	.uleb128 0x8
	.4byte	.LASF27
	.byte	0x4
	.2byte	0x1c2
	.4byte	0xe0
	.byte	0x18
	.uleb128 0x8
	.4byte	.LASF28
	.byte	0x4
	.2byte	0x1c3
	.4byte	0xe0
	.byte	0x1c
	.uleb128 0x8
	.4byte	.LASF29
	.byte	0x4
	.2byte	0x1c4
	.4byte	0xe0
	.byte	0x20
	.uleb128 0x7
	.ascii	"CSR\000"
	.byte	0x4
	.2byte	0x1c5
	.4byte	0xe0
	.byte	0x24
	.byte	0
	.uleb128 0x9
	.4byte	.LASF30
	.byte	0x4
	.2byte	0x1c8
	.4byte	0x156
	.uleb128 0xa
	.byte	0x4
	.uleb128 0xb
	.byte	0xc
	.byte	0x5
	.byte	0x23
	.4byte	0x21c
	.uleb128 0xc
	.4byte	.LASF31
	.byte	0x5
	.byte	0x25
	.4byte	0x21c
	.byte	0
	.uleb128 0xc
	.4byte	.LASF32
	.byte	0x5
	.byte	0x26
	.4byte	0x22a
	.byte	0x4
	.uleb128 0xc
	.4byte	.LASF33
	.byte	0x5
	.byte	0x27
	.4byte	0x24f
	.byte	0x8
	.byte	0
	.uleb128 0xd
	.byte	0x4
	.4byte	0x222
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.4byte	.LASF34
	.uleb128 0xe
	.uleb128 0xd
	.byte	0x4
	.4byte	0x229
	.uleb128 0xf
	.4byte	0xad
	.4byte	0x249
	.uleb128 0x10
	.4byte	0xad
	.uleb128 0x10
	.4byte	0x249
	.uleb128 0x10
	.4byte	0x1ed
	.byte	0
	.uleb128 0xd
	.byte	0x4
	.4byte	0x21c
	.uleb128 0xd
	.byte	0x4
	.4byte	0x230
	.uleb128 0x2
	.4byte	.LASF35
	.byte	0x5
	.byte	0x28
	.4byte	0x1ef
	.uleb128 0x11
	.4byte	.LASF52
	.byte	0x1
	.byte	0xb
	.4byte	0x94
	.4byte	.LFB63
	.4byte	.LFE63-.LFB63
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3c6
	.uleb128 0x12
	.4byte	.LASF36
	.byte	0x1
	.byte	0xd
	.4byte	0x21c
	.4byte	.LLST0
	.uleb128 0x13
	.4byte	.LASF37
	.byte	0x1
	.byte	0xe
	.4byte	0xa2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -58
	.uleb128 0x13
	.4byte	.LASF38
	.byte	0x1
	.byte	0xf
	.4byte	0xad
	.uleb128 0x2
	.byte	0x91
	.sleb128 -57
	.uleb128 0x13
	.4byte	.LASF39
	.byte	0x1
	.byte	0x10
	.4byte	0x3c6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x14
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.4byte	0x38c
	.uleb128 0x12
	.4byte	.LASF40
	.byte	0x1
	.byte	0x21
	.4byte	0xad
	.4byte	.LLST1
	.uleb128 0x15
	.4byte	.LVL7
	.4byte	0x402
	.uleb128 0x16
	.4byte	.LVL8
	.4byte	0x40d
	.4byte	0x2f7
	.uleb128 0x17
	.uleb128 0x1
	.byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x17
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x91
	.sleb128 -57
	.uleb128 0x17
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -58
	.byte	0
	.uleb128 0x16
	.4byte	.LVL9
	.4byte	0x439
	.4byte	0x30e
	.uleb128 0x17
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC0
	.byte	0
	.uleb128 0x16
	.4byte	.LVL10
	.4byte	0x439
	.4byte	0x325
	.uleb128 0x17
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC3
	.byte	0
	.uleb128 0x18
	.4byte	.LVL12
	.4byte	0x33a
	.uleb128 0x17
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x17
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.byte	0
	.uleb128 0x16
	.4byte	.LVL14
	.4byte	0x439
	.4byte	0x351
	.uleb128 0x17
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC0
	.byte	0
	.uleb128 0x16
	.4byte	.LVL15
	.4byte	0x439
	.4byte	0x368
	.uleb128 0x17
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC2
	.byte	0
	.uleb128 0x16
	.4byte	.LVL16
	.4byte	0x439
	.4byte	0x37f
	.uleb128 0x17
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC1
	.byte	0
	.uleb128 0x19
	.4byte	.LVL18
	.uleb128 0x17
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.byte	0
	.byte	0
	.uleb128 0x15
	.4byte	.LVL1
	.4byte	0x44b
	.uleb128 0x16
	.4byte	.LVL2
	.4byte	0x452
	.4byte	0x3aa
	.uleb128 0x17
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x3
	.byte	0xa
	.2byte	0x138
	.byte	0
	.uleb128 0x15
	.4byte	.LVL3
	.4byte	0x463
	.uleb128 0x15
	.4byte	.LVL4
	.4byte	0x46a
	.uleb128 0x15
	.4byte	.LVL5
	.4byte	0x48c
	.byte	0
	.uleb128 0x1a
	.4byte	0x21c
	.4byte	0x3d6
	.uleb128 0x1b
	.4byte	0xd9
	.byte	0x9
	.byte	0
	.uleb128 0x1c
	.4byte	.LASF41
	.byte	0x6
	.2byte	0x696
	.4byte	0x3e2
	.uleb128 0x5
	.4byte	0xc3
	.uleb128 0x1a
	.4byte	0x255
	.4byte	0x3f7
	.uleb128 0x1b
	.4byte	0xd9
	.byte	0x2
	.byte	0
	.uleb128 0x1d
	.4byte	.LASF42
	.byte	0x1
	.byte	0x9
	.4byte	0x3e7
	.uleb128 0x1e
	.4byte	.LASF53
	.byte	0x8
	.byte	0x4c
	.4byte	0x21c
	.uleb128 0x1f
	.4byte	.LASF43
	.byte	0x5
	.byte	0x2b
	.4byte	0x42d
	.uleb128 0x10
	.4byte	0x21c
	.uleb128 0x10
	.4byte	0x42d
	.uleb128 0x10
	.4byte	0x433
	.uleb128 0x10
	.4byte	0x249
	.byte	0
	.uleb128 0xd
	.byte	0x4
	.4byte	0xa2
	.uleb128 0xd
	.byte	0x4
	.4byte	0xad
	.uleb128 0x1f
	.4byte	.LASF44
	.byte	0x7
	.byte	0x32
	.4byte	0x44b
	.uleb128 0x10
	.4byte	0x21c
	.uleb128 0x20
	.byte	0
	.uleb128 0x21
	.4byte	.LASF46
	.byte	0x9
	.byte	0x15
	.uleb128 0x1f
	.4byte	.LASF45
	.byte	0x8
	.byte	0x2c
	.4byte	0x463
	.uleb128 0x10
	.4byte	0xb8
	.byte	0
	.uleb128 0x21
	.4byte	.LASF47
	.byte	0x8
	.byte	0x33
	.uleb128 0x1f
	.4byte	.LASF48
	.byte	0x7
	.byte	0x1a
	.4byte	0x47b
	.uleb128 0x10
	.4byte	0x47b
	.byte	0
	.uleb128 0xd
	.byte	0x4
	.4byte	0x481
	.uleb128 0x22
	.4byte	0x48c
	.uleb128 0x10
	.4byte	0xad
	.byte	0
	.uleb128 0x23
	.4byte	.LASF32
	.byte	0x5
	.byte	0x32
	.uleb128 0x20
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x15
	.byte	0
	.uleb128 0x27
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",%progbits
.Ldebug_loc0:
.LLST0:
	.4byte	.LVL0
	.4byte	.LVL6
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL7
	.4byte	.LVL8-1
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL6
	.4byte	.LVL9
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL11
	.4byte	.LVL13
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL13
	.4byte	.LVL17
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL17
	.4byte	.LVL19
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL19
	.4byte	.LVL20
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL20
	.4byte	.LFE63
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	0
	.4byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB63
	.4byte	.LFE63-.LFB63
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.4byte	.LFB63
	.4byte	.LFE63
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF37:
	.ascii	"cmd_number\000"
.LASF29:
	.ascii	"BDCR\000"
.LASF23:
	.ascii	"CFGR\000"
.LASF26:
	.ascii	"AHBENR\000"
.LASF42:
	.ascii	"commands\000"
.LASF1:
	.ascii	"__uint8_t\000"
.LASF7:
	.ascii	"__int32_t\000"
.LASF20:
	.ascii	"BSRR\000"
.LASF36:
	.ascii	"command\000"
.LASF32:
	.ascii	"help\000"
.LASF14:
	.ascii	"int8_t\000"
.LASF17:
	.ascii	"int32_t\000"
.LASF53:
	.ascii	"usart2_read_rx_buffer\000"
.LASF25:
	.ascii	"APB1RSTR\000"
.LASF45:
	.ascii	"usart2_init\000"
.LASF9:
	.ascii	"__uint32_t\000"
.LASF31:
	.ascii	"_name\000"
.LASF10:
	.ascii	"long unsigned int\000"
.LASF6:
	.ascii	"short unsigned int\000"
.LASF46:
	.ascii	"sim800_init\000"
.LASF41:
	.ascii	"ITM_RxBuffer\000"
.LASF33:
	.ascii	"_execute_command\000"
.LASF3:
	.ascii	"unsigned char\000"
.LASF47:
	.ascii	"usart2_irq_enable\000"
.LASF5:
	.ascii	"__uint16_t\000"
.LASF27:
	.ascii	"APB2ENR\000"
.LASF4:
	.ascii	"short int\000"
.LASF48:
	.ascii	"print_init\000"
.LASF28:
	.ascii	"APB1ENR\000"
.LASF43:
	.ascii	"find_command\000"
.LASF24:
	.ascii	"APB2RSTR\000"
.LASF13:
	.ascii	"unsigned int\000"
.LASF22:
	.ascii	"GPIO_TypeDef\000"
.LASF12:
	.ascii	"long long unsigned int\000"
.LASF15:
	.ascii	"uint8_t\000"
.LASF52:
	.ascii	"main\000"
.LASF38:
	.ascii	"argc\000"
.LASF19:
	.ascii	"sizetype\000"
.LASF40:
	.ascii	"error\000"
.LASF11:
	.ascii	"long long int\000"
.LASF50:
	.ascii	"main.c\000"
.LASF34:
	.ascii	"char\000"
.LASF44:
	.ascii	"print\000"
.LASF16:
	.ascii	"uint16_t\000"
.LASF39:
	.ascii	"argv\000"
.LASF30:
	.ascii	"RCC_TypeDef\000"
.LASF35:
	.ascii	"Command\000"
.LASF18:
	.ascii	"uint32_t\000"
.LASF8:
	.ascii	"long int\000"
.LASF0:
	.ascii	"__int8_t\000"
.LASF2:
	.ascii	"signed char\000"
.LASF51:
	.ascii	"/home/semir/Documents/embedded_system/stm/stm32f103"
	.ascii	"/examples/sim800\000"
.LASF21:
	.ascii	"LCKR\000"
.LASF49:
	.ascii	"GNU C 4.9.3 20141119 (release) [ARM/embedded-4_9-br"
	.ascii	"anch revision 218278] -mlittle-endian -mthumb -mcpu"
	.ascii	"=cortex-m3 -mthumb-interwork -g -O2\000"
	.ident	"GCC: (GNU Tools for ARM Embedded Processors) 4.9.3 20141119 (release) [ARM/embedded-4_9-branch revision 218278]"
