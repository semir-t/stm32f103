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
	.file	"system_stm32f1xx.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.thumb
	.thumb_func
	.type	SetSysClockTo72, %function
SetSysClockTo72:
.LFB66:
	.file 1 "system_stm32f1xx.c"
	.loc 1 513 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 518 0
	ldr	r3, .L18
	.loc 1 514 0
	movs	r1, #0
	.loc 1 513 0
	sub	sp, sp, #8
	.cfi_def_cfa_offset 8
	.loc 1 514 0
	str	r1, [sp]
	str	r1, [sp, #4]
	.loc 1 518 0
	ldr	r1, [r3]
	.loc 1 523 0
	mov	r2, r3
	.loc 1 518 0
	orr	r1, r1, #65536
	str	r1, [r3]
	b	.L3
.L16:
	.loc 1 525 0 discriminator 1
	ldr	r3, [sp]
	cmp	r3, #1280
	beq	.L2
.L3:
	.loc 1 523 0 discriminator 2
	ldr	r3, [r2]
	and	r3, r3, #131072
	str	r3, [sp, #4]
	.loc 1 524 0 discriminator 2
	ldr	r3, [sp]
	adds	r3, r3, #1
	str	r3, [sp]
	.loc 1 525 0 discriminator 2
	ldr	r3, [sp, #4]
	cmp	r3, #0
	beq	.L16
.L2:
	.loc 1 527 0
	ldr	r3, .L18
	ldr	r3, [r3]
	ands	r3, r3, #131072
	.loc 1 529 0
	it	ne
	movne	r3, #1
	.loc 1 533 0
	str	r3, [sp, #4]
	.loc 1 536 0
	ldr	r3, [sp, #4]
	cmp	r3, #1
	beq	.L17
	.loc 1 605 0
	add	sp, sp, #8
	.cfi_remember_state
	.cfi_def_cfa_offset 0
	@ sp needed
	bx	lr
.L17:
	.cfi_restore_state
	.loc 1 539 0
	ldr	r2, .L18+4
	.loc 1 547 0
	ldr	r3, .L18
	.loc 1 539 0
	ldr	r0, [r2]
	.loc 1 588 0
	mov	r1, r3
	.loc 1 539 0
	orr	r0, r0, #16
	str	r0, [r2]
	.loc 1 542 0
	ldr	r0, [r2]
	bic	r0, r0, #7
	str	r0, [r2]
	.loc 1 543 0
	ldr	r0, [r2]
	orr	r0, r0, #4
	str	r0, [r2]
	.loc 1 547 0
	ldr	r2, [r3, #4]
	str	r2, [r3, #4]
	.loc 1 550 0
	ldr	r2, [r3, #4]
	str	r2, [r3, #4]
	.loc 1 553 0
	ldr	r2, [r3, #4]
	orr	r2, r2, #1024
	str	r2, [r3, #4]
	.loc 1 579 0
	ldr	r2, [r3, #4]
	bic	r2, r2, #4128768
	str	r2, [r3, #4]
	.loc 1 581 0
	ldr	r2, [r3, #4]
	orr	r2, r2, #1900544
	str	r2, [r3, #4]
	.loc 1 585 0
	ldr	r2, [r3]
	orr	r2, r2, #16777216
	str	r2, [r3]
.L7:
	.loc 1 588 0 discriminator 1
	ldr	r3, [r1]
	ldr	r2, .L18
	lsls	r3, r3, #6
	bpl	.L7
	.loc 1 597 0
	mov	r1, r2
	.loc 1 593 0
	ldr	r3, [r2, #4]
	bic	r3, r3, #3
	str	r3, [r2, #4]
	.loc 1 594 0
	ldr	r3, [r2, #4]
	orr	r3, r3, #2
	str	r3, [r2, #4]
.L8:
	.loc 1 597 0 discriminator 1
	ldr	r3, [r1, #4]
	and	r3, r3, #12
	cmp	r3, #8
	bne	.L8
	.loc 1 605 0
	add	sp, sp, #8
	.cfi_def_cfa_offset 0
	@ sp needed
	bx	lr
.L19:
	.align	2
.L18:
	.word	1073876992
	.word	1073881088
	.cfi_endproc
.LFE66:
	.size	SetSysClockTo72, .-SetSysClockTo72
	.align	2
	.global	SystemInit
	.thumb
	.thumb_func
	.type	SystemInit, %function
SystemInit:
.LFB63:
	.loc 1 224 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.cfi_offset 14, -4
	.loc 1 227 0
	ldr	r3, .L22
	.loc 1 231 0
	ldr	r2, .L22+4
	.loc 1 227 0
	ldr	r1, [r3]
	.loc 1 262 0
	mov	r0, #10420224
	.loc 1 227 0
	orr	r1, r1, #1
	str	r1, [r3]
	.loc 1 231 0
	ldr	r1, [r3, #4]
	ands	r2, r2, r1
	str	r2, [r3, #4]
	.loc 1 237 0
	ldr	r2, [r3]
	bic	r2, r2, #17301504
	bic	r2, r2, #65536
	str	r2, [r3]
	.loc 1 240 0
	ldr	r2, [r3]
	bic	r2, r2, #262144
	str	r2, [r3]
	.loc 1 243 0
	ldr	r2, [r3, #4]
	bic	r2, r2, #8323072
	str	r2, [r3, #4]
	.loc 1 262 0
	str	r0, [r3, #8]
.LBB4:
.LBB5:
	.loc 1 439 0
	bl	SetSysClockTo72
.LVL0:
.LBE5:
.LBE4:
	.loc 1 278 0
	ldr	r3, .L22+8
	mov	r2, #134217728
	str	r2, [r3, #8]
	pop	{r3, pc}
.L23:
	.align	2
.L22:
	.word	1073876992
	.word	-117506048
	.word	-536810240
	.cfi_endproc
.LFE63:
	.size	SystemInit, .-SystemInit
	.align	2
	.global	SystemCoreClockUpdate
	.thumb
	.thumb_func
	.type	SystemCoreClockUpdate, %function
SystemCoreClockUpdate:
.LFB64:
	.loc 1 318 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL1:
	.loc 1 330 0
	ldr	r2, .L32
	ldr	r3, [r2, #4]
.LVL2:
	and	r3, r3, #12
.LVL3:
	.loc 1 332 0
	cmp	r3, #8
	bne	.L30
	.loc 1 343 0
	ldr	r3, [r2, #4]
.LVL4:
	.loc 1 344 0
	ldr	r1, [r2, #4]
.LVL5:
	.loc 1 347 0
	ubfx	r3, r3, #18, #4
.LVL6:
	.loc 1 349 0
	lsls	r1, r1, #15
.LVL7:
	.loc 1 347 0
	add	r3, r3, #2
.LVL8:
	.loc 1 349 0
	bpl	.L31
	.loc 1 362 0
	ldr	r2, [r2, #4]
	lsls	r2, r2, #14
	bmi	.L31
	.loc 1 368 0
	ldr	r2, .L32+4
	mul	r3, r2, r3
.LVL9:
	b	.L25
.LVL10:
.L30:
	.loc 1 332 0
	ldr	r3, .L32+4
.LVL11:
.L25:
	.loc 1 420 0
	ldr	r2, .L32
	ldr	r0, .L32+8
	ldr	r2, [r2, #4]
.LVL12:
	.loc 1 422 0
	ldr	r1, .L32+12
	.loc 1 420 0
	ubfx	r2, r2, #4, #4
.LVL13:
	.loc 1 422 0
	ldrb	r2, [r0, r2]	@ zero_extendqisi2
	lsrs	r3, r3, r2
	str	r3, [r1]
	bx	lr
.LVL14:
.L31:
	.loc 1 364 0
	ldr	r2, .L32+16
	mul	r3, r2, r3
.LVL15:
	b	.L25
.L33:
	.align	2
.L32:
	.word	1073876992
	.word	8000000
	.word	.LANCHOR1
	.word	.LANCHOR0
	.word	4000000
	.cfi_endproc
.LFE64:
	.size	SystemCoreClockUpdate, .-SystemCoreClockUpdate
	.align	2
	.global	SetSysClock
	.thumb
	.thumb_func
	.type	SetSysClock, %function
SetSysClock:
.LFB65:
	.loc 1 427 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 439 0
	b	SetSysClockTo72
.LVL16:
	.cfi_endproc
.LFE65:
	.size	SetSysClock, .-SetSysClock
	.global	APBPrescTable
	.global	AHBPrescTable
	.global	SystemCoreClock
	.section	.rodata
	.align	2
	.set	.LANCHOR1,. + 0
	.type	AHBPrescTable, %object
	.size	AHBPrescTable, 16
AHBPrescTable:
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	2
	.byte	3
	.byte	4
	.byte	6
	.byte	7
	.byte	8
	.byte	9
	.type	APBPrescTable, %object
	.size	APBPrescTable, 8
APBPrescTable:
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	2
	.byte	3
	.byte	4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	SystemCoreClock, %object
	.size	SystemCoreClock, 4
SystemCoreClock:
	.word	72000000
	.text
.Letext0:
	.file 2 "/home/semir/.stm/gcc-arm-none-eabi/arm-none-eabi/include/machine/_default_types.h"
	.file 3 "/home/semir/.stm/gcc-arm-none-eabi/arm-none-eabi/include/stdint.h"
	.file 4 "/home/semir/.stm/Libraries/STM32F1/CMSIS/Include/core_cm3.h"
	.file 5 "/home/semir/.stm/Libraries/STM32F1/CMSIS/Device/ST/STM32F1xx/Include/stm32f103xb.h"
	.file 6 "stm32f1xx.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x4cf
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF58
	.byte	0x1
	.4byte	.LASF59
	.4byte	.LASF60
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF0
	.uleb128 0x3
	.4byte	.LASF3
	.byte	0x2
	.byte	0x1d
	.4byte	0x37
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF1
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF2
	.uleb128 0x3
	.4byte	.LASF4
	.byte	0x2
	.byte	0x2b
	.4byte	0x50
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF5
	.uleb128 0x3
	.4byte	.LASF6
	.byte	0x2
	.byte	0x3f
	.4byte	0x62
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF7
	.uleb128 0x3
	.4byte	.LASF8
	.byte	0x2
	.byte	0x41
	.4byte	0x74
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF9
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF10
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF11
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF12
	.uleb128 0x3
	.4byte	.LASF13
	.byte	0x3
	.byte	0x15
	.4byte	0x2c
	.uleb128 0x3
	.4byte	.LASF14
	.byte	0x3
	.byte	0x21
	.4byte	0x45
	.uleb128 0x3
	.4byte	.LASF15
	.byte	0x3
	.byte	0x2c
	.4byte	0x57
	.uleb128 0x3
	.4byte	.LASF16
	.byte	0x3
	.byte	0x2d
	.4byte	0x69
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF17
	.uleb128 0x5
	.4byte	0xb8
	.uleb128 0x6
	.byte	0x8c
	.byte	0x4
	.2byte	0x1a1
	.4byte	0x1ea
	.uleb128 0x7
	.4byte	.LASF18
	.byte	0x4
	.2byte	0x1a3
	.4byte	0x1ea
	.byte	0
	.uleb128 0x7
	.4byte	.LASF19
	.byte	0x4
	.2byte	0x1a4
	.4byte	0xca
	.byte	0x4
	.uleb128 0x7
	.4byte	.LASF20
	.byte	0x4
	.2byte	0x1a5
	.4byte	0xca
	.byte	0x8
	.uleb128 0x7
	.4byte	.LASF21
	.byte	0x4
	.2byte	0x1a6
	.4byte	0xca
	.byte	0xc
	.uleb128 0x8
	.ascii	"SCR\000"
	.byte	0x4
	.2byte	0x1a7
	.4byte	0xca
	.byte	0x10
	.uleb128 0x8
	.ascii	"CCR\000"
	.byte	0x4
	.2byte	0x1a8
	.4byte	0xca
	.byte	0x14
	.uleb128 0x8
	.ascii	"SHP\000"
	.byte	0x4
	.2byte	0x1a9
	.4byte	0x1ff
	.byte	0x18
	.uleb128 0x7
	.4byte	.LASF22
	.byte	0x4
	.2byte	0x1aa
	.4byte	0xca
	.byte	0x24
	.uleb128 0x7
	.4byte	.LASF23
	.byte	0x4
	.2byte	0x1ab
	.4byte	0xca
	.byte	0x28
	.uleb128 0x7
	.4byte	.LASF24
	.byte	0x4
	.2byte	0x1ac
	.4byte	0xca
	.byte	0x2c
	.uleb128 0x7
	.4byte	.LASF25
	.byte	0x4
	.2byte	0x1ad
	.4byte	0xca
	.byte	0x30
	.uleb128 0x7
	.4byte	.LASF26
	.byte	0x4
	.2byte	0x1ae
	.4byte	0xca
	.byte	0x34
	.uleb128 0x7
	.4byte	.LASF27
	.byte	0x4
	.2byte	0x1af
	.4byte	0xca
	.byte	0x38
	.uleb128 0x7
	.4byte	.LASF28
	.byte	0x4
	.2byte	0x1b0
	.4byte	0xca
	.byte	0x3c
	.uleb128 0x8
	.ascii	"PFR\000"
	.byte	0x4
	.2byte	0x1b1
	.4byte	0x214
	.byte	0x40
	.uleb128 0x8
	.ascii	"DFR\000"
	.byte	0x4
	.2byte	0x1b2
	.4byte	0x1ea
	.byte	0x48
	.uleb128 0x8
	.ascii	"ADR\000"
	.byte	0x4
	.2byte	0x1b3
	.4byte	0x1ea
	.byte	0x4c
	.uleb128 0x7
	.4byte	.LASF29
	.byte	0x4
	.2byte	0x1b4
	.4byte	0x22e
	.byte	0x50
	.uleb128 0x7
	.4byte	.LASF30
	.byte	0x4
	.2byte	0x1b5
	.4byte	0x248
	.byte	0x60
	.uleb128 0x7
	.4byte	.LASF31
	.byte	0x4
	.2byte	0x1b6
	.4byte	0x238
	.byte	0x74
	.uleb128 0x7
	.4byte	.LASF32
	.byte	0x4
	.2byte	0x1b7
	.4byte	0xca
	.byte	0x88
	.byte	0
	.uleb128 0x9
	.4byte	0xca
	.uleb128 0xa
	.4byte	0x97
	.4byte	0x1ff
	.uleb128 0xb
	.4byte	0xc3
	.byte	0xb
	.byte	0
	.uleb128 0x5
	.4byte	0x1ef
	.uleb128 0xa
	.4byte	0xb8
	.4byte	0x214
	.uleb128 0xb
	.4byte	0xc3
	.byte	0x1
	.byte	0
	.uleb128 0x9
	.4byte	0x219
	.uleb128 0x5
	.4byte	0x204
	.uleb128 0xa
	.4byte	0xb8
	.4byte	0x22e
	.uleb128 0xb
	.4byte	0xc3
	.byte	0x3
	.byte	0
	.uleb128 0x9
	.4byte	0x233
	.uleb128 0x5
	.4byte	0x21e
	.uleb128 0xa
	.4byte	0xb8
	.4byte	0x248
	.uleb128 0xb
	.4byte	0xc3
	.byte	0x4
	.byte	0
	.uleb128 0x9
	.4byte	0x24d
	.uleb128 0x5
	.4byte	0x238
	.uleb128 0xc
	.4byte	.LASF33
	.byte	0x4
	.2byte	0x1b8
	.4byte	0xcf
	.uleb128 0x6
	.byte	0x24
	.byte	0x5
	.2byte	0x157
	.4byte	0x2da
	.uleb128 0x8
	.ascii	"ACR\000"
	.byte	0x5
	.2byte	0x159
	.4byte	0xca
	.byte	0
	.uleb128 0x7
	.4byte	.LASF34
	.byte	0x5
	.2byte	0x15a
	.4byte	0xca
	.byte	0x4
	.uleb128 0x7
	.4byte	.LASF35
	.byte	0x5
	.2byte	0x15b
	.4byte	0xca
	.byte	0x8
	.uleb128 0x8
	.ascii	"SR\000"
	.byte	0x5
	.2byte	0x15c
	.4byte	0xca
	.byte	0xc
	.uleb128 0x8
	.ascii	"CR\000"
	.byte	0x5
	.2byte	0x15d
	.4byte	0xca
	.byte	0x10
	.uleb128 0x8
	.ascii	"AR\000"
	.byte	0x5
	.2byte	0x15e
	.4byte	0xca
	.byte	0x14
	.uleb128 0x7
	.4byte	.LASF36
	.byte	0x5
	.2byte	0x15f
	.4byte	0xca
	.byte	0x18
	.uleb128 0x8
	.ascii	"OBR\000"
	.byte	0x5
	.2byte	0x160
	.4byte	0xca
	.byte	0x1c
	.uleb128 0x7
	.4byte	.LASF37
	.byte	0x5
	.2byte	0x161
	.4byte	0xca
	.byte	0x20
	.byte	0
	.uleb128 0xc
	.4byte	.LASF38
	.byte	0x5
	.2byte	0x162
	.4byte	0x25e
	.uleb128 0x6
	.byte	0x28
	.byte	0x5
	.2byte	0x1ba
	.4byte	0x371
	.uleb128 0x8
	.ascii	"CR\000"
	.byte	0x5
	.2byte	0x1bc
	.4byte	0xca
	.byte	0
	.uleb128 0x7
	.4byte	.LASF39
	.byte	0x5
	.2byte	0x1bd
	.4byte	0xca
	.byte	0x4
	.uleb128 0x8
	.ascii	"CIR\000"
	.byte	0x5
	.2byte	0x1be
	.4byte	0xca
	.byte	0x8
	.uleb128 0x7
	.4byte	.LASF40
	.byte	0x5
	.2byte	0x1bf
	.4byte	0xca
	.byte	0xc
	.uleb128 0x7
	.4byte	.LASF41
	.byte	0x5
	.2byte	0x1c0
	.4byte	0xca
	.byte	0x10
	.uleb128 0x7
	.4byte	.LASF42
	.byte	0x5
	.2byte	0x1c1
	.4byte	0xca
	.byte	0x14
	.uleb128 0x7
	.4byte	.LASF43
	.byte	0x5
	.2byte	0x1c2
	.4byte	0xca
	.byte	0x18
	.uleb128 0x7
	.4byte	.LASF44
	.byte	0x5
	.2byte	0x1c3
	.4byte	0xca
	.byte	0x1c
	.uleb128 0x7
	.4byte	.LASF45
	.byte	0x5
	.2byte	0x1c4
	.4byte	0xca
	.byte	0x20
	.uleb128 0x8
	.ascii	"CSR\000"
	.byte	0x5
	.2byte	0x1c5
	.4byte	0xca
	.byte	0x24
	.byte	0
	.uleb128 0xc
	.4byte	.LASF46
	.byte	0x5
	.2byte	0x1c8
	.4byte	0x2e6
	.uleb128 0xd
	.byte	0x1
	.byte	0x6
	.byte	0xaa
	.4byte	0x392
	.uleb128 0xe
	.4byte	.LASF47
	.sleb128 0
	.uleb128 0xf
	.ascii	"SET\000"
	.sleb128 1
	.byte	0
	.uleb128 0x10
	.4byte	.LASF61
	.byte	0x1
	.2byte	0x1aa
	.byte	0x1
	.uleb128 0x11
	.4byte	.LASF62
	.byte	0x1
	.2byte	0x200
	.4byte	.LFB66
	.4byte	.LFE66-.LFB66
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3d0
	.uleb128 0x12
	.4byte	.LASF48
	.byte	0x1
	.2byte	0x202
	.4byte	0xca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0x12
	.4byte	.LASF49
	.byte	0x1
	.2byte	0x202
	.4byte	0xca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.uleb128 0x13
	.4byte	.LASF50
	.byte	0x1
	.byte	0xdf
	.4byte	.LFB63
	.4byte	.LFE63-.LFB63
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x400
	.uleb128 0x14
	.4byte	0x392
	.4byte	.LBB4
	.4byte	.LBE4-.LBB4
	.byte	0x1
	.2byte	0x110
	.uleb128 0x15
	.4byte	.LVL0
	.4byte	0x39b
	.byte	0
	.byte	0
	.uleb128 0x16
	.4byte	.LASF51
	.byte	0x1
	.2byte	0x13d
	.4byte	.LFB64
	.4byte	.LFE64-.LFB64
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x447
	.uleb128 0x17
	.ascii	"tmp\000"
	.byte	0x1
	.2byte	0x13f
	.4byte	0xb8
	.4byte	.LLST0
	.uleb128 0x18
	.4byte	.LASF52
	.byte	0x1
	.2byte	0x13f
	.4byte	0xb8
	.4byte	.LLST1
	.uleb128 0x18
	.4byte	.LASF53
	.byte	0x1
	.2byte	0x13f
	.4byte	0xb8
	.4byte	.LLST2
	.byte	0
	.uleb128 0x19
	.4byte	0x392
	.4byte	.LFB65
	.4byte	.LFE65-.LFB65
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x464
	.uleb128 0x1a
	.4byte	.LVL16
	.4byte	0x39b
	.byte	0
	.uleb128 0x1b
	.4byte	.LASF54
	.byte	0x4
	.2byte	0x696
	.4byte	0x470
	.uleb128 0x5
	.4byte	0xad
	.uleb128 0x1c
	.4byte	.LASF55
	.byte	0x1
	.byte	0xa2
	.4byte	0xb8
	.uleb128 0x5
	.byte	0x3
	.4byte	SystemCoreClock
	.uleb128 0xa
	.4byte	0x97
	.4byte	0x496
	.uleb128 0xb
	.4byte	0xc3
	.byte	0xf
	.byte	0
	.uleb128 0x1c
	.4byte	.LASF56
	.byte	0x1
	.byte	0xae
	.4byte	0x4a7
	.uleb128 0x5
	.byte	0x3
	.4byte	AHBPrescTable
	.uleb128 0x9
	.4byte	0x486
	.uleb128 0xa
	.4byte	0x97
	.4byte	0x4bc
	.uleb128 0xb
	.4byte	0xc3
	.byte	0x7
	.byte	0
	.uleb128 0x1c
	.4byte	.LASF57
	.byte	0x1
	.byte	0xaf
	.4byte	0x4cd
	.uleb128 0x5
	.byte	0x3
	.4byte	APBPrescTable
	.uleb128 0x9
	.4byte	0x4ac
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
	.uleb128 0x3
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
	.uleb128 0x8
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
	.uleb128 0x9
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xc
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
	.uleb128 0xd
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
	.uleb128 0xe
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
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
	.byte	0
	.byte	0
	.uleb128 0x11
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
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x13
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
	.uleb128 0x14
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0x5
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
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
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
	.uleb128 0x17
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x18
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
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x31
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
	.uleb128 0x1a
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x2115
	.uleb128 0x19
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
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
	.uleb128 0x1c
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
	.4byte	.LVL1-.Ltext0
	.4byte	.LVL2-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL2-.Ltext0
	.4byte	.LVL3-.Ltext0
	.2byte	0x5
	.byte	0x73
	.sleb128 0
	.byte	0x3c
	.byte	0x1a
	.byte	0x9f
	.4byte	.LVL3-.Ltext0
	.4byte	.LVL4-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL10-.Ltext0
	.4byte	.LVL11-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL12-.Ltext0
	.4byte	.LVL13-.Ltext0
	.2byte	0x13
	.byte	0x72
	.sleb128 0
	.byte	0x8
	.byte	0xf0
	.byte	0x1a
	.byte	0x34
	.byte	0x25
	.byte	0x3
	.4byte	AHBPrescTable
	.byte	0x22
	.byte	0x94
	.byte	0x1
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL1-.Ltext0
	.4byte	.LVL4-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL4-.Ltext0
	.4byte	.LVL6-.Ltext0
	.2byte	0x7
	.byte	0x73
	.sleb128 0
	.byte	0x4e
	.byte	0x41
	.byte	0x24
	.byte	0x1a
	.byte	0x9f
	.4byte	.LVL8-.Ltext0
	.4byte	.LVL9-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL10-.Ltext0
	.4byte	.LVL11-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL14-.Ltext0
	.4byte	.LVL15-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL1-.Ltext0
	.4byte	.LVL5-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL5-.Ltext0
	.4byte	.LVL7-.Ltext0
	.2byte	0x7
	.byte	0x71
	.sleb128 0
	.byte	0x40
	.byte	0x3c
	.byte	0x24
	.byte	0x1a
	.byte	0x9f
	.4byte	.LVL10-.Ltext0
	.4byte	.LVL11-.Ltext0
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
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF46:
	.ascii	"RCC_TypeDef\000"
.LASF41:
	.ascii	"APB1RSTR\000"
.LASF17:
	.ascii	"sizetype\000"
.LASF45:
	.ascii	"BDCR\000"
.LASF8:
	.ascii	"__uint32_t\000"
.LASF4:
	.ascii	"__uint16_t\000"
.LASF49:
	.ascii	"HSEStatus\000"
.LASF18:
	.ascii	"CPUID\000"
.LASF34:
	.ascii	"KEYR\000"
.LASF31:
	.ascii	"RESERVED0\000"
.LASF39:
	.ascii	"CFGR\000"
.LASF13:
	.ascii	"uint8_t\000"
.LASF44:
	.ascii	"APB1ENR\000"
.LASF2:
	.ascii	"short int\000"
.LASF43:
	.ascii	"APB2ENR\000"
.LASF19:
	.ascii	"ICSR\000"
.LASF35:
	.ascii	"OPTKEYR\000"
.LASF10:
	.ascii	"long long int\000"
.LASF27:
	.ascii	"BFAR\000"
.LASF7:
	.ascii	"long int\000"
.LASF52:
	.ascii	"pllmull\000"
.LASF42:
	.ascii	"AHBENR\000"
.LASF40:
	.ascii	"APB2RSTR\000"
.LASF3:
	.ascii	"__uint8_t\000"
.LASF37:
	.ascii	"WRPR\000"
.LASF23:
	.ascii	"CFSR\000"
.LASF62:
	.ascii	"SetSysClockTo72\000"
.LASF53:
	.ascii	"pllsource\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF21:
	.ascii	"AIRCR\000"
.LASF33:
	.ascii	"SCB_Type\000"
.LASF57:
	.ascii	"APBPrescTable\000"
.LASF48:
	.ascii	"StartUpCounter\000"
.LASF0:
	.ascii	"signed char\000"
.LASF11:
	.ascii	"long long unsigned int\000"
.LASF16:
	.ascii	"uint32_t\000"
.LASF12:
	.ascii	"unsigned int\000"
.LASF14:
	.ascii	"uint16_t\000"
.LASF22:
	.ascii	"SHCSR\000"
.LASF51:
	.ascii	"SystemCoreClockUpdate\000"
.LASF26:
	.ascii	"MMFAR\000"
.LASF50:
	.ascii	"SystemInit\000"
.LASF5:
	.ascii	"short unsigned int\000"
.LASF20:
	.ascii	"VTOR\000"
.LASF15:
	.ascii	"int32_t\000"
.LASF30:
	.ascii	"ISAR\000"
.LASF25:
	.ascii	"DFSR\000"
.LASF55:
	.ascii	"SystemCoreClock\000"
.LASF24:
	.ascii	"HFSR\000"
.LASF29:
	.ascii	"MMFR\000"
.LASF56:
	.ascii	"AHBPrescTable\000"
.LASF61:
	.ascii	"SetSysClock\000"
.LASF9:
	.ascii	"long unsigned int\000"
.LASF58:
	.ascii	"GNU C 4.9.3 20141119 (release) [ARM/embedded-4_9-br"
	.ascii	"anch revision 218278] -mlittle-endian -mthumb -mcpu"
	.ascii	"=cortex-m3 -mthumb-interwork -g -O2\000"
.LASF60:
	.ascii	"/home/semir/Documents/embedded_system/stm/stm32f103"
	.ascii	"/examples/blinky\000"
.LASF6:
	.ascii	"__int32_t\000"
.LASF47:
	.ascii	"RESET\000"
.LASF59:
	.ascii	"system_stm32f1xx.c\000"
.LASF28:
	.ascii	"AFSR\000"
.LASF36:
	.ascii	"RESERVED\000"
.LASF38:
	.ascii	"FLASH_TypeDef\000"
.LASF54:
	.ascii	"ITM_RxBuffer\000"
.LASF32:
	.ascii	"CPACR\000"
	.ident	"GCC: (GNU Tools for ARM Embedded Processors) 4.9.3 20141119 (release) [ARM/embedded-4_9-branch revision 218278]"
