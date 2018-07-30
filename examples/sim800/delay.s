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
	.file	"delay.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.global	delay_ms
	.thumb
	.thumb_func
	.type	delay_ms, %function
delay_ms:
.LFB63:
	.file 1 "../../lib/delay.c"
	.loc 1 6 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL0:
	.loc 1 7 0
	ldr	r1, .L12
	.loc 1 8 0
	ldr	r2, .L12+4
	.loc 1 7 0
	ldr	r3, [r1, #28]
	.loc 1 6 0
	push	{r4}
	.cfi_def_cfa_offset 4
	.cfi_offset 4, -4
	.loc 1 7 0
	orr	r3, r3, #4
	str	r3, [r1, #28]
	.loc 1 8 0
	ldr	r3, [r2]
	.loc 1 10 0
	mov	r1, #1000
	.loc 1 8 0
	orr	r3, r3, #128
	.loc 1 9 0
	movs	r4, #71
	.loc 1 8 0
	str	r3, [r2]
	.loc 1 9 0
	str	r4, [r2, #40]
	.loc 1 10 0
	str	r1, [r2, #44]
	.loc 1 11 0
	ldr	r3, [r2, #20]
	.loc 1 15 0
	mov	r1, r2
	.loc 1 11 0
	orr	r3, r3, #1
	str	r3, [r2, #20]
	.loc 1 12 0
	ldr	r3, [r2]
	orr	r3, r3, #1
	str	r3, [r2]
	.loc 1 13 0
	cbz	r0, .L5
.L3:
	.loc 1 15 0 discriminator 1
	ldr	r3, [r2, #16]
	lsls	r3, r3, #31
	bpl	.L3
.LVL1:
	.loc 1 18 0
	ldr	r3, [r1, #16]
	.loc 1 13 0
	subs	r0, r0, #1
.LVL2:
	.loc 1 18 0
	bic	r3, r3, #1
	str	r3, [r1, #16]
	.loc 1 13 0
	bne	.L3
.L5:
	.loc 1 21 0
	ldr	r2, .L12+4
	.loc 1 23 0
	ldr	r4, [sp], #4
	.cfi_restore 4
	.cfi_def_cfa_offset 0
	.loc 1 21 0
	ldr	r3, [r2]
	bic	r3, r3, #1
	str	r3, [r2]
	.loc 1 23 0
	bx	lr
.L13:
	.align	2
.L12:
	.word	1073876992
	.word	1073743872
	.cfi_endproc
.LFE63:
	.size	delay_ms, .-delay_ms
	.align	2
	.global	delay_us
	.thumb
	.thumb_func
	.type	delay_us, %function
delay_us:
.LFB64:
	.loc 1 25 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL3:
	.loc 1 26 0
	ldr	r1, .L24
	.loc 1 27 0
	ldr	r2, .L24+4
	.loc 1 26 0
	ldr	r3, [r1, #28]
	.loc 1 25 0
	push	{r4}
	.cfi_def_cfa_offset 4
	.cfi_offset 4, -4
	.loc 1 26 0
	orr	r3, r3, #4
	str	r3, [r1, #28]
	.loc 1 27 0
	ldr	r3, [r2]
	.loc 1 29 0
	movs	r1, #72
	.loc 1 27 0
	orr	r3, r3, #128
	.loc 1 28 0
	movs	r4, #0
	.loc 1 27 0
	str	r3, [r2]
	.loc 1 28 0
	str	r4, [r2, #40]
	.loc 1 29 0
	str	r1, [r2, #44]
	.loc 1 30 0
	ldr	r3, [r2, #20]
	.loc 1 34 0
	mov	r1, r2
	.loc 1 30 0
	orr	r3, r3, #1
	str	r3, [r2, #20]
	.loc 1 31 0
	ldr	r3, [r2]
	orr	r3, r3, #1
	str	r3, [r2]
	.loc 1 32 0
	cbz	r0, .L18
.L16:
	.loc 1 34 0 discriminator 1
	ldr	r3, [r2, #16]
	lsls	r3, r3, #31
	bpl	.L16
.LVL4:
	.loc 1 37 0
	ldr	r3, [r1, #16]
	.loc 1 32 0
	subs	r0, r0, #1
.LVL5:
	.loc 1 37 0
	bic	r3, r3, #1
	str	r3, [r1, #16]
	.loc 1 32 0
	bne	.L16
.L18:
	.loc 1 40 0
	ldr	r2, .L24+4
	.loc 1 42 0
	ldr	r4, [sp], #4
	.cfi_restore 4
	.cfi_def_cfa_offset 0
	.loc 1 40 0
	ldr	r3, [r2]
	bic	r3, r3, #1
	str	r3, [r2]
	.loc 1 42 0
	bx	lr
.L25:
	.align	2
.L24:
	.word	1073876992
	.word	1073743872
	.cfi_endproc
.LFE64:
	.size	delay_us, .-delay_us
	.align	2
	.global	systimer_init
	.thumb
	.thumb_func
	.type	systimer_init, %function
systimer_init:
.LFB65:
	.loc 1 46 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 47 0
	ldr	r0, .L28
	.loc 1 46 0
	push	{r4, r5, r6, r7}
	.cfi_def_cfa_offset 16
	.cfi_offset 4, -16
	.cfi_offset 5, -12
	.cfi_offset 6, -8
	.cfi_offset 7, -4
	.loc 1 47 0
	ldr	r1, [r0, #28]
	.loc 1 48 0
	mov	r3, #1073741824
	.loc 1 51 0
	movs	r2, #0
	.loc 1 53 0
	movs	r4, #1
	.loc 1 48 0
	movs	r7, #71
	.loc 1 47 0
	orr	r1, r1, #1
	.loc 1 49 0
	mov	r6, #1000
	.loc 1 50 0
	movs	r5, #132
	.loc 1 47 0
	str	r1, [r0, #28]
	.loc 1 48 0
	str	r7, [r3, #40]
	.loc 1 49 0
	str	r6, [r3, #44]
	.loc 1 50 0
	str	r5, [r3]
	.loc 1 51 0
	str	r2, [r3, #4]
	.loc 1 52 0
	str	r2, [r3, #36]
	.loc 1 53 0
	str	r4, [r3, #12]
	.loc 1 54 0
	ldr	r1, [r3, #20]
.LBB6:
.LBB7:
	.file 2 "/home/semir/.stm/Libraries/STM32F1/CMSIS/Include/core_cm3.h"
	.loc 2 1532 0
	ldr	r0, .L28+4
.LBE7:
.LBE6:
	.loc 1 54 0
	orrs	r1, r1, r4
	str	r1, [r3, #20]
	.loc 1 55 0
	ldr	r1, [r3]
.LBB9:
.LBB10:
	.loc 2 1454 0
	mov	r4, #268435456
.LBE10:
.LBE9:
	.loc 1 55 0
	orr	r1, r1, #1
	str	r1, [r3]
.LVL6:
.LBB12:
.LBB8:
	.loc 2 1532 0
	strb	r2, [r0, #796]
.LVL7:
.LBE8:
.LBE12:
.LBB13:
.LBB11:
	.loc 2 1454 0
	str	r4, [r0]
.LBE11:
.LBE13:
	.loc 1 58 0
	pop	{r4, r5, r6, r7}
	.cfi_restore 7
	.cfi_restore 6
	.cfi_restore 5
	.cfi_restore 4
	.cfi_def_cfa_offset 0
	bx	lr
.L29:
	.align	2
.L28:
	.word	1073876992
	.word	-536813312
	.cfi_endproc
.LFE65:
	.size	systimer_init, .-systimer_init
	.align	2
	.global	TIM2_IRQHandler
	.thumb
	.thumb_func
	.type	TIM2_IRQHandler, %function
TIM2_IRQHandler:
.LFB66:
	.loc 1 60 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 61 0
	mov	r3, #1073741824
	ldr	r2, [r3, #16]
	lsls	r2, r2, #31
	bpl	.L30
	.loc 1 63 0
	ldr	r1, .L35
	.loc 1 64 0
	movs	r0, #0
	.loc 1 63 0
	ldr	r2, [r1]
	adds	r2, r2, #1
	str	r2, [r1]
	.loc 1 64 0
	str	r0, [r3, #16]
.L30:
	bx	lr
.L36:
	.align	2
.L35:
	.word	.LANCHOR0
	.cfi_endproc
.LFE66:
	.size	TIM2_IRQHandler, .-TIM2_IRQHandler
	.align	2
	.global	systimer_get
	.thumb
	.thumb_func
	.type	systimer_get, %function
systimer_get:
.LFB67:
	.loc 1 69 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 70 0
	ldr	r3, .L38
	ldr	r0, [r3]
	.loc 1 71 0
	bx	lr
.L39:
	.align	2
.L38:
	.word	.LANCHOR0
	.cfi_endproc
.LFE67:
	.size	systimer_get, .-systimer_get
	.align	2
	.global	systimer_timeout_flag
	.thumb
	.thumb_func
	.type	systimer_timeout_flag, %function
systimer_timeout_flag:
.LFB68:
	.loc 1 73 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL8:
	.loc 1 74 0
	ldr	r3, .L43
	ldr	r3, [r3]
.LVL9:
	.loc 1 76 0
	cmp	r3, r0
	bcc	.L41
	.loc 1 78 0
	add	r0, r0, r1
.LVL10:
	.loc 1 84 0
	cmp	r3, r0
	ite	cs
	movcs	r0, #0
	movcc	r0, #1
	bx	lr
.LVL11:
.L41:
.LBB14:
	.loc 1 89 0
	mvns	r0, r0
.LVL12:
	.loc 1 90 0
	add	r0, r0, r3
.LVL13:
.LBE14:
	.loc 1 84 0
	cmp	r1, r0
	ite	ls
	movls	r0, #0
	movhi	r0, #1
.LVL14:
	.loc 1 100 0
	bx	lr
.L44:
	.align	2
.L43:
	.word	.LANCHOR0
	.cfi_endproc
.LFE68:
	.size	systimer_timeout_flag, .-systimer_timeout_flag
	.global	g_systimer
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	g_systimer, %object
	.size	g_systimer, 4
g_systimer:
	.space	4
	.text
.Letext0:
	.file 3 "/home/semir/.stm/Libraries/STM32F1/CMSIS/Device/ST/STM32F1xx/Include/stm32f103xb.h"
	.file 4 "/home/semir/.stm/gcc-arm-none-eabi/arm-none-eabi/include/machine/_default_types.h"
	.file 5 "/home/semir/.stm/gcc-arm-none-eabi/arm-none-eabi/include/stdint.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x80d
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF132
	.byte	0x1
	.4byte	.LASF133
	.4byte	.LASF134
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x3
	.byte	0x58
	.4byte	0x166
	.uleb128 0x3
	.4byte	.LASF0
	.sleb128 -14
	.uleb128 0x3
	.4byte	.LASF1
	.sleb128 -13
	.uleb128 0x3
	.4byte	.LASF2
	.sleb128 -12
	.uleb128 0x3
	.4byte	.LASF3
	.sleb128 -11
	.uleb128 0x3
	.4byte	.LASF4
	.sleb128 -10
	.uleb128 0x3
	.4byte	.LASF5
	.sleb128 -5
	.uleb128 0x3
	.4byte	.LASF6
	.sleb128 -4
	.uleb128 0x3
	.4byte	.LASF7
	.sleb128 -2
	.uleb128 0x3
	.4byte	.LASF8
	.sleb128 -1
	.uleb128 0x3
	.4byte	.LASF9
	.sleb128 0
	.uleb128 0x3
	.4byte	.LASF10
	.sleb128 1
	.uleb128 0x3
	.4byte	.LASF11
	.sleb128 2
	.uleb128 0x3
	.4byte	.LASF12
	.sleb128 3
	.uleb128 0x3
	.4byte	.LASF13
	.sleb128 4
	.uleb128 0x3
	.4byte	.LASF14
	.sleb128 5
	.uleb128 0x3
	.4byte	.LASF15
	.sleb128 6
	.uleb128 0x3
	.4byte	.LASF16
	.sleb128 7
	.uleb128 0x3
	.4byte	.LASF17
	.sleb128 8
	.uleb128 0x3
	.4byte	.LASF18
	.sleb128 9
	.uleb128 0x3
	.4byte	.LASF19
	.sleb128 10
	.uleb128 0x3
	.4byte	.LASF20
	.sleb128 11
	.uleb128 0x3
	.4byte	.LASF21
	.sleb128 12
	.uleb128 0x3
	.4byte	.LASF22
	.sleb128 13
	.uleb128 0x3
	.4byte	.LASF23
	.sleb128 14
	.uleb128 0x3
	.4byte	.LASF24
	.sleb128 15
	.uleb128 0x3
	.4byte	.LASF25
	.sleb128 16
	.uleb128 0x3
	.4byte	.LASF26
	.sleb128 17
	.uleb128 0x3
	.4byte	.LASF27
	.sleb128 18
	.uleb128 0x3
	.4byte	.LASF28
	.sleb128 19
	.uleb128 0x3
	.4byte	.LASF29
	.sleb128 20
	.uleb128 0x3
	.4byte	.LASF30
	.sleb128 21
	.uleb128 0x3
	.4byte	.LASF31
	.sleb128 22
	.uleb128 0x3
	.4byte	.LASF32
	.sleb128 23
	.uleb128 0x3
	.4byte	.LASF33
	.sleb128 24
	.uleb128 0x3
	.4byte	.LASF34
	.sleb128 25
	.uleb128 0x3
	.4byte	.LASF35
	.sleb128 26
	.uleb128 0x3
	.4byte	.LASF36
	.sleb128 27
	.uleb128 0x3
	.4byte	.LASF37
	.sleb128 28
	.uleb128 0x3
	.4byte	.LASF38
	.sleb128 29
	.uleb128 0x3
	.4byte	.LASF39
	.sleb128 30
	.uleb128 0x3
	.4byte	.LASF40
	.sleb128 31
	.uleb128 0x3
	.4byte	.LASF41
	.sleb128 32
	.uleb128 0x3
	.4byte	.LASF42
	.sleb128 33
	.uleb128 0x3
	.4byte	.LASF43
	.sleb128 34
	.uleb128 0x3
	.4byte	.LASF44
	.sleb128 35
	.uleb128 0x3
	.4byte	.LASF45
	.sleb128 36
	.uleb128 0x3
	.4byte	.LASF46
	.sleb128 37
	.uleb128 0x3
	.4byte	.LASF47
	.sleb128 38
	.uleb128 0x3
	.4byte	.LASF48
	.sleb128 39
	.uleb128 0x3
	.4byte	.LASF49
	.sleb128 40
	.uleb128 0x3
	.4byte	.LASF50
	.sleb128 41
	.uleb128 0x3
	.4byte	.LASF51
	.sleb128 42
	.byte	0
	.uleb128 0x4
	.4byte	.LASF52
	.byte	0x3
	.byte	0x90
	.4byte	0x25
	.uleb128 0x5
	.byte	0x1
	.byte	0x6
	.4byte	.LASF54
	.uleb128 0x4
	.4byte	.LASF53
	.byte	0x4
	.byte	0x1d
	.4byte	0x183
	.uleb128 0x5
	.byte	0x1
	.byte	0x8
	.4byte	.LASF55
	.uleb128 0x5
	.byte	0x2
	.byte	0x5
	.4byte	.LASF56
	.uleb128 0x5
	.byte	0x2
	.byte	0x7
	.4byte	.LASF57
	.uleb128 0x4
	.4byte	.LASF58
	.byte	0x4
	.byte	0x3f
	.4byte	0x1a3
	.uleb128 0x5
	.byte	0x4
	.byte	0x5
	.4byte	.LASF59
	.uleb128 0x4
	.4byte	.LASF60
	.byte	0x4
	.byte	0x41
	.4byte	0x1b5
	.uleb128 0x5
	.byte	0x4
	.byte	0x7
	.4byte	.LASF61
	.uleb128 0x5
	.byte	0x8
	.byte	0x5
	.4byte	.LASF62
	.uleb128 0x5
	.byte	0x8
	.byte	0x7
	.4byte	.LASF63
	.uleb128 0x6
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x5
	.byte	0x4
	.byte	0x7
	.4byte	.LASF64
	.uleb128 0x4
	.4byte	.LASF65
	.byte	0x5
	.byte	0x15
	.4byte	0x178
	.uleb128 0x4
	.4byte	.LASF66
	.byte	0x5
	.byte	0x2c
	.4byte	0x198
	.uleb128 0x4
	.4byte	.LASF67
	.byte	0x5
	.byte	0x2d
	.4byte	0x1aa
	.uleb128 0x7
	.2byte	0xe04
	.byte	0x2
	.2byte	0x17f
	.4byte	0x2b5
	.uleb128 0x8
	.4byte	.LASF68
	.byte	0x2
	.2byte	0x181
	.4byte	0x2cc
	.byte	0
	.uleb128 0x8
	.4byte	.LASF69
	.byte	0x2
	.2byte	0x182
	.4byte	0x2d1
	.byte	0x20
	.uleb128 0x8
	.4byte	.LASF70
	.byte	0x2
	.2byte	0x183
	.4byte	0x2e1
	.byte	0x80
	.uleb128 0x8
	.4byte	.LASF71
	.byte	0x2
	.2byte	0x184
	.4byte	0x2d1
	.byte	0xa0
	.uleb128 0x9
	.4byte	.LASF72
	.byte	0x2
	.2byte	0x185
	.4byte	0x2e6
	.2byte	0x100
	.uleb128 0x9
	.4byte	.LASF73
	.byte	0x2
	.2byte	0x186
	.4byte	0x2d1
	.2byte	0x120
	.uleb128 0x9
	.4byte	.LASF74
	.byte	0x2
	.2byte	0x187
	.4byte	0x2eb
	.2byte	0x180
	.uleb128 0x9
	.4byte	.LASF75
	.byte	0x2
	.2byte	0x188
	.4byte	0x2d1
	.2byte	0x1a0
	.uleb128 0x9
	.4byte	.LASF76
	.byte	0x2
	.2byte	0x189
	.4byte	0x2f0
	.2byte	0x200
	.uleb128 0x9
	.4byte	.LASF77
	.byte	0x2
	.2byte	0x18a
	.4byte	0x2f5
	.2byte	0x220
	.uleb128 0xa
	.ascii	"IP\000"
	.byte	0x2
	.2byte	0x18b
	.4byte	0x315
	.2byte	0x300
	.uleb128 0x9
	.4byte	.LASF78
	.byte	0x2
	.2byte	0x18c
	.4byte	0x31a
	.2byte	0x3f0
	.uleb128 0x9
	.4byte	.LASF79
	.byte	0x2
	.2byte	0x18d
	.4byte	0x32b
	.2byte	0xe00
	.byte	0
	.uleb128 0xb
	.4byte	0x1ee
	.4byte	0x2c5
	.uleb128 0xc
	.4byte	0x2c5
	.byte	0x7
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.byte	0x7
	.4byte	.LASF80
	.uleb128 0xd
	.4byte	0x2b5
	.uleb128 0xb
	.4byte	0x1ee
	.4byte	0x2e1
	.uleb128 0xc
	.4byte	0x2c5
	.byte	0x17
	.byte	0
	.uleb128 0xd
	.4byte	0x2b5
	.uleb128 0xd
	.4byte	0x2b5
	.uleb128 0xd
	.4byte	0x2b5
	.uleb128 0xd
	.4byte	0x2b5
	.uleb128 0xb
	.4byte	0x1ee
	.4byte	0x305
	.uleb128 0xc
	.4byte	0x2c5
	.byte	0x37
	.byte	0
	.uleb128 0xb
	.4byte	0x1d8
	.4byte	0x315
	.uleb128 0xc
	.4byte	0x2c5
	.byte	0xef
	.byte	0
	.uleb128 0xd
	.4byte	0x305
	.uleb128 0xb
	.4byte	0x1ee
	.4byte	0x32b
	.uleb128 0xe
	.4byte	0x2c5
	.2byte	0x283
	.byte	0
	.uleb128 0xd
	.4byte	0x1ee
	.uleb128 0xf
	.4byte	.LASF81
	.byte	0x2
	.2byte	0x18e
	.4byte	0x1f9
	.uleb128 0x10
	.byte	0x8c
	.byte	0x2
	.2byte	0x1a1
	.4byte	0x457
	.uleb128 0x8
	.4byte	.LASF82
	.byte	0x2
	.2byte	0x1a3
	.4byte	0x457
	.byte	0
	.uleb128 0x8
	.4byte	.LASF83
	.byte	0x2
	.2byte	0x1a4
	.4byte	0x32b
	.byte	0x4
	.uleb128 0x8
	.4byte	.LASF84
	.byte	0x2
	.2byte	0x1a5
	.4byte	0x32b
	.byte	0x8
	.uleb128 0x8
	.4byte	.LASF85
	.byte	0x2
	.2byte	0x1a6
	.4byte	0x32b
	.byte	0xc
	.uleb128 0x11
	.ascii	"SCR\000"
	.byte	0x2
	.2byte	0x1a7
	.4byte	0x32b
	.byte	0x10
	.uleb128 0x11
	.ascii	"CCR\000"
	.byte	0x2
	.2byte	0x1a8
	.4byte	0x32b
	.byte	0x14
	.uleb128 0x11
	.ascii	"SHP\000"
	.byte	0x2
	.2byte	0x1a9
	.4byte	0x46c
	.byte	0x18
	.uleb128 0x8
	.4byte	.LASF86
	.byte	0x2
	.2byte	0x1aa
	.4byte	0x32b
	.byte	0x24
	.uleb128 0x8
	.4byte	.LASF87
	.byte	0x2
	.2byte	0x1ab
	.4byte	0x32b
	.byte	0x28
	.uleb128 0x8
	.4byte	.LASF88
	.byte	0x2
	.2byte	0x1ac
	.4byte	0x32b
	.byte	0x2c
	.uleb128 0x8
	.4byte	.LASF89
	.byte	0x2
	.2byte	0x1ad
	.4byte	0x32b
	.byte	0x30
	.uleb128 0x8
	.4byte	.LASF90
	.byte	0x2
	.2byte	0x1ae
	.4byte	0x32b
	.byte	0x34
	.uleb128 0x8
	.4byte	.LASF91
	.byte	0x2
	.2byte	0x1af
	.4byte	0x32b
	.byte	0x38
	.uleb128 0x8
	.4byte	.LASF92
	.byte	0x2
	.2byte	0x1b0
	.4byte	0x32b
	.byte	0x3c
	.uleb128 0x11
	.ascii	"PFR\000"
	.byte	0x2
	.2byte	0x1b1
	.4byte	0x481
	.byte	0x40
	.uleb128 0x11
	.ascii	"DFR\000"
	.byte	0x2
	.2byte	0x1b2
	.4byte	0x457
	.byte	0x48
	.uleb128 0x11
	.ascii	"ADR\000"
	.byte	0x2
	.2byte	0x1b3
	.4byte	0x457
	.byte	0x4c
	.uleb128 0x8
	.4byte	.LASF93
	.byte	0x2
	.2byte	0x1b4
	.4byte	0x49b
	.byte	0x50
	.uleb128 0x8
	.4byte	.LASF94
	.byte	0x2
	.2byte	0x1b5
	.4byte	0x4b5
	.byte	0x60
	.uleb128 0x8
	.4byte	.LASF69
	.byte	0x2
	.2byte	0x1b6
	.4byte	0x4a5
	.byte	0x74
	.uleb128 0x8
	.4byte	.LASF95
	.byte	0x2
	.2byte	0x1b7
	.4byte	0x32b
	.byte	0x88
	.byte	0
	.uleb128 0x12
	.4byte	0x32b
	.uleb128 0xb
	.4byte	0x1d8
	.4byte	0x46c
	.uleb128 0xc
	.4byte	0x2c5
	.byte	0xb
	.byte	0
	.uleb128 0xd
	.4byte	0x45c
	.uleb128 0xb
	.4byte	0x1ee
	.4byte	0x481
	.uleb128 0xc
	.4byte	0x2c5
	.byte	0x1
	.byte	0
	.uleb128 0x12
	.4byte	0x486
	.uleb128 0xd
	.4byte	0x471
	.uleb128 0xb
	.4byte	0x1ee
	.4byte	0x49b
	.uleb128 0xc
	.4byte	0x2c5
	.byte	0x3
	.byte	0
	.uleb128 0x12
	.4byte	0x4a0
	.uleb128 0xd
	.4byte	0x48b
	.uleb128 0xb
	.4byte	0x1ee
	.4byte	0x4b5
	.uleb128 0xc
	.4byte	0x2c5
	.byte	0x4
	.byte	0
	.uleb128 0x12
	.4byte	0x4ba
	.uleb128 0xd
	.4byte	0x4a5
	.uleb128 0xf
	.4byte	.LASF96
	.byte	0x2
	.2byte	0x1b8
	.4byte	0x33c
	.uleb128 0x10
	.byte	0x28
	.byte	0x3
	.2byte	0x1ba
	.4byte	0x556
	.uleb128 0x11
	.ascii	"CR\000"
	.byte	0x3
	.2byte	0x1bc
	.4byte	0x32b
	.byte	0
	.uleb128 0x8
	.4byte	.LASF97
	.byte	0x3
	.2byte	0x1bd
	.4byte	0x32b
	.byte	0x4
	.uleb128 0x11
	.ascii	"CIR\000"
	.byte	0x3
	.2byte	0x1be
	.4byte	0x32b
	.byte	0x8
	.uleb128 0x8
	.4byte	.LASF98
	.byte	0x3
	.2byte	0x1bf
	.4byte	0x32b
	.byte	0xc
	.uleb128 0x8
	.4byte	.LASF99
	.byte	0x3
	.2byte	0x1c0
	.4byte	0x32b
	.byte	0x10
	.uleb128 0x8
	.4byte	.LASF100
	.byte	0x3
	.2byte	0x1c1
	.4byte	0x32b
	.byte	0x14
	.uleb128 0x8
	.4byte	.LASF101
	.byte	0x3
	.2byte	0x1c2
	.4byte	0x32b
	.byte	0x18
	.uleb128 0x8
	.4byte	.LASF102
	.byte	0x3
	.2byte	0x1c3
	.4byte	0x32b
	.byte	0x1c
	.uleb128 0x8
	.4byte	.LASF103
	.byte	0x3
	.2byte	0x1c4
	.4byte	0x32b
	.byte	0x20
	.uleb128 0x11
	.ascii	"CSR\000"
	.byte	0x3
	.2byte	0x1c5
	.4byte	0x32b
	.byte	0x24
	.byte	0
	.uleb128 0xf
	.4byte	.LASF104
	.byte	0x3
	.2byte	0x1c8
	.4byte	0x4cb
	.uleb128 0x10
	.byte	0x54
	.byte	0x3
	.2byte	0x20b
	.4byte	0x67b
	.uleb128 0x11
	.ascii	"CR1\000"
	.byte	0x3
	.2byte	0x20d
	.4byte	0x32b
	.byte	0
	.uleb128 0x11
	.ascii	"CR2\000"
	.byte	0x3
	.2byte	0x20e
	.4byte	0x32b
	.byte	0x4
	.uleb128 0x8
	.4byte	.LASF105
	.byte	0x3
	.2byte	0x20f
	.4byte	0x32b
	.byte	0x8
	.uleb128 0x8
	.4byte	.LASF106
	.byte	0x3
	.2byte	0x210
	.4byte	0x32b
	.byte	0xc
	.uleb128 0x11
	.ascii	"SR\000"
	.byte	0x3
	.2byte	0x211
	.4byte	0x32b
	.byte	0x10
	.uleb128 0x11
	.ascii	"EGR\000"
	.byte	0x3
	.2byte	0x212
	.4byte	0x32b
	.byte	0x14
	.uleb128 0x8
	.4byte	.LASF107
	.byte	0x3
	.2byte	0x213
	.4byte	0x32b
	.byte	0x18
	.uleb128 0x8
	.4byte	.LASF108
	.byte	0x3
	.2byte	0x214
	.4byte	0x32b
	.byte	0x1c
	.uleb128 0x8
	.4byte	.LASF109
	.byte	0x3
	.2byte	0x215
	.4byte	0x32b
	.byte	0x20
	.uleb128 0x11
	.ascii	"CNT\000"
	.byte	0x3
	.2byte	0x216
	.4byte	0x32b
	.byte	0x24
	.uleb128 0x11
	.ascii	"PSC\000"
	.byte	0x3
	.2byte	0x217
	.4byte	0x32b
	.byte	0x28
	.uleb128 0x11
	.ascii	"ARR\000"
	.byte	0x3
	.2byte	0x218
	.4byte	0x32b
	.byte	0x2c
	.uleb128 0x11
	.ascii	"RCR\000"
	.byte	0x3
	.2byte	0x219
	.4byte	0x32b
	.byte	0x30
	.uleb128 0x8
	.4byte	.LASF110
	.byte	0x3
	.2byte	0x21a
	.4byte	0x32b
	.byte	0x34
	.uleb128 0x8
	.4byte	.LASF111
	.byte	0x3
	.2byte	0x21b
	.4byte	0x32b
	.byte	0x38
	.uleb128 0x8
	.4byte	.LASF112
	.byte	0x3
	.2byte	0x21c
	.4byte	0x32b
	.byte	0x3c
	.uleb128 0x8
	.4byte	.LASF113
	.byte	0x3
	.2byte	0x21d
	.4byte	0x32b
	.byte	0x40
	.uleb128 0x8
	.4byte	.LASF114
	.byte	0x3
	.2byte	0x21e
	.4byte	0x32b
	.byte	0x44
	.uleb128 0x11
	.ascii	"DCR\000"
	.byte	0x3
	.2byte	0x21f
	.4byte	0x32b
	.byte	0x48
	.uleb128 0x8
	.4byte	.LASF115
	.byte	0x3
	.2byte	0x220
	.4byte	0x32b
	.byte	0x4c
	.uleb128 0x11
	.ascii	"OR\000"
	.byte	0x3
	.2byte	0x221
	.4byte	0x32b
	.byte	0x50
	.byte	0
	.uleb128 0xf
	.4byte	.LASF116
	.byte	0x3
	.2byte	0x222
	.4byte	0x562
	.uleb128 0x13
	.4byte	.LASF119
	.byte	0x2
	.2byte	0x5f4
	.byte	0x3
	.4byte	0x6ad
	.uleb128 0x14
	.4byte	.LASF117
	.byte	0x2
	.2byte	0x5f4
	.4byte	0x166
	.uleb128 0x14
	.4byte	.LASF118
	.byte	0x2
	.2byte	0x5f4
	.4byte	0x1ee
	.byte	0
	.uleb128 0x13
	.4byte	.LASF120
	.byte	0x2
	.2byte	0x5ac
	.byte	0x3
	.4byte	0x6c7
	.uleb128 0x14
	.4byte	.LASF117
	.byte	0x2
	.2byte	0x5ac
	.4byte	0x166
	.byte	0
	.uleb128 0x15
	.4byte	.LASF121
	.byte	0x1
	.byte	0x5
	.4byte	.LFB63
	.4byte	.LFE63-.LFB63
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x6ec
	.uleb128 0x16
	.4byte	.LASF123
	.byte	0x1
	.byte	0x5
	.4byte	0x1ee
	.4byte	.LLST0
	.byte	0
	.uleb128 0x15
	.4byte	.LASF122
	.byte	0x1
	.byte	0x18
	.4byte	.LFB64
	.4byte	.LFE64-.LFB64
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x711
	.uleb128 0x16
	.4byte	.LASF123
	.byte	0x1
	.byte	0x18
	.4byte	0x1ee
	.4byte	.LLST1
	.byte	0
	.uleb128 0x15
	.4byte	.LASF124
	.byte	0x1
	.byte	0x2d
	.4byte	.LFB65
	.4byte	.LFE65-.LFB65
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x75d
	.uleb128 0x17
	.4byte	0x687
	.4byte	.LBB6
	.4byte	.Ldebug_ranges0+0
	.byte	0x1
	.byte	0x38
	.4byte	0x746
	.uleb128 0x18
	.4byte	0x6a0
	.byte	0
	.uleb128 0x18
	.4byte	0x694
	.byte	0x1c
	.byte	0
	.uleb128 0x19
	.4byte	0x6ad
	.4byte	.LBB9
	.4byte	.Ldebug_ranges0+0x18
	.byte	0x1
	.byte	0x39
	.uleb128 0x18
	.4byte	0x6ba
	.byte	0x1c
	.byte	0
	.byte	0
	.uleb128 0x1a
	.4byte	.LASF135
	.byte	0x1
	.byte	0x3b
	.4byte	.LFB66
	.4byte	.LFE66-.LFB66
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1b
	.4byte	.LASF136
	.byte	0x1
	.byte	0x44
	.4byte	0x1ee
	.4byte	.LFB67
	.4byte	.LFE67-.LFB67
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1c
	.4byte	.LASF137
	.byte	0x1
	.byte	0x48
	.4byte	0x1d8
	.4byte	.LFB68
	.4byte	.LFE68-.LFB68
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x7ee
	.uleb128 0x16
	.4byte	.LASF125
	.byte	0x1
	.byte	0x48
	.4byte	0x1ee
	.4byte	.LLST2
	.uleb128 0x1d
	.4byte	.LASF126
	.byte	0x1
	.byte	0x48
	.4byte	0x1ee
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1e
	.4byte	.LASF127
	.byte	0x1
	.byte	0x4a
	.4byte	0x1ee
	.uleb128 0x1
	.byte	0x53
	.uleb128 0x1f
	.4byte	.LASF128
	.byte	0x1
	.byte	0x4b
	.4byte	0x1d8
	.4byte	.LLST3
	.uleb128 0x20
	.4byte	.LBB14
	.4byte	.LBE14-.LBB14
	.uleb128 0x1f
	.4byte	.LASF129
	.byte	0x1
	.byte	0x59
	.4byte	0x1ee
	.4byte	.LLST4
	.byte	0
	.byte	0
	.uleb128 0x21
	.4byte	.LASF130
	.byte	0x2
	.2byte	0x696
	.4byte	0x7fa
	.uleb128 0xd
	.4byte	0x1e3
	.uleb128 0x22
	.4byte	.LASF131
	.byte	0x1
	.byte	0x3
	.4byte	0x32b
	.uleb128 0x5
	.byte	0x3
	.4byte	g_systimer
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
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x4
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
	.uleb128 0x3
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.byte	0
	.uleb128 0x4
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
	.uleb128 0x5
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
	.uleb128 0x6
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
	.uleb128 0x7
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0x5
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
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
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0xa
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
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0xf
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
	.uleb128 0x10
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
	.uleb128 0x11
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
	.uleb128 0x12
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x5
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
	.uleb128 0x15
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
	.uleb128 0x16
	.uleb128 0x5
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
	.uleb128 0x17
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1a
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
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x1b
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
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x1c
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
	.uleb128 0x1d
	.uleb128 0x5
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
	.uleb128 0x1e
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
	.uleb128 0x1f
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
	.uleb128 0x20
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x21
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
	.uleb128 0x22
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
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",%progbits
.Ldebug_loc0:
.LLST0:
	.4byte	.LVL0-.Ltext0
	.4byte	.LVL1-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL1-.Ltext0
	.4byte	.LVL2-.Ltext0
	.2byte	0x3
	.byte	0x70
	.sleb128 -1
	.byte	0x9f
	.4byte	.LVL2-.Ltext0
	.4byte	.LFE63-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL3-.Ltext0
	.4byte	.LVL4-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL4-.Ltext0
	.4byte	.LVL5-.Ltext0
	.2byte	0x3
	.byte	0x70
	.sleb128 -1
	.byte	0x9f
	.4byte	.LVL5-.Ltext0
	.4byte	.LFE64-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL8-.Ltext0
	.4byte	.LVL10-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL10-.Ltext0
	.4byte	.LVL11-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	.LVL11-.Ltext0
	.4byte	.LVL12-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL12-.Ltext0
	.4byte	.LVL13-.Ltext0
	.2byte	0x4
	.byte	0x70
	.sleb128 0
	.byte	0x20
	.byte	0x9f
	.4byte	.LVL13-.Ltext0
	.4byte	.LFE68-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL9-.Ltext0
	.4byte	.LVL14-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL14-.Ltext0
	.4byte	.LFE68-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL11-.Ltext0
	.4byte	.LVL12-.Ltext0
	.2byte	0x4
	.byte	0x70
	.sleb128 0
	.byte	0x20
	.byte	0x9f
	.4byte	.LVL12-.Ltext0
	.4byte	.LVL13-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL13-.Ltext0
	.4byte	.LFE68-.Ltext0
	.2byte	0x5
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x20
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
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.4byte	.LBB6-.Ltext0
	.4byte	.LBE6-.Ltext0
	.4byte	.LBB12-.Ltext0
	.4byte	.LBE12-.Ltext0
	.4byte	0
	.4byte	0
	.4byte	.LBB9-.Ltext0
	.4byte	.LBE9-.Ltext0
	.4byte	.LBB13-.Ltext0
	.4byte	.LBE13-.Ltext0
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF29:
	.ascii	"USB_LP_CAN1_RX0_IRQn\000"
.LASF102:
	.ascii	"APB1ENR\000"
.LASF95:
	.ascii	"CPACR\000"
.LASF98:
	.ascii	"APB2RSTR\000"
.LASF31:
	.ascii	"CAN1_SCE_IRQn\000"
.LASF26:
	.ascii	"DMA1_Channel7_IRQn\000"
.LASF43:
	.ascii	"I2C2_ER_IRQn\000"
.LASF39:
	.ascii	"TIM4_IRQn\000"
.LASF21:
	.ascii	"DMA1_Channel2_IRQn\000"
.LASF119:
	.ascii	"NVIC_SetPriority\000"
.LASF64:
	.ascii	"unsigned int\000"
.LASF89:
	.ascii	"DFSR\000"
.LASF103:
	.ascii	"BDCR\000"
.LASF58:
	.ascii	"__int32_t\000"
.LASF13:
	.ascii	"FLASH_IRQn\000"
.LASF15:
	.ascii	"EXTI0_IRQn\000"
.LASF49:
	.ascii	"EXTI15_10_IRQn\000"
.LASF7:
	.ascii	"PendSV_IRQn\000"
.LASF133:
	.ascii	"../../lib/delay.c\000"
.LASF14:
	.ascii	"RCC_IRQn\000"
.LASF2:
	.ascii	"MemoryManagement_IRQn\000"
.LASF116:
	.ascii	"TIM_TypeDef\000"
.LASF67:
	.ascii	"uint32_t\000"
.LASF93:
	.ascii	"MMFR\000"
.LASF114:
	.ascii	"BDTR\000"
.LASF68:
	.ascii	"ISER\000"
.LASF33:
	.ascii	"TIM1_BRK_IRQn\000"
.LASF110:
	.ascii	"CCR1\000"
.LASF111:
	.ascii	"CCR2\000"
.LASF112:
	.ascii	"CCR3\000"
.LASF71:
	.ascii	"RSERVED1\000"
.LASF107:
	.ascii	"CCMR1\000"
.LASF108:
	.ascii	"CCMR2\000"
.LASF44:
	.ascii	"SPI1_IRQn\000"
.LASF23:
	.ascii	"DMA1_Channel4_IRQn\000"
.LASF120:
	.ascii	"NVIC_EnableIRQ\000"
.LASF63:
	.ascii	"long long unsigned int\000"
.LASF30:
	.ascii	"CAN1_RX1_IRQn\000"
.LASF127:
	.ascii	"time\000"
.LASF28:
	.ascii	"USB_HP_CAN1_TX_IRQn\000"
.LASF52:
	.ascii	"IRQn_Type\000"
.LASF47:
	.ascii	"USART2_IRQn\000"
.LASF124:
	.ascii	"systimer_init\000"
.LASF82:
	.ascii	"CPUID\000"
.LASF104:
	.ascii	"RCC_TypeDef\000"
.LASF92:
	.ascii	"AFSR\000"
.LASF106:
	.ascii	"DIER\000"
.LASF137:
	.ascii	"systimer_timeout_flag\000"
.LASF121:
	.ascii	"delay_ms\000"
.LASF17:
	.ascii	"EXTI2_IRQn\000"
.LASF99:
	.ascii	"APB1RSTR\000"
.LASF42:
	.ascii	"I2C2_EV_IRQn\000"
.LASF88:
	.ascii	"HFSR\000"
.LASF109:
	.ascii	"CCER\000"
.LASF25:
	.ascii	"DMA1_Channel6_IRQn\000"
.LASF85:
	.ascii	"AIRCR\000"
.LASF38:
	.ascii	"TIM3_IRQn\000"
.LASF20:
	.ascii	"DMA1_Channel1_IRQn\000"
.LASF100:
	.ascii	"AHBENR\000"
.LASF65:
	.ascii	"uint8_t\000"
.LASF113:
	.ascii	"CCR4\000"
.LASF105:
	.ascii	"SMCR\000"
.LASF51:
	.ascii	"USBWakeUp_IRQn\000"
.LASF62:
	.ascii	"long long int\000"
.LASF9:
	.ascii	"WWDG_IRQn\000"
.LASF86:
	.ascii	"SHCSR\000"
.LASF87:
	.ascii	"CFSR\000"
.LASF3:
	.ascii	"BusFault_IRQn\000"
.LASF125:
	.ascii	"current_time\000"
.LASF19:
	.ascii	"EXTI4_IRQn\000"
.LASF10:
	.ascii	"PVD_IRQn\000"
.LASF134:
	.ascii	"/home/semir/Documents/embedded_system/stm/stm32f103"
	.ascii	"/examples/sim800\000"
.LASF74:
	.ascii	"ICPR\000"
.LASF101:
	.ascii	"APB2ENR\000"
.LASF128:
	.ascii	"systimer_status\000"
.LASF22:
	.ascii	"DMA1_Channel3_IRQn\000"
.LASF40:
	.ascii	"I2C1_EV_IRQn\000"
.LASF129:
	.ascii	"utmp_32\000"
.LASF117:
	.ascii	"IRQn\000"
.LASF34:
	.ascii	"TIM1_UP_IRQn\000"
.LASF79:
	.ascii	"STIR\000"
.LASF90:
	.ascii	"MMFAR\000"
.LASF50:
	.ascii	"RTC_Alarm_IRQn\000"
.LASF12:
	.ascii	"RTC_IRQn\000"
.LASF69:
	.ascii	"RESERVED0\000"
.LASF73:
	.ascii	"RESERVED2\000"
.LASF75:
	.ascii	"RESERVED3\000"
.LASF77:
	.ascii	"RESERVED4\000"
.LASF78:
	.ascii	"RESERVED5\000"
.LASF56:
	.ascii	"short int\000"
.LASF59:
	.ascii	"long int\000"
.LASF46:
	.ascii	"USART1_IRQn\000"
.LASF115:
	.ascii	"DMAR\000"
.LASF130:
	.ascii	"ITM_RxBuffer\000"
.LASF123:
	.ascii	"delay\000"
.LASF0:
	.ascii	"NonMaskableInt_IRQn\000"
.LASF118:
	.ascii	"priority\000"
.LASF36:
	.ascii	"TIM1_CC_IRQn\000"
.LASF97:
	.ascii	"CFGR\000"
.LASF16:
	.ascii	"EXTI1_IRQn\000"
.LASF81:
	.ascii	"NVIC_Type\000"
.LASF96:
	.ascii	"SCB_Type\000"
.LASF91:
	.ascii	"BFAR\000"
.LASF35:
	.ascii	"TIM1_TRG_COM_IRQn\000"
.LASF84:
	.ascii	"VTOR\000"
.LASF41:
	.ascii	"I2C1_ER_IRQn\000"
.LASF8:
	.ascii	"SysTick_IRQn\000"
.LASF80:
	.ascii	"sizetype\000"
.LASF83:
	.ascii	"ICSR\000"
.LASF61:
	.ascii	"long unsigned int\000"
.LASF37:
	.ascii	"TIM2_IRQn\000"
.LASF66:
	.ascii	"int32_t\000"
.LASF132:
	.ascii	"GNU C 4.9.3 20141119 (release) [ARM/embedded-4_9-br"
	.ascii	"anch revision 218278] -mlittle-endian -mthumb -mcpu"
	.ascii	"=cortex-m3 -mthumb-interwork -g -O2\000"
.LASF6:
	.ascii	"DebugMonitor_IRQn\000"
.LASF4:
	.ascii	"UsageFault_IRQn\000"
.LASF55:
	.ascii	"unsigned char\000"
.LASF60:
	.ascii	"__uint32_t\000"
.LASF32:
	.ascii	"EXTI9_5_IRQn\000"
.LASF5:
	.ascii	"SVCall_IRQn\000"
.LASF131:
	.ascii	"g_systimer\000"
.LASF136:
	.ascii	"systimer_get\000"
.LASF70:
	.ascii	"ICER\000"
.LASF45:
	.ascii	"SPI2_IRQn\000"
.LASF76:
	.ascii	"IABR\000"
.LASF24:
	.ascii	"DMA1_Channel5_IRQn\000"
.LASF53:
	.ascii	"__uint8_t\000"
.LASF122:
	.ascii	"delay_us\000"
.LASF54:
	.ascii	"signed char\000"
.LASF126:
	.ascii	"period\000"
.LASF57:
	.ascii	"short unsigned int\000"
.LASF18:
	.ascii	"EXTI3_IRQn\000"
.LASF1:
	.ascii	"HardFault_IRQn\000"
.LASF135:
	.ascii	"TIM2_IRQHandler\000"
.LASF72:
	.ascii	"ISPR\000"
.LASF27:
	.ascii	"ADC1_2_IRQn\000"
.LASF94:
	.ascii	"ISAR\000"
.LASF48:
	.ascii	"USART3_IRQn\000"
.LASF11:
	.ascii	"TAMPER_IRQn\000"
	.ident	"GCC: (GNU Tools for ARM Embedded Processors) 4.9.3 20141119 (release) [ARM/embedded-4_9-branch revision 218278]"
