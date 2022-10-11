	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.align	2
	.global	initialize
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	push	{r4, r5, r6, lr}
	mov	r4, #0
	ldr	r1, .L4
	ldr	r3, .L4+4
	strh	r1, [r2]	@ movhi
	ldr	r2, .L4+8
	ldrh	lr, [r3, #48]
	ldr	ip, .L4+12
	strh	lr, [r2]	@ movhi
	mov	r1, r4
	mov	r0, r4
	mov	r3, #35
	mov	r2, #240
	ldr	r5, .L4+16
	strh	r4, [ip]	@ movhi
	mov	lr, pc
	bx	r5
	mov	r1, r4
	mov	r0, r4
	mov	r3, #160
	ldr	r4, .L4+20
	mov	r2, #240
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	1027
	.word	67109120
	.word	buttons
	.word	oldButtons
	.word	drawSky
	.word	drawSand
	.size	initialize, .-initialize
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"button a pressed\000"
	.align	2
.LC1:
	.ascii	"button b pressed\000"
	.align	2
.LC2:
	.ascii	"start pressed\000"
	.align	2
.LC3:
	.ascii	"increment timestep by 5\000"
	.align	2
.LC4:
	.ascii	"timeStep: %d\000"
	.align	2
.LC5:
	.ascii	"decrement timestep by 5\000"
	.text
	.align	2
	.global	update
	.syntax unified
	.arm
	.fpu softvfp
	.type	update, %function
update:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L49
	ldrh	r3, [r4]
	tst	r3, #1
	beq	.L7
	ldr	r2, .L49+4
	ldrh	r2, [r2]
	ands	r5, r2, #1
	beq	.L41
.L7:
	tst	r3, #2
	beq	.L9
	ldr	r2, .L49+4
	ldrh	r2, [r2]
	tst	r2, #2
	beq	.L42
.L9:
	tst	r3, #8
	beq	.L11
	ldr	r2, .L49+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L43
.L11:
	tst	r3, #4
	beq	.L12
	ldr	r2, .L49+4
	ldrh	r2, [r2]
	tst	r2, #4
	beq	.L44
.L12:
	tst	r3, #32
	beq	.L13
	ldr	r2, .L49+4
	ldrh	r2, [r2]
	ands	r2, r2, #32
	beq	.L45
.L13:
	tst	r3, #16
	beq	.L14
	ldr	r2, .L49+4
	ldrh	r2, [r2]
	tst	r2, #16
	beq	.L46
.L14:
	tst	r3, #64
	beq	.L15
	ldr	r2, .L49+4
	ldrh	r2, [r2]
	ands	r2, r2, #64
	beq	.L47
.L15:
	tst	r3, #128
	beq	.L6
	ldr	r3, .L49+4
	ldrh	r3, [r3]
	ands	r3, r3, #128
	bne	.L6
	ldr	r4, .L49+8
	ldr	r1, [r4]
	ldr	r2, .L49+12
	cmp	r1, #73
	str	r3, [r2]
	ble	.L48
.L6:
	pop	{r4, r5, r6, lr}
	bx	lr
.L47:
	ldr	r5, .L49+8
	ldr	r0, [r5]
	ldr	r1, .L49+12
	cmp	r0, #26
	str	r2, [r1]
	ble	.L15
	ldr	r0, .L49+16
	ldr	r6, .L49+20
	mov	lr, pc
	bx	r6
	ldr	r1, [r5]
	ldr	r0, .L49+24
	sub	r1, r1, #5
	str	r1, [r5]
	mov	lr, pc
	bx	r6
	ldrh	r3, [r4]
	b	.L15
.L46:
	mov	r0, #50
	mov	ip, #3
	mov	r1, #1
	ldr	r2, .L49+8
	str	r0, [r2]
	ldr	r0, .L49+28
	ldr	r2, .L49+32
	str	ip, [r0]
	str	r1, [r2]
	b	.L14
.L45:
	mov	r0, #50
	mov	ip, #1
	ldr	r1, .L49+8
	str	r0, [r1]
	ldr	r0, .L49+32
	ldr	r1, .L49+28
	str	ip, [r0]
	str	r2, [r1]
	b	.L13
.L44:
	ldr	r1, .L49+36
	ldr	r2, [r1]
	rsbs	r2, r2, #1
	mov	ip, #50
	movcc	r2, #0
	ldr	r0, .L49+8
	str	r2, [r1]
	str	ip, [r0]
	b	.L12
.L43:
	ldr	r0, .L49+40
	ldr	r3, .L49+20
	mov	lr, pc
	bx	r3
	ldr	r2, .L49+44
	ldr	r3, [r2]
	rsbs	r3, r3, #1
	movcc	r3, #0
	mov	r0, #50
	ldr	r1, .L49+8
	str	r3, [r2]
	str	r0, [r1]
	ldrh	r3, [r4]
	b	.L11
.L41:
	ldr	r0, .L49+48
	ldr	r3, .L49+20
	mov	lr, pc
	bx	r3
	ldr	r2, .L49+28
	ldr	r3, [r2]
	cmp	r3, #3
	movne	r0, #1
	moveq	r1, #1
	ldreq	r3, .L49+32
	ldrne	r1, .L49+32
	addne	r3, r3, r0
	streq	r1, [r3]
	strne	r3, [r2]
	streq	r5, [r2]
	strne	r0, [r1]
	ldrh	r3, [r4]
	b	.L7
.L42:
	ldr	r0, .L49+52
	ldr	r3, .L49+20
	mov	lr, pc
	bx	r3
	ldr	r2, .L49+28
	ldr	r3, [r2]
	cmp	r3, #0
	moveq	r0, #3
	moveq	r1, #1
	movne	r0, #1
	ldreq	r3, .L49+32
	ldrne	r1, .L49+32
	subne	r3, r3, #1
	streq	r1, [r3]
	strne	r3, [r2]
	streq	r0, [r2]
	strne	r0, [r1]
	ldrh	r3, [r4]
	b	.L9
.L48:
	ldr	r0, .L49+56
	ldr	r5, .L49+20
	mov	lr, pc
	bx	r5
	ldr	r1, [r4]
	ldr	r0, .L49+24
	add	r1, r1, #5
	str	r1, [r4]
	mov	lr, pc
	bx	r5
	b	.L6
.L50:
	.align	2
.L49:
	.word	oldButtons
	.word	buttons
	.word	timeStep
	.word	time
	.word	.LC3
	.word	mgba_printf
	.word	.LC4
	.word	currFrame
	.word	changed
	.word	direction
	.word	.LC2
	.word	isLooping
	.word	.LC0
	.word	.LC1
	.word	.LC5
	.size	update, .-update
	.align	2
	.global	reset
	.syntax unified
	.arm
	.fpu softvfp
	.type	reset, %function
reset:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #0
	push	{r4, lr}
	mov	r0, r1
	mov	r3, #35
	mov	r2, #240
	ldr	r4, .L53
	mov	lr, pc
	bx	r4
	mov	r1, #0
	ldr	r4, .L53+4
	mov	r3, #160
	mov	r0, r1
	mov	r2, #240
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L54:
	.align	2
.L53:
	.word	drawSky
	.word	drawSand
	.size	reset, .-reset
	.align	2
	.global	draw
	.syntax unified
	.arm
	.fpu softvfp
	.type	draw, %function
draw:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L68
	ldr	r3, [r4]
	cmp	r3, #0
	bne	.L67
.L56:
	ldr	r3, .L68+4
	ldr	r3, [r3]
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L55
.L59:
	.word	.L62
	.word	.L61
	.word	.L60
	.word	.L58
.L58:
	ldr	r3, .L68+8
	mov	lr, pc
	bx	r3
.L55:
	pop	{r4, lr}
	bx	lr
.L67:
	bl	reset
	mov	r3, #0
	str	r3, [r4]
	b	.L56
.L62:
	ldr	r3, .L68+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L61:
	ldr	r3, .L68+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L60:
	ldr	r3, .L68+20
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L69:
	.align	2
.L68:
	.word	changed
	.word	currFrame
	.word	fourthFrame
	.word	firstFrame
	.word	secondFrame
	.word	thirdFrame
	.size	draw, .-draw
	.section	.rodata.str1.4
	.align	2
.LC6:
	.ascii	"Debugging initialized\000"
	.align	2
.LC7:
	.ascii	"forwards loop started\000"
	.align	2
.LC8:
	.ascii	"backwards loop started\000"
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	mov	r1, #1
	ldr	r0, .L90
	ldr	r6, .L90+4
	ldr	r10, .L90+8
	push	{r4, r7, fp, lr}
	ldr	r2, .L90+12
	str	r1, [r10]
	str	r3, [r0]
	str	r3, [r6]
	mov	lr, pc
	bx	r2
	ldr	r0, .L90+16
	ldr	r3, .L90+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L90+24
	mov	lr, pc
	bx	r3
	ldr	r9, .L90+28
	ldr	r5, .L90+32
	ldr	fp, .L90+36
	ldr	r8, .L90+40
	ldr	r4, .L90+44
	ldr	r7, .L90+48
	b	.L79
.L88:
	ldr	r3, [r5]
	ldr	r2, [fp]
	add	r3, r3, #1
	cmp	r3, r2
	str	r3, [r5]
	beq	.L87
.L72:
	ldrh	r3, [r4]
	strh	r3, [r8]	@ movhi
	ldr	r3, .L90+52
	ldrh	r3, [r3, #48]
	strh	r3, [r4]	@ movhi
	mov	lr, pc
	bx	r7
	ldr	r3, .L90+56
	mov	lr, pc
	bx	r3
.L79:
	mov	lr, pc
	bx	r9
	ldr	r3, [r6]
	cmp	r3, #0
	beq	.L72
	ldr	r3, [r10]
	cmp	r3, #0
	bne	.L88
.L73:
	ldr	r3, [r5]
	ldr	r2, [fp]
	add	r3, r3, #1
	cmp	r3, r2
	str	r3, [r5]
	bne	.L72
	mov	r2, #0
	ldr	r1, .L90
	ldr	r3, [r1]
	cmp	r3, r2
	str	r2, [r5]
	bne	.L77
	mov	r2, #3
	mov	r3, #1
	str	r2, [r1]
	ldr	r2, .L90+60
	str	r3, [r2]
.L78:
	ldr	r0, .L90+64
	ldr	r3, .L90+20
	mov	lr, pc
	bx	r3
	b	.L72
.L87:
	mov	r2, #0
	ldr	r3, .L90
	ldr	r3, [r3]
	cmp	r3, #3
	str	r2, [r5]
	beq	.L89
	mov	r2, #1
	ldr	r1, .L90
	add	r3, r3, r2
	str	r3, [r1]
	ldr	r3, .L90+60
	str	r2, [r3]
.L76:
	ldr	r3, .L90+20
	ldr	r0, .L90+68
	mov	lr, pc
	bx	r3
	ldr	r3, [r6]
	cmp	r3, #0
	beq	.L72
	ldr	r3, [r10]
	cmp	r3, #0
	bne	.L72
	b	.L73
.L77:
	mov	r2, #1
	ldr	r1, .L90
	sub	r3, r3, #1
	str	r3, [r1]
	ldr	r3, .L90+60
	str	r2, [r3]
	b	.L78
.L89:
	mov	r3, #1
	ldr	r1, .L90
	str	r2, [r1]
	ldr	r2, .L90+60
	str	r3, [r2]
	b	.L76
.L91:
	.align	2
.L90:
	.word	currFrame
	.word	isLooping
	.word	direction
	.word	mgba_open
	.word	.LC6
	.word	mgba_printf
	.word	initialize
	.word	update
	.word	time
	.word	timeStep
	.word	oldButtons
	.word	buttons
	.word	waitForVBlank
	.word	67109120
	.word	draw
	.word	changed
	.word	.LC8
	.word	.LC7
	.size	main, .-main
	.comm	changed,4,4
	.comm	direction,4,4
	.comm	currFrame,4,4
	.comm	timeStep,4,4
	.comm	time,4,4
	.comm	isLooping,4,4
	.comm	currScreen,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	bgColor,2,2
	.ident	"GCC: (devkitARM release 53) 9.1.0"
