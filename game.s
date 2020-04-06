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
	.file	"game.c"
	.text
	.align	2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGran.part.0, %function
drawGran.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, .L3
	ldr	r3, [r0, #4]
	ldrb	r1, [r0]	@ zero_extendqisi2
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #18
	mvn	r1, r1, lsl #17
	mvn	r3, r3, lsr #18
	mvn	r1, r1, lsr #17
	ldr	ip, [r0, #40]
	ldr	r2, [r0, #48]
	ldr	r0, .L3+4
	add	r2, r2, ip, lsl #6
	lsl	r2, r2, #2
	strh	r3, [r0, #2]	@ movhi
	strh	r1, [r0]	@ movhi
	strh	r2, [r0, #4]	@ movhi
	bx	lr
.L4:
	.align	2
.L3:
	.word	gran
	.word	shadowOAM
	.size	drawGran.part.0, .-drawGran.part.0
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateFoods.part.0, %function
updateFoods.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	ldr	r3, [r0, #8]
	ldr	r1, [r0, #16]
	ldr	r2, [r0, #12]
	add	r3, r3, r1
	cmp	r2, #0
	mov	r4, r0
	str	r3, [r0, #8]
	sub	sp, sp, #20
	bne	.L6
	ldr	r5, .L15
	ldr	r6, [r5, #28]
	cmp	r6, #0
	beq	.L14
.L7:
	ldr	r2, .L15+4
	ldr	r2, [r2]
	sub	r3, r3, r2
	cmp	r3, #240
	str	r3, [r4, #4]
	movhi	r3, #0
	strhi	r3, [r4, #32]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L6:
	cmp	r2, #1
	bne	.L7
	ldr	r5, .L15
	ldr	r2, [r5, #28]
	cmp	r2, #1
	bne	.L7
	add	r0, r5, #20
	ldm	r0, {r0, r1}
	ldm	r5, {r2, r3}
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldr	r6, .L15+8
	ldr	r3, [r4, #24]
	ldr	r2, [r4, #28]
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L13
	mov	r3, #0
	ldr	r7, .L15+12
	str	r3, [r4, #32]
	mov	lr, pc
	bx	r7
	adds	r3, r0, #3
	and	r3, r3, #1
	ldr	r2, .L15+16
	rsbmi	r3, r3, #0
	b	.L12
.L14:
	add	r0, r5, #20
	ldm	r0, {r0, r1}
	ldm	r5, {r2, r3}
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldr	r7, .L15+8
	ldr	r3, [r4, #24]
	ldr	r2, [r4, #28]
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	bne	.L8
.L13:
	ldr	r3, [r4, #8]
	b	.L7
.L8:
	str	r6, [r4, #32]
	ldr	r7, .L15+12
	mov	lr, pc
	bx	r7
	subs	r3, r0, #0
	and	r3, r3, #1
	ldr	r2, .L15+16
	rsblt	r3, r3, #0
.L12:
	ldr	r6, [r2, #12]
	str	r3, [r5, #28]
	mov	lr, pc
	bx	r7
	ldr	r3, .L15+20
	smull	r1, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #4
	add	r3, r3, r3, lsl #2
	rsb	r3, r3, r3, lsl #4
	sub	r3, r0, r3, lsl #1
	add	r3, r3, r6
	add	r3, r3, #150
	str	r3, [r5, #12]
	b	.L13
.L16:
	.align	2
.L15:
	.word	rabbit
	.word	hOff
	.word	collision
	.word	rand
	.word	gran
	.word	458129845
	.size	updateFoods.part.0, .-updateFoods.part.0
	.align	2
	.global	initGran
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGran, %function
initGran:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r2, #0
	mov	r6, #90
	mov	r5, #60
	mov	r4, #32
	mov	lr, #64
	mov	r1, #1
	mov	ip, #3
	mov	r0, #2
	ldr	r3, .L19
	str	r6, [r3, #8]
	str	r5, [r3, #12]
	str	r4, [r3, #24]
	str	lr, [r3, #20]
	str	ip, [r3, #44]
	str	r0, [r3, #48]
	str	r1, [r3, #16]
	str	r1, [r3, #32]
	str	r2, [r3, #36]
	str	r2, [r3, #40]
	str	r2, [r3, #28]
	pop	{r4, r5, r6, lr}
	bx	lr
.L20:
	.align	2
.L19:
	.word	gran
	.size	initGran, .-initGran
	.align	2
	.global	animatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	animatePlayer, %function
animatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L47
	ldr	r2, [r3, #48]
	cmp	r2, #4
	movne	r1, #4
	str	lr, [sp, #-4]!
	strne	r2, [r3, #52]
	strne	r1, [r3, #48]
	ldr	r2, .L47+4
	ldr	r1, [r3, #36]
	smull	ip, r0, r2, r1
	asr	r2, r1, #31
	rsb	r2, r2, r0, asr #3
	add	r2, r2, r2, lsl #2
	subs	r2, r1, r2, lsl #2
	bne	.L24
	ldr	r0, [r3, #44]
	ldr	ip, [r3, #40]
	sub	r0, r0, #1
	cmp	ip, r0
	addlt	ip, ip, #1
	strlt	ip, [r3, #40]
	bge	.L46
.L24:
	ldr	r2, .L47+8
	ldrh	r2, [r2, #48]
	tst	r2, #32
	bne	.L27
	mov	lr, #3
	mov	ip, #1
	ldr	r0, .L47+12
	ldr	r2, [r0]
	sub	r2, r2, #1
	str	r2, [r0]
	str	lr, [r3, #48]
	str	ip, [r3, #28]
.L27:
	ldr	r2, .L47+8
	ldr	r0, .L47+16
	ldrh	r2, [r2, #48]
	ldrh	r0, [r0]
	ands	r2, r2, #16
	and	r0, r0, #1
	bne	.L28
	mov	lr, #2
	ldr	ip, .L47+12
	cmp	r0, #0
	ldr	r0, [ip]
	add	r0, r0, #1
	str	r2, [r3, #28]
	str	r0, [ip]
	str	lr, [r3, #48]
	bne	.L29
.L30:
	add	r1, r1, #1
	str	r1, [r3, #36]
	ldr	lr, [sp], #4
	bx	lr
.L29:
	ldr	r2, .L47+20
	ldrh	r2, [r2]
	tst	r2, #1
	beq	.L34
.L32:
	ldr	r2, [r3, #48]
	cmp	r2, #4
	bne	.L30
	mov	r1, #0
	ldr	r2, [r3, #52]
	str	r1, [r3, #40]
	str	r2, [r3, #48]
	ldr	lr, [sp], #4
	bx	lr
.L46:
	ldr	r0, [r3, #48]
	cmp	r0, #1
	str	r2, [r3, #40]
	ldrls	r2, [r3, #52]
	strls	r2, [r3, #48]
	b	.L24
.L28:
	cmp	r0, #0
	beq	.L32
	ldr	r2, .L47+20
	ldrh	r2, [r2]
	tst	r2, #1
	bne	.L32
	ldr	r2, [r3, #28]
	cmp	r2, #0
	movne	r2, #1
	strne	r2, [r3, #48]
	bne	.L30
.L34:
	mov	r2, #0
	str	r2, [r3, #48]
	b	.L30
.L48:
	.align	2
.L47:
	.word	gran
	.word	1717986919
	.word	67109120
	.word	hOff
	.word	oldButtons
	.word	buttons
	.size	animatePlayer, .-animatePlayer
	.align	2
	.global	drawGran
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGran, %function
drawGran:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L51
	ldr	r3, [r3, #32]
	cmp	r3, #0
	bne	drawGran.part.0
.L50:
	mov	r2, #512
	ldr	r3, .L51+4
	strh	r2, [r3]	@ movhi
	bx	lr
.L52:
	.align	2
.L51:
	.word	gran
	.word	shadowOAM
	.size	drawGran, .-drawGran
	.align	2
	.global	initRabbits
	.syntax unified
	.arm
	.fpu softvfp
	.type	initRabbits, %function
initRabbits:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #135
	push	{r4, r5, r6, lr}
	ldr	r4, .L55
	ldr	r6, .L55+4
	str	r3, [r4, #8]
	mov	lr, pc
	bx	r6
	mov	r5, #1
	mov	r2, #64
	ldr	r1, .L55+8
	add	r0, r0, #250
	rsbs	r3, r0, #0
	and	r3, r3, r1
	and	r0, r0, r1
	ldr	r1, .L55+12
	ldr	r1, [r1, #4]
	rsbpl	r0, r3, #0
	add	r0, r0, r1
	str	r2, [r4, #24]
	str	r2, [r4, #20]
	str	r0, [r4, #12]
	str	r5, [r4, #16]
	mov	lr, pc
	bx	r6
	mov	r3, #0
	mov	r2, #3
	adds	r0, r0, #60
	and	r0, r0, r5
	rsbmi	r0, r0, #0
	str	r0, [r4, #28]
	str	r5, [r4, #32]
	str	r2, [r4, #48]
	str	r3, [r4, #36]
	str	r3, [r4, #44]
	pop	{r4, r5, r6, lr}
	bx	lr
.L56:
	.align	2
.L55:
	.word	rabbit
	.word	rand
	.word	511
	.word	gran
	.size	initRabbits, .-initRabbits
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r4, #0
	mov	r3, #1
	mov	lr, #90
	mov	ip, #60
	mov	r0, #32
	mov	r1, #64
	mov	r2, #2
	mov	r5, #3
	ldr	r6, .L61
	str	r4, [r6]
	ldr	r6, .L61+4
	str	r4, [r6, #36]
	str	r4, [r6, #40]
	str	r4, [r6, #28]
	str	lr, [r6, #8]
	str	ip, [r6, #12]
	str	r0, [r6, #24]
	str	r1, [r6, #20]
	str	r2, [r6, #48]
	str	r3, [r6, #16]
	str	r3, [r6, #32]
	str	r5, [r6, #44]
	bl	initRabbits
	mov	r0, r5
	mov	r2, #16
	mov	r5, #105
	ldr	lr, [r6, #4]
	ldr	ip, [r6, #12]
	ldr	r3, .L61+8
	mov	r1, r4
	add	lr, lr, #5
	add	ip, ip, #5
	add	r4, r3, #4000
.L58:
	str	ip, [r3, #8]
	str	r0, [r3, #16]
	str	r1, [r3, #32]
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	stm	r3, {r5, lr}
	add	r3, r3, #40
	cmp	r3, r4
	bne	.L58
	pop	{r4, r5, r6, lr}
	bx	lr
.L62:
	.align	2
.L61:
	.word	hOff
	.word	gran
	.word	foods
	.size	initGame, .-initGame
	.global	__aeabi_idivmod
	.align	2
	.global	updateRabbits
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateRabbits, %function
updateRabbits:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L73
	ldr	r3, [r4, #36]
	cmp	r3, #25
	ldr	r1, [r4, #44]
	addne	r2, r3, #1
	bne	.L65
	add	r0, r1, #1
	ldr	r3, .L73+4
	ldr	r1, [r4, #48]
	mov	lr, pc
	bx	r3
	mov	r2, #1
	str	r1, [r4, #44]
.L65:
	cmp	r1, #0
	str	r2, [r4, #36]
	moveq	r2, #135
	ldr	r3, [r4, #12]
	sub	r3, r3, #1
	str	r3, [r4, #12]
	streq	r2, [r4, #8]
	beq	.L67
	cmp	r1, #1
	moveq	r2, #120
	streq	r2, [r4, #8]
	beq	.L67
	cmp	r1, #2
	moveq	r1, #100
	moveq	r2, r1
	ldrne	r2, [r4, #8]
	streq	r1, [r4, #8]
.L67:
	ldr	r0, .L73+8
	ldr	r1, .L73+12
	ldr	r0, [r0]
	ldr	r1, [r1]
	cmp	r3, #60
	sub	r2, r2, r1
	sub	r3, r3, r0
	stm	r4, {r2, r3}
	beq	.L72
	pop	{r4, lr}
	bx	lr
.L72:
	mov	r3, #0
	ldr	r1, .L73+16
	ldr	r2, .L73+20
	str	r3, [r4, #32]
	str	r3, [r1, #32]
	mov	lr, pc
	bx	r2
	pop	{r4, lr}
	bx	lr
.L74:
	.align	2
.L73:
	.word	rabbit
	.word	__aeabi_idivmod
	.word	hOff
	.word	vOff
	.word	gran
	.word	goToLose
	.size	updateRabbits, .-updateRabbits
	.align	2
	.global	drawRabbits
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRabbits, %function
drawRabbits:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L79
	ldr	r3, [r2, #32]
	cmp	r3, #0
	beq	.L76
	ldr	r3, [r2, #4]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	r0, [r2, #28]
	ldr	r1, .L79+4
	ldrb	ip, [r2]	@ zero_extendqisi2
	cmp	r0, #0
	strh	r3, [r1, #42]	@ movhi
	strh	ip, [r1, #40]	@ movhi
	bne	.L77
	ldr	r3, [r2, #44]
	lsl	r3, r3, #7
	add	r3, r3, #16
	strh	r3, [r1, #44]	@ movhi
	bx	lr
.L76:
	mov	r2, #512
	ldr	r3, .L79+4
	strh	r2, [r3, #40]	@ movhi
	bx	lr
.L77:
	cmp	r0, #1
	ldreq	r3, [r2, #44]
	lsleq	r3, r3, #7
	addeq	r3, r3, #24
	strheq	r3, [r1, #44]	@ movhi
	bx	lr
.L80:
	.align	2
.L79:
	.word	rabbit
	.word	shadowOAM
	.size	drawRabbits, .-drawRabbits
	.align	2
	.global	initFoods
	.syntax unified
	.arm
	.fpu softvfp
	.type	initFoods, %function
initFoods:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r2, #16
	mov	r5, #105
	mov	r4, #3
	mov	lr, #0
	ldr	r1, .L85
	ldr	r3, .L85+4
	ldr	r0, [r1, #4]
	ldr	r1, [r1, #12]
	add	r0, r0, #5
	add	r1, r1, #5
	add	ip, r3, #4000
.L82:
	str	r5, [r3]
	str	r4, [r3, #16]
	str	lr, [r3, #32]
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	stmib	r3, {r0, r1}
	add	r3, r3, #40
	cmp	r3, ip
	bne	.L82
	pop	{r4, r5, lr}
	bx	lr
.L86:
	.align	2
.L85:
	.word	gran
	.word	foods
	.size	initFoods, .-initFoods
	.align	2
	.global	fireFoods
	.syntax unified
	.arm
	.fpu softvfp
	.type	fireFoods, %function
fireFoods:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L98
	mov	r3, #0
	mov	r2, r0
	b	.L91
.L88:
	add	r3, r3, #1
	cmp	r3, #100
	add	r2, r2, #40
	bxeq	lr
.L91:
	ldr	r1, [r2, #32]
	cmp	r1, #0
	bne	.L88
	push	{r4, lr}
	mov	r4, #105
	ldr	ip, .L98+4
	ldr	r1, [ip, #4]
	ldr	r2, [ip, #12]
	ldr	ip, [ip, #28]
	add	r3, r3, r3, lsl #2
	add	r2, r2, #5
	str	r4, [r0, r3, lsl #3]
	cmp	ip, #0
	add	r3, r0, r3, lsl #3
	add	r1, r1, #5
	mov	lr, #1
	stmib	r3, {r1, r2}
	mvnne	r2, #2
	moveq	r2, #3
	str	lr, [r3, #32]
	str	r2, [r3, #16]
	pop	{r4, lr}
	bx	lr
.L99:
	.align	2
.L98:
	.word	foods
	.word	gran
	.size	fireFoods, .-fireFoods
	.align	2
	.global	updateGran
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGran, %function
updateGran:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r3, .L123
	ldrh	r3, [r3, #48]
	ands	r3, r3, #32
	sub	sp, sp, #16
	beq	.L101
	ldr	r7, .L123+4
	ldr	r8, .L123+8
.L102:
	ldr	r3, .L123
	ldrh	r3, [r3, #48]
	ands	r3, r3, #16
	beq	.L120
.L105:
	ldr	r4, .L123+12
	mov	r6, #1
	ldr	r5, .L123+16
	ldr	r10, .L123+20
	add	r9, r4, #4000
	b	.L109
.L107:
	tst	r3, #2
	beq	.L108
	ldrh	r3, [r10]
	tst	r3, #2
	beq	.L121
.L108:
	add	r4, r4, #40
	cmp	r9, r4
	beq	.L122
.L109:
	ldrh	r3, [r5]
	tst	r3, #1
	beq	.L107
	ldrh	r2, [r10]
	ands	r2, r2, #1
	bne	.L107
	str	r2, [r4]
	bl	fireFoods
	ldrh	r3, [r5]
	b	.L107
.L121:
	str	r6, [r4]
	add	r4, r4, #40
	bl	fireFoods
	cmp	r9, r4
	bne	.L109
.L122:
	ldr	r3, .L123+24
	ldr	r0, [r8]
	ldr	r1, [r3]
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #8]
	sub	r2, r2, r0
	sub	r3, r3, r1
	str	r2, [r7, #4]
	str	r3, [r7]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	b	animatePlayer
.L101:
	mov	r2, #256
	ldr	r7, .L123+4
	str	r3, [sp, #8]
	str	r3, [sp, #4]
	str	r3, [sp]
	str	r2, [sp, #12]
	ldr	r3, [r7, #20]
	ldr	r2, [r7, #24]
	ldr	r1, [r7, #8]
	ldr	r0, [r7, #12]
	ldr	r4, .L123+28
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	ldr	r8, .L123+8
	bne	.L102
	ldr	r3, [r8]
	add	r1, r7, #12
	ldmia	r1, {r1, r2}
	sub	r2, r1, r2
	cmp	r3, #0
	str	r2, [r7, #12]
	blt	.L102
	ldr	r2, [r7, #4]
	cmp	r2, #119
	suble	r3, r3, #1
	strle	r3, [r8]
	b	.L102
.L120:
	mov	r1, #256
	mov	r2, #512
	str	r3, [sp, #8]
	str	r3, [sp, #4]
	str	r1, [sp, #12]
	str	r2, [sp]
	ldr	r3, [r7, #20]
	ldr	r2, [r7, #24]
	ldr	r1, [r7, #8]
	ldr	r0, [r7, #12]
	ldr	r4, .L123+28
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	bne	.L105
	ldr	r3, [r8]
	add	r1, r7, #12
	ldmia	r1, {r1, r2}
	add	r2, r1, r2
	cmp	r3, #272
	str	r2, [r7, #12]
	bge	.L105
	ldr	r2, [r7, #4]
	cmp	r2, #120
	addgt	r3, r3, #1
	strgt	r3, [r8]
	b	.L105
.L124:
	.align	2
.L123:
	.word	67109120
	.word	gran
	.word	hOff
	.word	foods+12
	.word	oldButtons
	.word	buttons
	.word	vOff
	.word	collision
	.size	updateGran, .-updateGran
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	bl	updateGran
	bl	updateRabbits
	ldr	r4, .L133
	add	r5, r4, #4000
.L127:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	movne	r0, r4
	blne	updateFoods.part.0
.L126:
	add	r4, r4, #40
	cmp	r4, r5
	bne	.L127
	pop	{r4, r5, r6, lr}
	bx	lr
.L134:
	.align	2
.L133:
	.word	foods
	.size	updateGame, .-updateGame
	.align	2
	.global	updateFoods
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateFoods, %function
updateFoods:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #32]
	cmp	r3, #0
	bxeq	lr
	b	updateFoods.part.0
	.size	updateFoods, .-updateFoods
	.align	2
	.global	drawFoods
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFoods, %function
drawFoods:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	mov	lr, #0
	ldr	r3, .L155
	ldr	r3, [r3, #48]
	bic	r3, r3, #2
	cmp	r3, #1
	moveq	r8, #2
	movne	r8, lr
	ldr	r0, .L155+4
	ldr	r3, .L155+8
	mov	r4, r0
	mov	r1, r0
	mov	r9, lr
	mov	r6, #512
	ldrh	r2, [r0, #82]
	ldrh	r7, [r0, #84]
	ldr	r5, .L155+12
	add	r8, r8, #832
	add	ip, r3, #4000
	b	.L140
.L154:
	cmp	r0, #1
	moveq	lr, r0
	moveq	r7, r8
	moveq	r9, lr
	movne	r9, #1
.L139:
	add	r3, r3, #40
	cmp	r3, ip
	add	r1, r1, #8
	beq	.L153
.L140:
	ldr	r0, [r3, #32]
	cmp	r0, #0
	strheq	r6, [r1, #80]	@ movhi
	beq	.L139
	ldr	r2, [r3, #4]
	ldr	r0, [r3, #12]
	ldrb	r9, [r3]	@ zero_extendqisi2
	and	r2, r2, r5
	cmp	r0, #0
	strh	r9, [r4, #80]	@ movhi
	orr	r2, r2, #16384
	bne	.L154
	mov	lr, #1
	add	r3, r3, #40
	cmp	r3, ip
	mov	r7, #768
	mov	r9, lr
	add	r1, r1, #8
	bne	.L140
.L153:
	cmp	r9, #0
	strhne	r2, [r4, #82]	@ movhi
	cmp	lr, #0
	strhne	r7, [r4, #84]	@ movhi
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L156:
	.align	2
.L155:
	.word	gran
	.word	shadowOAM
	.word	foods
	.word	511
	.size	drawFoods, .-drawFoods
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L161
	ldr	r3, [r3, #32]
	cmp	r3, #0
	push	{r4, lr}
	beq	.L158
	bl	drawGran.part.0
.L159:
	bl	drawRabbits
	bl	drawFoods
	mov	r3, #67108864
	ldr	r2, .L161+4
	ldrh	r2, [r2]
	pop	{r4, lr}
	strh	r2, [r3, #16]	@ movhi
	bx	lr
.L158:
	mov	r2, #512
	ldr	r3, .L161+8
	strh	r2, [r3]	@ movhi
	b	.L159
.L162:
	.align	2
.L161:
	.word	gran
	.word	hOff
	.word	shadowOAM
	.size	drawGame, .-drawGame
	.comm	shadowOAM,1024,4
	.comm	foods,4000,4
	.comm	rabbit,52,4
	.comm	gran,56,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
