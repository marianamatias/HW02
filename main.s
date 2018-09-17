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
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	random
	.syntax unified
	.arm
	.fpu softvfp
	.type	random, %function
random:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r5, r0
	mov	r4, r1
	ldr	r3, .L4
	mov	lr, pc
	bx	r3
	sub	r1, r4, r5
	add	r1, r1, #1
	ldr	r3, .L4+4
	mov	lr, pc
	bx	r3
	add	r0, r1, r5
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	rand
	.word	__aeabi_idivmod
	.size	random, .-random
	.align	2
	.global	initBall
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBall, %function
initBall:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r5, #0
	ldr	r3, .L8
	str	r5, [r0]
	mov	r4, r0
	mov	lr, pc
	bx	r3
	mov	r2, #1
	mov	ip, #5
	mvn	r1, #64512
	ldr	r3, .L8+4
	smull	r6, r7, r0, r3
	asr	r3, r0, #31
	rsb	r3, r3, r7, asr #4
	rsb	lr, r3, r3, lsl #4
	add	r3, r3, lr, lsl #4
	sub	r3, r0, r3
	str	r5, [r4, #20]
	str	r5, [r4, #24]
	str	r5, [r4, #32]
	str	r5, [r4, #36]
	stmib	r4, {r3, ip}
	strh	r1, [r4, #28]	@ movhi
	str	r2, [r4, #12]
	str	r2, [r4, #16]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	rand
	.word	285143057
	.size	initBall, .-initBall
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #67108864
	mov	r3, #0
	ldr	r2, .L12
	ldr	r0, .L12+4
	push	{r4, lr}
	ldrh	lr, [r2, #48]
	ldr	r2, .L12+8
	strh	r0, [r1]	@ movhi
	ldr	ip, .L12+12
	ldr	r1, .L12+16
	mov	r0, r3
	strh	lr, [r2]	@ movhi
	ldr	r2, .L12+20
	strh	r3, [ip]	@ movhi
	strh	r3, [r1]	@ movhi
	mov	lr, pc
	bx	r2
	mov	r3, #120
	mov	r2, #1
	mov	ip, #20
	mov	r1, #5
	ldr	lr, .L12+24
	ldr	r0, .L12+28
	str	r3, [lr]
	str	r3, [r0]
	ldr	lr, .L12+32
	ldr	r0, .L12+36
	str	r3, [lr]
	str	r3, [r0]
	ldr	r4, .L12+40
	ldr	lr, .L12+44
	ldr	r0, .L12+48
	ldr	r3, .L12+52
	str	r2, [r4]
	str	r2, [lr]
	str	ip, [r0]
	str	r1, [r3]
	pop	{r4, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	67109120
	.word	1027
	.word	buttons
	.word	oldButtons
	.word	bgColor
	.word	fillScreen
	.word	bRow
	.word	bCol
	.word	bOldRow
	.word	bOldCol
	.word	bRDel
	.word	bCDel
	.word	bHeight
	.word	bWidth
	.size	initialize, .-initialize
	.align	2
	.global	updateBall
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBall, %function
updateBall:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r4, r0
	ldr	r0, [r0]
	cmp	r0, #0
	sub	sp, sp, #20
	ldr	r3, [r4, #8]
	ble	.L15
	add	r2, r0, r3
	cmp	r2, #159
	ldrle	r2, [r4, #16]
	addle	r0, r0, r2
.L15:
	add	r0, r0, #1
	cmp	r0, #160
	movgt	r2, #0
	ldr	r1, .L22
	strgt	r2, [r4, #32]
	ldr	r1, [r1]
	ldr	lr, .L22+4
	ldr	ip, .L22+8
	ldr	r2, .L22+12
	str	r0, [r4]
	ldr	r2, [r2]
	ldr	lr, [lr]
	ldr	ip, [ip]
	str	r1, [sp, #12]
	ldr	r5, .L22+16
	ldr	r1, [r4, #4]
	stm	sp, {r2, ip, lr}
	mov	r2, r3
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L14
	mov	r1, #0
	ldr	r2, .L22+20
	ldr	r3, [r2]
	add	r3, r3, #1
	str	r3, [r2]
	str	r1, [r4, #32]
.L14:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L23:
	.align	2
.L22:
	.word	bWidth
	.word	bHeight
	.word	bCol
	.word	bRow
	.word	collision
	.word	.LANCHOR0
	.size	updateBall, .-updateBall
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
	push	{r4, r5, r6, r8, r9, lr}
	ldr	r4, .L40
	mov	r3, #0
	mov	r6, r4
	mov	r2, r4
.L27:
	ldr	r5, [r2, #32]
	cmp	r5, #0
	beq	.L38
	add	r3, r3, #1
	cmp	r3, #5
	add	r2, r2, #40
	bne	.L27
.L26:
	ldr	r3, .L40+4
	ldrh	r3, [r3, #48]
	tst	r3, #32
	ldreq	r2, .L40+8
	ldreq	r3, [r2]
	subeq	r3, r3, #1
	streq	r3, [r2]
	ldr	r3, .L40+4
	ldrh	r3, [r3, #48]
	tst	r3, #16
	ldreq	r2, .L40+8
	ldreq	r3, [r2]
	addeq	r3, r3, #1
	streq	r3, [r2]
	ldr	r5, .L40+12
.L31:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	bne	.L39
.L30:
	add	r4, r4, #40
	cmp	r4, r5
	bne	.L31
	pop	{r4, r5, r6, r8, r9, lr}
	bx	lr
.L39:
	mov	r0, r4
	bl	updateBall
	b	.L30
.L38:
	add	r3, r3, r3, lsl #2
	lsl	r3, r3, #3
	str	r5, [r6, r3]
	ldr	r2, .L40+16
	add	r6, r6, r3
	mov	lr, pc
	bx	r2
	mov	r2, #1
	mov	ip, #5
	mvn	r1, #64512
	ldr	r3, .L40+20
	smull	r8, r9, r0, r3
	asr	r3, r0, #31
	rsb	r3, r3, r9, asr #4
	rsb	lr, r3, r3, lsl #4
	add	r3, r3, lr, lsl #4
	sub	r3, r0, r3
	str	r5, [r6, #20]
	str	r5, [r6, #24]
	str	r5, [r6, #36]
	stmib	r6, {r3, ip}
	strh	r1, [r6, #28]	@ movhi
	str	r2, [r6, #12]
	str	r2, [r6, #16]
	str	r2, [r6, #32]
	b	.L26
.L41:
	.align	2
.L40:
	.word	balls
	.word	67109120
	.word	bCol
	.word	balls+200
	.word	rand
	.word	285143057
	.size	update, .-update
	.align	2
	.global	eraseBall
	.syntax unified
	.arm
	.fpu softvfp
	.type	eraseBall, %function
eraseBall:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r2, .L44
	ldm	r0, {r0, r1, r3}
	ldrh	ip, [r2]
	sub	sp, sp, #8
	mov	r2, r3
	str	ip, [sp]
	ldr	r4, .L44+4
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L45:
	.align	2
.L44:
	.word	bgColor
	.word	drawRect
	.size	eraseBall, .-eraseBall
	.align	2
	.global	drawBall
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBall, %function
drawBall:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r4, r0
	ldr	r6, .L52
	ldr	r3, [r0, #8]
	ldrh	ip, [r6]
	sub	sp, sp, #8
	add	r0, r0, #20
	ldm	r0, {r0, r1}
	mov	r2, r3
	str	ip, [sp]
	ldr	r5, .L52+4
	mov	lr, pc
	bx	r5
	ldr	r3, [r4, #32]
	cmp	r3, #0
	bne	.L50
	ldr	r3, [r4, #36]
	cmp	r3, #0
	ldm	r4, {r0, r1, r3}
	beq	.L51
.L48:
	ldrh	r2, [r4, #28]
	str	r2, [sp]
	mov	r2, r3
	mov	lr, pc
	bx	r5
	ldm	r4, {r2, r3}
	str	r2, [r4, #20]
	str	r3, [r4, #24]
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L50:
	ldm	r4, {r0, r1, r3}
	b	.L48
.L51:
	ldrh	r2, [r6]
	str	r2, [sp]
	mov	r2, r3
	mov	lr, pc
	bx	r5
	mov	r3, #1
	ldr	r0, [r4]
	str	r3, [r4, #36]
	ldmib	r4, {r1, r3}
	b	.L48
.L53:
	.align	2
.L52:
	.word	bgColor
	.word	drawRect
	.size	drawBall, .-drawBall
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
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	ip, .L56
	ldr	r10, .L56+4
	ldr	r4, .L56+8
	ldr	r5, .L56+12
	ldr	r6, .L56+16
	ldrh	ip, [ip]
	sub	sp, sp, #8
	ldr	r2, [r4]
	ldr	r3, [r10]
	ldr	r1, [r5]
	ldr	r0, [r6]
	str	ip, [sp]
	ldr	r9, .L56+20
	mov	lr, pc
	bx	r9
	ldr	r7, .L56+24
	ldr	ip, .L56+28
	ldr	r8, .L56+32
	ldr	r1, [r7]
	ldr	r2, [r4]
	ldr	r3, [r10]
	str	ip, [sp]
	ldr	r4, .L56+36
	ldr	r0, [r8]
	mov	lr, pc
	bx	r9
	ldr	r2, [r8]
	ldr	r3, [r7]
	mov	r0, r4
	str	r2, [r6]
	str	r3, [r5]
	bl	drawBall
	add	r0, r4, #40
	bl	drawBall
	add	r0, r4, #80
	bl	drawBall
	add	r0, r4, #120
	bl	drawBall
	add	r0, r4, #160
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	b	drawBall
.L57:
	.align	2
.L56:
	.word	bgColor
	.word	bWidth
	.word	bHeight
	.word	bOldCol
	.word	bOldRow
	.word	drawRect
	.word	bCol
	.word	32767
	.word	bRow
	.word	balls
	.size	draw, .-draw
	.align	2
	.global	winState
	.syntax unified
	.arm
	.fpu softvfp
	.type	winState, %function
winState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r5, .L60
	sub	sp, sp, #12
	ldr	r0, .L60+4
	ldr	r3, .L60+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L60+12
	str	r5, [sp]
	mov	r3, #75
	mov	r2, #30
	mov	r1, #100
	mov	r0, #25
	mov	lr, pc
	bx	r4
	str	r5, [sp]
	mov	r3, #20
	mov	r2, #30
	mov	r1, #100
	mov	r0, #120
	mov	lr, pc
	bx	r4
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L61:
	.align	2
.L60:
	.word	1023
	.word	32767
	.word	fillScreen
	.word	drawRect
	.size	winState, .-winState
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r3, .L66
	mov	lr, pc
	bx	r3
	ldr	r9, .L66+4
	ldr	r4, .L66+8
	ldr	r8, .L66+12
	ldr	r7, .L66+16
	ldr	r6, .L66+20
	ldr	r10, .L66+24
	ldr	r5, .L66+28
.L63:
	ldrh	r3, [r4]
	strh	r3, [r9]	@ movhi
	ldrh	r3, [r5, #48]
	strh	r3, [r4]	@ movhi
	mov	lr, pc
	bx	r8
	mov	lr, pc
	bx	r7
	mov	lr, pc
	bx	r6
	ldr	r3, [r10]
	cmp	r3, #0
	ble	.L63
	ldr	r3, .L66+32
	mov	lr, pc
	bx	r3
	mov	r0, #0
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L67:
	.align	2
.L66:
	.word	initialize
	.word	oldButtons
	.word	buttons
	.word	update
	.word	waitForVBlank
	.word	draw
	.word	.LANCHOR0
	.word	67109120
	.word	winState
	.size	main, .-main
	.global	count
	.comm	ballColor,2,2
	.comm	balls,200,4
	.comm	bWidth,4,4
	.comm	bHeight,4,4
	.comm	bCDel,4,4
	.comm	bRDel,4,4
	.comm	bOldCol,4,4
	.comm	bOldRow,4,4
	.comm	bCol,4,4
	.comm	bRow,4,4
	.comm	bgColor,2,2
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	count, %object
	.size	count, 4
count:
	.space	4
	.ident	"GCC: (devkitARM release 47) 7.1.0"
