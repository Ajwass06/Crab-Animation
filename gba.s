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
	.file	"gba.c"
	.text
	.align	2
	.global	setPixel
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	setPixel, %function
setPixel:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L3
	rsb	r0, r0, r0, lsl #4
	ldr	r3, [r3]
	add	r1, r1, r0, lsl #4
	lsl	r1, r1, #1
	strh	r2, [r3, r1]	@ movhi
	bx	lr
.L4:
	.align	2
.L3:
	.word	.LANCHOR0
	.size	setPixel, .-setPixel
	.align	2
	.global	fillScreen
	.syntax unified
	.arm
	.fpu softvfp
	.type	fillScreen, %function
fillScreen:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L9
	ldr	r3, [r3]
	add	r2, r3, #76800
.L6:
	strh	r0, [r3], #2	@ movhi
	cmp	r3, r2
	bne	.L6
	bx	lr
.L10:
	.align	2
.L9:
	.word	.LANCHOR0
	.size	fillScreen, .-fillScreen
	.align	2
	.global	drawSky
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawSky, %function
drawSky:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	subs	lr, r3, #0
	ble	.L11
	rsb	r0, r0, r0, lsl #4
	add	r0, r2, r0, lsl #4
	add	r1, r0, r1
	mov	ip, #0
	mov	r0, #31744
	ldr	r3, .L19
	ldr	r3, [r3]
	rsb	r4, r2, r2, lsl #31
	add	r1, r3, r1, lsl #1
	lsl	r4, r4, #1
.L13:
	cmp	r2, #0
	addgt	r3, r1, r4
	ble	.L16
.L14:
	strh	r0, [r3], #2	@ movhi
	cmp	r3, r1
	bne	.L14
.L16:
	add	ip, ip, #1
	cmp	lr, ip
	add	r1, r1, #480
	bne	.L13
.L11:
	pop	{r4, lr}
	bx	lr
.L20:
	.align	2
