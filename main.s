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
	add	r0, r0, #1
	cmp	r0, #160
	movgt	r3, #0
	ldr	r1, .L21
	strgt	r3, [r4, #32]
	ldr	r1, [r1]
	ldr	ip, .L21+4
	ldr	r2, .L21+8
	ldr	r3, .L21+12
	sub	sp, sp, #20
	ldr	lr, [ip]
	str	r0, [r4]
	ldr	ip, [r2]
	ldr	r2, [r3]
	ldr	r3, [r4, #8]
	str	r1, [sp, #12]
	ldr	r5, .L21+16
	ldr	r1, [r4, #4]
	stm	sp, {r2, ip, lr}
	mov	r2, r3
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	movne	r3, #0
	strne	r3, [r4, #32]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L22:
	.align	2
.L21:
	.word	bWidth
	.word	bHeight
	.word	bCol
	.word	bRow
	.word	collision
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
	ldr	r4, .L39
	mov	r3, #0
	mov	r6, r4
	mov	r2, r4
.L26:
	ldr	r5, [r2, #32]
	cmp	r5, #0
	beq	.L37
	add	r3, r3, #1
	cmp	r3, #5
	add	r2, r2, #40
	bne	.L26
.L25:
	ldr	r3, .L39+4
	ldrh	r3, [r3, #48]
	tst	r3, #32
	ldreq	r2, .L39+8
	ldreq	r3, [r2]
	subeq	r3, r3, #1
	streq	r3, [r2]
	ldr	r3, .L39+4
	ldrh	r3, [r3, #48]
	tst	r3, #16
	ldreq	r2, .L39+8
	ldreq	r3, [r2]
	addeq	r3, r3, #1
	streq	r3, [r2]
	ldr	r5, .L39+12
.L30:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	bne	.L38
.L29:
	add	r4, r4, #40
	cmp	r4, r5
	bne	.L30
	pop	{r4, r5, r6, r8, r9, lr}
	bx	lr
.L38:
	mov	r0, r4
	bl	updateBall
	b	.L29
.L37:
	add	r3, r3, r3, lsl #2
	lsl	r3, r3, #3
	str	r5, [r6, r3]
	ldr	r2, .L39+16
	add	r6, r6, r3
	mov	lr, pc
	bx	r2
	mov	r2, #1
	mov	ip, #5
	mvn	r1, #64512
	ldr	r3, .L39+20
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
	b	.L25
.L40:
	.align	2
.L39:
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
	ldr	r2, .L43
	ldm	r0, {r0, r1, r3}
	ldrh	ip, [r2]
	sub	sp, sp, #8
	mov	r2, r3
	str	ip, [sp]
	ldr	r4, .L43+4
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L44:
	.align	2
.L43:
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
	push	{r4, r5, lr}
	mov	r4, r0
	ldr	r2, .L47
	ldr	r3, [r0, #8]
	ldrh	ip, [r2]
	sub	sp, sp, #12
	add	r0, r0, #20
	ldm	r0, {r0, r1}
	mov	r2, r3
	str	ip, [sp]
	ldr	r5, .L47+4
	mov	lr, pc
	bx	r5
	ldm	r4, {r0, r1, r3}
	ldrh	ip, [r4, #28]
	mov	r2, r3
	str	ip, [sp]
	mov	lr, pc
	bx	r5
	ldm	r4, {r2, r3}
	str	r2, [r4, #20]
	str	r3, [r4, #24]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L48:
	.align	2
.L47:
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
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	fp, .L58
	ldr	r5, .L58+4
	ldrh	ip, [fp]
	ldr	r10, .L58+8
	ldr	r9, .L58+12
	ldr	r6, .L58+16
	sub	sp, sp, #12
	ldr	r1, [r5]
	ldr	r3, [r10]
	ldr	r2, [r9]
	ldr	r0, [r6]
	str	ip, [sp]
	ldr	r4, .L58+20
	mov	lr, pc
	bx	r4
	ldr	r7, .L58+24
	ldr	r8, .L58+28
	ldr	ip, .L58+32
	ldr	r1, [r7]
	ldr	r3, [r10]
	ldr	r2, [r9]
	ldr	r0, [r8]
	str	ip, [sp]
	mov	lr, pc
	bx	r4
	ldr	r2, [r8]
	ldr	r3, [r7]
	ldr	r7, .L58+36
	str	r2, [r6]
	str	r3, [r5]
	add	r5, r7, #200
.L55:
	ldr	r3, [r7, #32]
	cmp	r3, #0
	beq	.L50
.L53:
	mov	r0, r7
	bl	drawBall
.L51:
	add	r7, r7, #40
	cmp	r7, r5
	bne	.L55
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L50:
	ldr	r3, [r7, #36]
	cmp	r3, #0
	bne	.L51
	ldm	r7, {r0, r1, r3}
	ldrh	ip, [fp]
	mov	r2, r3
	str	ip, [sp]
	mov	lr, pc
	bx	r4
	ldr	r3, [r7, #32]
	cmp	r3, #0
	mov	r3, #1
	str	r3, [r7, #36]
	beq	.L51
	b	.L53
.L59:
	.align	2
.L58:
	.word	bgColor
	.word	bOldCol
	.word	bWidth
	.word	bHeight
	.word	bOldRow
	.word	drawRect
	.word	bCol
	.word	bRow
	.word	32767
	.word	balls
	.size	draw, .-draw
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
	push	{r7, lr}
	ldr	r3, .L63
	mov	lr, pc
	bx	r3
	ldr	r9, .L63+4
	ldr	r4, .L63+8
	ldr	r8, .L63+12
	ldr	r7, .L63+16
	ldr	r6, .L63+20
	ldr	r5, .L63+24
.L61:
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
	b	.L61
.L64:
	.align	2
.L63:
	.word	initialize
	.word	oldButtons
	.word	buttons
	.word	update
	.word	waitForVBlank
	.word	draw
	.word	67109120
	.size	main, .-main
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
	.ident	"GCC: (devkitARM release 47) 7.1.0"