.L19:
	.word	.LANCHOR0
	.size	drawSky, .-drawSky
	.align	2
	.global	drawSand
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawSand, %function
drawSand:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	cmp	r3, #35
	sub	sp, sp, #8
	str	r1, [sp, #4]
	ble	.L21
	ldr	ip, .L29
	add	r1, r1, #8384
	rsb	r0, r0, r0, lsl #4
	add	r1, r1, #16
	add	r1, r1, r0, lsl #4
	mov	lr, #35
	ldr	r0, [ip]
	mvn	ip, #64512
	add	r1, r1, r2
	rsb	r4, r2, r2, lsl #31
	add	r0, r0, r1, lsl #1
	lsl	r4, r4, #1
.L23:
	cmp	r2, #0
	addgt	r1, r0, r4
	ble	.L26
.L24:
	strh	ip, [r1], #2	@ movhi
	cmp	r1, r0
	bne	.L24
.L26:
	add	lr, lr, #1
	cmp	r3, lr
	add	r0, r0, #480
	bne	.L23
.L21:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L30:
	.align	2
.L29:
	.word	.LANCHOR0
	.size	drawSand, .-drawSand
	.align	2
	.global	drawCrabEyes
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawCrabEyes, %function
drawCrabEyes:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L43
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	rsb	r0, r0, r0, lsl #4
	ldr	r6, [ip]
	add	r7, r1, r0, lsl #4
	add	fp, r6, r7, lsl #1
	mov	r4, fp
	sub	sp, sp, #20
	lsl	ip, r0, #4
	add	r10, r1, #4
	add	r9, ip, #480
	str	ip, [sp, #8]
	add	lr, r6, #3840
	add	ip, r6, #4288
	add	r5, r6, #3360
	lsl	r1, r7, #1
	add	r9, r10, r9
	str	r10, [sp, #4]
	add	r8, r7, #242
	add	ip, ip, #32
	add	lr, lr, #4
	add	r5, r5, #8
	add	r10, r6, #18
	ldrh	r0, [sp, #56]
	str	r1, [sp, #12]
	add	r9, r6, r9, lsl #1
	add	r8, r6, r8, lsl #1
	add	ip, ip, r7, lsl #1
	add	lr, lr, r7, lsl #1
	add	r5, r5, r7, lsl #1
	add	r10, r10, r7, lsl #1
.L35:
	mov	r1, fp
	add	r7, r4, #3840
	strh	r2, [r4]	@ movhi
	strh	r2, [r7]	@ movhi
	add	r7, r4, #480
	strh	r3, [r7]	@ movhi
	add	r7, r4, #3360
	strh	r3, [r7]	@ movhi
.L32:
	strh	r2, [r1]	@ movhi
	strh	r2, [r1, #2]	@ movhi
	strh	r2, [r1, #16]	@ movhi
	strh	r2, [r1, #18]	@ movhi
	add	r1, r1, #480
	cmp	ip, r1
	bne	.L32
	mov	r1, r8
.L33:
	strh	r3, [r1]	@ movhi
	strh	r3, [r1, #2]	@ movhi
	strh	r3, [r1, #8]	@ movhi
	strh	r3, [r1, #10]	@ movhi
	add	r1, r1, #480
	cmp	lr, r1
	bne	.L33
	mov	r1, r9
.L34:
	strh	r0, [r1]	@ movhi
	strh	r0, [r1, #2]	@ movhi
	add	r1, r1, #480
	cmp	r5, r1
	bne	.L34
	add	r4, r4, #2
	cmp	r10, r4
	bne	.L35
	ldr	r3, [sp, #8]
	ldr	r0, [sp, #4]
	add	r1, r3, #2160
	add	r1, r1, r0
	add	r3, r6, #7680
	add	r6, r6, r1, lsl #1
	ldr	r1, [sp, #12]
	add	r3, r3, #8
	add	r3, r3, r1
.L36:
	strh	r2, [r6]	@ movhi
	strh	r2, [r6, #2]	@ movhi
	add	r6, r6, #480
	cmp	r3, r6
	bne	.L36
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L44:
	.align	2
.L43:
	.word	.LANCHOR0
	.size	drawCrabEyes, .-drawCrabEyes
	.align	2
	.global	drawCrabBody
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawCrabBody, %function
drawCrabBody:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L50
	ldr	r3, [r3]
	rsb	ip, r0, r0, lsl #4
	add	r0, r3, #9664
	add	ip, r1, ip, lsl #4
	add	r0, r0, #6
	add	r3, r3, #9600
	mov	r1, r2
	add	r0, r0, ip, lsl #1
	add	r2, r3, ip, lsl #1
.L46:
	sub	r3, r2, #9600
.L47:
	strh	r1, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r2
	bne	.L47
	add	r2, r3, #2
	cmp	r2, r0
	bne	.L46
	bx	lr
.L51:
	.align	2
.L50:
	.word	.LANCHOR0
	.size	drawCrabBody, .-drawCrabBody
	.align	2
	.global	drawCrabArms
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawCrabArms, %function
drawCrabArms:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	lr, r1
	ldr	r3, .L62
	rsb	r0, r0, r0, lsl #4
	ldr	r5, [r3]
	add	ip, r1, r0, lsl #4
	lsl	r4, r0, #4
	add	ip, r5, ip, lsl #1
	add	r6, r1, #8
.L53:
	mov	r3, ip
	mov	r0, #0
.L54:
	add	r0, r0, #1
	cmp	r0, #3
	strh	r2, [r3]	@ movhi
	strh	r2, [r3, #84]	@ movhi
	add	r3, r3, #480
	bne	.L54
	add	lr, lr, #1
	cmp	r6, lr
	add	ip, ip, #2
	bne	.L53
	sub	r3, r4, #480
	sub	r4, r1, #7
	add	r3, r3, r4
	add	r5, r5, r3, lsl #1
.L55:
	mov	r3, r5
	mov	ip, #0
.L56:
	add	ip, ip, #1
	add	lr, r3, #1920
	add	r0, r3, #2032
	cmp	ip, #3
	strh	r2, [r3]	@ movhi
	strh	r2, [r3, #114]	@ movhi
	strh	r2, [lr]	@ movhi
	add	r3, r3, #480
	strh	r2, [r0, #2]	@ movhi
	bne	.L56
	add	r4, r4, #1
	cmp	r1, r4
	add	r5, r5, #2
	bne	.L55
	pop	{r4, r5, r6, lr}
	bx	lr
.L63:
	.align	2
.L62:
	.word	.LANCHOR0
	.size	drawCrabArms, .-drawCrabArms
	.align	2
	.global	drawCrabLegsR
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawCrabLegsR, %function
drawCrabLegsR:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, #0
	ldr	r3, .L76
	ldr	ip, [r3]
	rsb	lr, r0, r0, lsl #4
	add	r3, r1, lr, lsl #4
	add	r0, ip, #6
	lsl	lr, lr, #4
	add	r0, r0, r3, lsl #1
.L66:
	sub	r3, r0, #6
.L65:
	strh	r2, [r3], #2	@ movhi
	cmp	r3, r0
	bne	.L65
	add	r4, r4, #1
	add	r0, r3, #480
	cmp	r4, #3
	add	r0, r0, #2
	bne	.L66
	add	r4, lr, #720
	add	ip, ip, #12
	add	r1, r4, r1
	add	r1, ip, r1, lsl #1
	add	r0, lr, #1440
.L67:
	sub	r3, r1, #6
.L69:
	strh	r2, [r3], #2	@ movhi
	cmp	r1, r3
	bne	.L69
	add	r4, r4, #240
	cmp	r4, r0
	add	r1, r1, #480
	bne	.L67
	pop	{r4, lr}
	bx	lr
.L77:
	.align	2
.L76:
	.word	.LANCHOR0
	.size	drawCrabLegsR, .-drawCrabLegsR
	.align	2
	.global	drawCrabLegsL
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawCrabLegsL, %function
drawCrabLegsL:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, #0
	ldr	r3, .L90
	ldr	ip, [r3]
	rsb	lr, r0, r0, lsl #4
	add	r3, r1, lr, lsl #4
	add	r0, ip, #6
	lsl	lr, lr, #4
	add	r0, r0, r3, lsl #1
.L80:
	sub	r3, r0, #6
.L79:
	strh	r2, [r3], #2	@ movhi
	cmp	r3, r0
	bne	.L79
	add	r4, r4, #1
	sub	r0, r3, #476
	cmp	r4, #3
	sub	r0, r0, #2
	bne	.L80
	add	r4, lr, #240
	add	ip, ip, #4
	add	r1, r4, r1
	add	r1, ip, r1, lsl #1
	add	r0, lr, #960
.L81:
	sub	r3, r1, #6
.L83:
	strh	r2, [r3], #2	@ movhi
	cmp	r1, r3
	bne	.L83
	add	r4, r4, #240
	cmp	r4, r0
	add	r1, r1, #480
	bne	.L81
	pop	{r4, lr}
	bx	lr
.L91:
	.align	2
.L90:
	.word	.LANCHOR0
	.size	drawCrabLegsL, .-drawCrabLegsL
	.align	2
	.global	drawSmileL
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawSmileL, %function
drawSmileL:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L96
	ldr	r3, [r3]
	rsb	ip, r0, r0, lsl #4
	add	r0, r3, #2400
	add	r1, r1, ip, lsl #4
	add	r0, r0, #10
	add	r0, r0, r1, lsl #1
	add	r1, r3, r1, lsl #1
.L93:
	strh	r2, [r1]	@ movhi
	strh	r2, [r1, #2]	@ movhi
	add	r1, r1, #480
	add	r1, r1, #2
	cmp	r0, r1
	bne	.L93
	bx	lr
.L97:
	.align	2
.L96:
	.word	.LANCHOR0
	.size	drawSmileL, .-drawSmileL
	.align	2
	.global	drawSmileR
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawSmileR, %function
drawSmileR:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L102
	ldr	r3, [r3]
	rsb	ip, r0, r0, lsl #4
	sub	r0, r3, #2384
	add	r1, r1, ip, lsl #4
	sub	r0, r0, #6
	add	r0, r0, r1, lsl #1
	add	r1, r3, r1, lsl #1
.L99:
	strh	r2, [r1]	@ movhi
	strh	r2, [r1, #2]	@ movhi
	sub	r1, r1, #476
	sub	r1, r1, #2
	cmp	r0, r1
	bne	.L99
	bx	lr
.L103:
	.align	2
.L102:
	.word	.LANCHOR0
	.size	drawSmileR, .-drawSmileR
	.align	2
	.global	drawInbetween
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawInbetween, %function
drawInbetween:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L108
	ldr	r3, [r3]
	rsb	r0, r0, r0, lsl #4
	add	r1, r1, r0, lsl #4
	add	r0, r3, #12
	add	r0, r0, r1, lsl #1
	add	r3, r3, r1, lsl #1
.L105:
	strh	r2, [r3]	@ movhi
	add	r1, r3, #480
	add	r3, r3, #2
	cmp	r3, r0
	strh	r2, [r1]	@ movhi
	bne	.L105
	bx	lr
.L109:
	.align	2
.L108:
	.word	.LANCHOR0
	.size	drawInbetween, .-drawInbetween
	.align	2
	.global	drawExtendedArmsL
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawExtendedArmsL, %function
drawExtendedArmsL:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	lr, r1
	ldr	r3, .L122
	ldr	ip, [r3]
	rsb	r4, r0, r0, lsl #4
	add	r3, r1, r4, lsl #4
	add	r0, ip, #6
	lsl	r4, r4, #4
	add	r0, r0, r3, lsl #1
	add	r5, r1, #8
.L112:
	sub	r3, r0, #6
.L111:
	strh	r2, [r3], #2	@ movhi
	cmp	r3, r0
	bne	.L111
	add	lr, lr, #1
	add	r0, r3, #480
	cmp	lr, r5
	add	r0, r0, #2
	bne	.L112
	sub	r0, r4, #1680
	add	ip, ip, #2
	add	r1, r0, r1
	add	r1, ip, r1, lsl #1
.L113:
	sub	r3, r1, #6
.L115:
	strh	r2, [r3]	@ movhi
	strh	r2, [r3, #8]	@ movhi
	add	r3, r3, #2
	cmp	r1, r3
	bne	.L115
	add	r0, r0, #240
	cmp	r4, r0
	add	r1, r1, #480
	bne	.L113
	pop	{r4, r5, lr}
	bx	lr
.L123:
	.align	2
.L122:
	.word	.LANCHOR0
	.size	drawExtendedArmsL, .-drawExtendedArmsL
	.align	2
	.global	drawExtendedArmsR
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawExtendedArmsR, %function
drawExtendedArmsR:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	lr, r1
	ldr	r3, .L136
	ldr	ip, [r3]
	rsb	r4, r0, r0, lsl #4
	add	r3, r1, r4, lsl #4
	add	r0, ip, #6
	lsl	r4, r4, #4
	add	r0, r0, r3, lsl #1
	add	r5, r1, #8
.L126:
	sub	r3, r0, #6
.L125:
	strh	r2, [r3], #2	@ movhi
	cmp	r3, r0
	bne	.L125
	add	lr, lr, #1
	sub	r0, r3, #476
	cmp	lr, r5
	sub	r0, r0, #2
	bne	.L126
	sub	r0, r4, #3360
	add	ip, ip, #16
	add	r1, r0, r1
	add	r1, ip, r1, lsl #1
	sub	ip, r4, #1680
.L127:
	sub	r3, r1, #6
.L129:
	strh	r2, [r3]	@ movhi
	strh	r2, [r3, #8]	@ movhi
	add	r3, r3, #2
	cmp	r1, r3
	bne	.L129
	add	r0, r0, #240
	cmp	ip, r0
	add	r1, r1, #480
	bne	.L127
	pop	{r4, r5, lr}
	bx	lr
.L137:
	.align	2
.L136:
	.word	.LANCHOR0
	.size	drawExtendedArmsR, .-drawExtendedArmsR
	.align	2
	.global	drawExtendedLegsL
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawExtendedLegsL, %function
drawExtendedLegsL:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, #0
	ldr	r3, .L148
	ldr	r3, [r3]
	rsb	r0, r0, r0, lsl #4
	add	r1, r1, r0, lsl #4
	add	r3, r3, #6
	add	r1, r3, r1, lsl #1
.L140:
	sub	r3, r1, #6
.L139:
	strh	r2, [r3], #2	@ movhi
	cmp	r3, r1
	bne	.L139
	add	ip, ip, #1
	sub	r1, r3, #476
	cmp	ip, #8
	sub	r1, r1, #2
	bne	.L140
	bx	lr
.L149:
	.align	2
.L148:
	.word	.LANCHOR0
	.size	drawExtendedLegsL, .-drawExtendedLegsL
	.align	2
	.global	drawExtendedLegsR
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawExtendedLegsR, %function
drawExtendedLegsR:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, #0
	ldr	r3, .L160
	ldr	r3, [r3]
	rsb	r0, r0, r0, lsl #4
	add	r1, r1, r0, lsl #4
	add	r3, r3, #6
	add	r1, r3, r1, lsl #1
.L152:
	sub	r3, r1, #6
.L151:
	strh	r2, [r3], #2	@ movhi
	cmp	r3, r1
	bne	.L151
	add	ip, ip, #1
	add	r1, r3, #480
	cmp	ip, #8
	add	r1, r1, #2
	bne	.L152
	bx	lr
.L161:
	.align	2
.L160:
	.word	.LANCHOR0
	.size	drawExtendedLegsR, .-drawExtendedLegsR
	.align	2
	.global	drawSurprise
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawSurprise, %function
drawSurprise:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, r1
	str	lr, [sp, #-4]!
	ldr	lr, .L168
	rsb	r3, r0, r0, lsl #4
	ldr	r0, [lr]
	add	r1, r1, r3, lsl #4
	add	r0, r0, r1, lsl #1
	add	lr, ip, #3
.L163:
	mov	r1, r0
	mov	r3, #0
.L164:
	add	r3, r3, #1
	cmp	r3, #3
	strh	r2, [r1]	@ movhi
	add	r1, r1, #480
	bne	.L164
	add	ip, ip, #1
	cmp	ip, lr
	add	r0, r0, #2
	bne	.L163
	ldr	lr, [sp], #4
	bx	lr
.L169:
	.align	2
.L168:
	.word	.LANCHOR0
	.size	drawSurprise, .-drawSurprise
	.align	2
	.global	firstFrame
	.syntax unified
	.arm
	.fpu softvfp
	.type	firstFrame, %function
firstFrame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r5, #0
	sub	sp, sp, #12
	mov	r2, #31
	mov	r1, #100
	mov	r0, #40
	ldr	r3, .L188
	str	r5, [sp]
	bl	drawCrabEyes
	mov	r2, #31
	mov	r1, #113
	mov	r0, #40
	str	r5, [sp]
	ldr	r3, .L188
	bl	drawCrabEyes
	mov	r1, #31
	ldr	r4, .L188+4
	ldr	r0, [r4]
	add	r0, r0, #36608
	add	r2, r0, #60
	add	r0, r0, #130
.L171:
	sub	r3, r2, #9600
.L172:
	strh	r1, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r2, r3
	bne	.L172
	add	r2, r2, #2
	cmp	r0, r2
	bne	.L171
	mov	r2, #31
	mov	r1, #85
	mov	r0, #50
	bl	drawExtendedArmsL
	mov	r2, #31
	mov	r1, #128
	mov	r0, #57
	bl	drawExtendedArmsR
	mov	r1, #31
	ldr	r0, [r4]
	add	r3, r0, #39936
	add	ip, r0, #36096
	add	r2, r3, #100
	add	lr, ip, #116
.L174:
	strh	r1, [r2]	@ movhi
	strh	r1, [r2, #2]	@ movhi
	strh	r1, [r2, #4]	@ movhi
	sub	r2, r2, #476
	sub	r2, r2, #2
	cmp	r2, lr
	bne	.L174
	mov	r1, #31
	add	r2, r3, #88
	add	lr, ip, #104
.L175:
	strh	r1, [r2]	@ movhi
	strh	r1, [r2, #2]	@ movhi
	strh	r1, [r2, #4]	@ movhi
	sub	r2, r2, #476
	sub	r2, r2, #2
	cmp	lr, r2
	bne	.L175
	mov	r2, #31
	add	r3, r3, #76
	add	r1, ip, #92
.L176:
	strh	r2, [r3]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	strh	r2, [r3, #4]	@ movhi
	sub	r3, r3, #476
	sub	r3, r3, #2
	cmp	r3, r1
	bne	.L176
	mov	r1, #31
	add	r3, r0, #36608
	add	ip, r0, #40448
	add	r2, r3, #126
	add	lr, ip, #142
.L177:
	strh	r1, [r2]	@ movhi
	strh	r1, [r2, #2]	@ movhi
	strh	r1, [r2, #4]	@ movhi
	add	r2, r2, #480
	add	r2, r2, #2
	cmp	lr, r2
	bne	.L177
	mov	r1, #31
	add	r2, r3, #114
	add	lr, ip, #130
.L178:
	strh	r1, [r2]	@ movhi
	strh	r1, [r2, #2]	@ movhi
	strh	r1, [r2, #4]	@ movhi
	add	r2, r2, #480
	add	r2, r2, #2
	cmp	r2, lr
	bne	.L178
	mov	r2, #31
	add	r3, r3, #102
	add	r1, ip, #118
.L179:
	strh	r2, [r3]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	strh	r2, [r3, #4]	@ movhi
	add	r3, r3, #480
	add	r3, r3, #2
	cmp	r3, r1
	bne	.L179
	mov	r5, #1
	mov	r3, #0
	ldr	r4, .L188+8
	add	r2, r0, #32768
	add	lr, r2, #1040
	add	ip, r2, #1520
	add	r1, r2, #2000
	str	r5, [r4]
	add	r0, r0, #34304
	add	r4, r2, #1056
	add	r2, r2, #2016
	strh	r3, [lr, #12]	@ movhi
	strh	r3, [ip, #12]	@ movhi
	strh	r3, [r1, #12]	@ movhi
	strh	r3, [lr, #14]	@ movhi
	strh	r3, [ip, #14]	@ movhi
	strh	r3, [r1, #14]	@ movhi
	strh	r3, [r4]	@ movhi
	strh	r3, [r0]	@ movhi
	strh	r3, [r2]	@ movhi
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L189:
	.align	2
.L188:
	.word	32767
	.word	.LANCHOR0
	.word	currScreen
	.size	firstFrame, .-firstFrame
	.align	2
	.global	secondFrame
	.syntax unified
	.arm
	.fpu softvfp
	.type	secondFrame, %function
secondFrame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r5, #0
	sub	sp, sp, #12
	mov	r2, #31
	mov	r1, #100
	mov	r0, #76
	ldr	r3, .L198
	str	r5, [sp]
	bl	drawCrabEyes
	mov	r2, #31
	mov	r1, #113
	mov	r0, #76
	str	r5, [sp]
	ldr	r3, .L198
	bl	drawCrabEyes
	mov	r1, #31
	ldr	r4, .L198+4
	ldr	r0, [r4]
	add	r2, r0, #53760
	add	r0, r0, #54016
	add	r2, r2, #188
	add	r0, r0, #2
.L191:
	sub	r3, r2, #9600
.L192:
	strh	r1, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r2, r3
	bne	.L192
	add	r2, r2, #2
	cmp	r0, r2
	bne	.L191
	mov	r2, #31
	mov	r1, #86
	mov	r0, #98
	bl	drawCrabArms
	mov	r2, #31
	mov	r1, #126
	mov	r0, #112
	bl	drawCrabLegsR
	mov	r2, #31
	mov	r1, #128
	mov	r0, #107
	bl	drawCrabLegsR
	mov	r2, #31
	mov	r1, #128
	mov	r0, #102
	bl	drawCrabLegsR
	mov	r2, #31
	mov	r1, #92
	mov	r0, #114
	bl	drawCrabLegsL
	mov	r2, #31
	mov	r1, #90
	mov	r0, #109
	bl	drawCrabLegsL
	mov	r2, #31
	mov	r1, #90
	mov	r0, #104
	bl	drawCrabLegsL
	mov	r3, #0
	ldr	r0, [r4]
	add	r1, r0, #45056
	add	ip, r0, #49152
	add	lr, r1, #3136
	strh	r3, [lr, #12]	@ movhi
	add	r5, r1, #3616
	strh	r3, [lr, #14]	@ movhi
	add	r4, r1, #3632
	add	lr, ip, #496
	strh	r3, [r5, #14]	@ movhi
	strh	r3, [r4]	@ movhi
	strh	r3, [ip, #16]	@ movhi
	add	r4, ip, #500
	strh	r3, [ip, #18]	@ movhi
	strh	r3, [lr, #2]	@ movhi
	add	lr, ip, #980
	strh	r3, [r4]	@ movhi
	strh	r3, [lr]	@ movhi
	strh	r3, [lr, #2]	@ movhi
	add	lr, ip, #996
	strh	r3, [lr]	@ movhi
	add	r0, r0, #49920
	strh	r3, [lr, #2]	@ movhi
	add	r5, ip, #516
	add	lr, r1, #3648
	add	r4, ip, #520
	add	r1, r1, #3168
	strh	r3, [r5, #2]	@ movhi
	mov	r2, r3
	strh	r3, [r4]	@ movhi
	strh	r3, [ip, #40]	@ movhi
	strh	r3, [ip, #42]	@ movhi
	strh	r3, [lr, #10]	@ movhi
	strh	r3, [lr, #12]	@ movhi
	strh	r3, [r1, #12]	@ movhi
	strh	r3, [r1, #14]	@ movhi
	add	r3, r0, #216
	add	r0, r0, #228
.L194:
	strh	r2, [r3]	@ movhi
	add	r1, r3, #480
	add	r3, r3, #2
	cmp	r0, r3
	strh	r2, [r1]	@ movhi
	bne	.L194
	mov	r2, #2
	ldr	r3, .L198+8
	str	r2, [r3]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L199:
	.align	2
.L198:
	.word	32767
	.word	.LANCHOR0
	.word	currScreen
	.size	secondFrame, .-secondFrame
	.align	2
	.global	thirdFrame
	.syntax unified
	.arm
	.fpu softvfp
	.type	thirdFrame, %function
thirdFrame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r5, #0
	sub	sp, sp, #12
	mov	r2, #31
	mov	r1, #145
	mov	r0, #86
	ldr	r3, .L206
	str	r5, [sp]
	bl	drawCrabEyes
	mov	r2, #31
	mov	r1, #158
	mov	r0, #86
	str	r5, [sp]
	ldr	r3, .L206
	bl	drawCrabEyes
	mov	r1, #31
	ldr	r4, .L206+4
	ldr	r0, [r4]
	add	r2, r0, #58624
	add	r0, r0, #58880
	add	r2, r2, #226
	add	r0, r0, #40
.L201:
	sub	r3, r2, #9600
.L202:
	strh	r1, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r2, r3
	bne	.L202
	add	r2, r2, #2
	cmp	r0, r2
	bne	.L201
	mov	r2, #31
	mov	r1, #137
	mov	r0, #108
	bl	drawCrabArms
	mov	r2, #31
	mov	r1, #177
	mov	r0, #122
	bl	drawCrabLegsR
	mov	r2, #31
	mov	r1, #179
	mov	r0, #117
	bl	drawCrabLegsR
	mov	r2, #31
	mov	r1, #179
	mov	r0, #112
	bl	drawCrabLegsR
	mov	r2, #31
	mov	r1, #143
	mov	r0, #124
	bl	drawCrabLegsL
	mov	r2, #31
	mov	r1, #141
	mov	r0, #119
	bl	drawCrabLegsL
	mov	r2, #31
	mov	r1, #141
	mov	r0, #114
	bl	drawCrabLegsL
	mov	r2, #0
	mov	lr, #3
	ldr	r3, [r4]
	ldr	ip, .L206+8
	add	r3, r3, #53248
	add	r0, r3, #1296
	add	r1, r3, #1776
	add	r3, r3, #2256
	strh	r2, [r0]	@ movhi
	str	lr, [ip]
	strh	r2, [r1]	@ movhi
	strh	r2, [r3]	@ movhi
	strh	r2, [r0, #2]	@ movhi
	strh	r2, [r1, #2]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	strh	r2, [r0, #4]	@ movhi
	strh	r2, [r1, #4]	@ movhi
	strh	r2, [r3, #4]	@ movhi
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L207:
	.align	2
.L206:
	.word	32767
	.word	.LANCHOR0
	.word	currScreen
	.size	thirdFrame, .-thirdFrame
	.align	2
	.global	fourthFrame
	.syntax unified
	.arm
	.fpu softvfp
	.type	fourthFrame, %function
fourthFrame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r5, #0
	sub	sp, sp, #12
	mov	r2, #31
	mov	r1, #60
	mov	r0, #106
	ldr	r3, .L214
	str	r5, [sp]
	bl	drawCrabEyes
	mov	r2, #31
	mov	r1, #73
	mov	r0, #106
	ldr	r3, .L214
	str	r5, [sp]
	bl	drawCrabEyes
	mov	r1, #31
	ldr	r4, .L214+4
	ldr	r3, [r4]
	ldr	r0, .L214+8
	add	r2, r3, #67584
	add	r2, r2, #672
	add	r0, r3, r0
.L209:
	sub	r3, r2, #9600
.L210:
	strh	r1, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r2, r3
	bne	.L210
	add	r2, r2, #2
	cmp	r0, r2
	bne	.L209
	mov	r2, #31
	mov	r1, #40
	mov	r0, #128
	bl	drawCrabArms
	mov	r2, #31
	mov	r1, #80
	mov	r0, #142
	bl	drawCrabLegsR
	mov	r2, #31
	mov	r1, #82
	mov	r0, #137
	bl	drawCrabLegsR
	mov	r2, #31
	mov	r1, #82
	mov	r0, #132
	bl	drawCrabLegsR
	mov	r2, #31
	mov	r1, #46
	mov	r0, #144
	bl	drawCrabLegsL
	mov	r2, #31
	mov	r1, #44
	mov	r0, #139
	bl	drawCrabLegsL
	mov	r2, #31
	mov	r1, #44
	mov	r0, #134
	bl	drawCrabLegsL
	mov	r2, #0
	mov	lr, #4
	ldr	r3, [r4]
	ldr	ip, .L214+12
	add	r3, r3, #61440
	add	r0, r3, #2544
	add	r1, r3, #3024
	add	r3, r3, #3504
	strh	r2, [r0, #4]	@ movhi
	str	lr, [ip]
	strh	r2, [r1, #4]	@ movhi
	strh	r2, [r3, #4]	@ movhi
	strh	r2, [r0, #6]	@ movhi
	strh	r2, [r1, #6]	@ movhi
	strh	r2, [r3, #6]	@ movhi
	strh	r2, [r0, #8]	@ movhi
	strh	r2, [r1, #8]	@ movhi
	strh	r2, [r3, #8]	@ movhi
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L215:
	.align	2
.L214:
	.word	32767
	.word	.LANCHOR0
	.word	68326
	.word	currScreen
	.size	fourthFrame, .-fourthFrame
	.align	2
	.global	waitForVBlank
	.syntax unified
	.arm
	.fpu softvfp
	.type	waitForVBlank, %function
waitForVBlank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
.L217:
	ldrh	r3, [r2, #6]
	cmp	r3, #160
	bhi	.L217
	mov	r2, #67108864
.L218:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L218
	bx	lr
	.size	waitForVBlank, .-waitForVBlank
	.global	videoBuffer
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.ident	"GCC: (devkitARM release 53) 9.1.0"
