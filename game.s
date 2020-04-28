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
	.type	drawImTired.part.0, %function
drawImTired.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L3
	ldr	r2, [r3, #4]
	mvn	r2, r2, lsl #18
	mov	r0, #772
	mvn	r2, r2, lsr #18
	ldr	r3, [r3, #8]
	sub	r3, r3, #25
	ldr	r1, .L3+4
	orr	r3, r3, #16384
	orr	r3, r3, #10
	strh	r3, [r1, #144]	@ movhi
	strh	r2, [r1, #146]	@ movhi
	strh	r0, [r1, #148]	@ movhi
	bx	lr
.L4:
	.align	2
.L3:
	.word	gran
	.word	shadowOAM
	.size	drawImTired.part.0, .-drawImTired.part.0
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
	push	{r4, r5, lr}
	mov	r4, #90
	mov	r2, #0
	mov	r5, #32
	mov	lr, #64
	mov	r1, #1
	mov	ip, #3
	mov	r0, #2
	ldr	r3, .L7
	str	r4, [r3, #8]
	ldr	r4, .L7+4
	str	r5, [r3, #24]
	str	r4, [r3, #12]	@ float
	str	lr, [r3, #20]
	str	ip, [r3, #48]
	str	r0, [r3, #52]
	str	r1, [r3, #16]
	str	r1, [r3, #32]
	str	r2, [r3, #36]
	str	r2, [r3, #40]
	str	r2, [r3, #44]
	str	r2, [r3, #28]
	pop	{r4, r5, lr}
	bx	lr
.L8:
	.align	2
.L7:
	.word	gran
	.word	1114636288
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
	@ link register save eliminated.
	ldr	r3, .L44
	ldr	r2, [r3, #52]
	cmp	r2, #4
	movne	r1, #4
	strne	r2, [r3, #56]
	strne	r1, [r3, #52]
	ldr	r2, .L44+4
	ldr	r1, [r3, #36]
	smull	ip, r0, r2, r1
	asr	r2, r1, #31
	rsb	r2, r2, r0, asr #3
	add	r2, r2, r2, lsl #2
	subs	r2, r1, r2, lsl #2
	bne	.L12
	ldr	r0, [r3, #48]
	ldr	ip, [r3, #44]
	sub	r0, r0, #1
	cmp	ip, r0
	addlt	ip, ip, #1
	strlt	ip, [r3, #44]
	bge	.L42
.L12:
	ldr	r2, .L44+8
	ldrh	r2, [r2, #48]
	tst	r2, #32
	moveq	r2, #1
	moveq	r0, #3
	streq	r2, [r3, #28]
	ldr	r2, .L44+8
	ldrh	r2, [r2, #48]
	streq	r0, [r3, #52]
	ands	r2, r2, #16
	moveq	r0, #2
	streq	r2, [r3, #28]
	ldr	r2, .L44+12
	ldrh	r2, [r2]
	streq	r0, [r3, #52]
	tst	r2, #1
	beq	.L17
	ldr	r0, .L44+16
	ldrh	r0, [r0]
	tst	r0, #1
	bne	.L17
.L18:
	ldr	r2, [r3, #28]
	cmp	r2, #0
	movne	r2, #1
	str	r2, [r3, #52]
.L22:
	add	r1, r1, #1
	str	r1, [r3, #36]
	bx	lr
.L17:
	tst	r2, #2
	beq	.L19
	ldr	r0, .L44+16
	ldrh	r0, [r0]
	tst	r0, #2
	beq	.L18
.L19:
	tst	r2, #512
	bne	.L43
.L20:
	ldr	r2, [r3, #52]
	cmp	r2, #4
	bne	.L22
	mov	r1, #0
	ldr	r2, [r3, #56]
	str	r1, [r3, #44]
	str	r2, [r3, #52]
	bx	lr
.L43:
	ldr	r2, .L44+16
	ldrh	r2, [r2]
	tst	r2, #512
	bne	.L20
	b	.L18
.L42:
	ldr	r0, [r3, #52]
	cmp	r0, #1
	str	r2, [r3, #44]
	ldrls	r2, [r3, #56]
	strls	r2, [r3, #52]
	b	.L12
.L45:
	.align	2
.L44:
	.word	gran
	.word	1717986919
	.word	67109120
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
	ldr	r2, .L49
	ldr	r3, [r2, #32]
	cmp	r3, #0
	beq	.L47
	ldr	r3, [r2, #4]
	ldrb	r1, [r2]	@ zero_extendqisi2
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #18
	mvn	r1, r1, lsl #17
	mvn	r3, r3, lsr #18
	mvn	r1, r1, lsr #17
	ldr	ip, [r2, #16]
	ldr	r0, .L49+4
	cmp	ip, #1
	strh	r3, [r0, #2]	@ movhi
	strh	r1, [r0]	@ movhi
	ldreq	r3, [r2, #52]
	ldreq	r1, [r2, #44]
	addeq	r3, r3, r1, lsl #6
	lsleq	r3, r3, #2
	strheq	r3, [r0, #4]	@ movhi
	bx	lr
.L47:
	mov	r2, #512
	ldr	r3, .L49+4
	strh	r2, [r3]	@ movhi
	bx	lr
.L50:
	.align	2
.L49:
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
	ldr	r4, .L53
	ldr	r5, .L53+4
	str	r3, [r4, #8]
	mov	lr, pc
	bx	r5
	mov	r2, #64
	ldr	r1, .L53+8
	ldr	ip, .L53+12
	add	r0, r0, #250
	rsbs	r3, r0, #0
	and	r3, r3, r1
	and	r0, r0, r1
	ldr	r1, [ip, #4]
	rsbpl	r0, r3, #0
	add	r0, r0, r1
	str	r2, [r4, #24]
	str	r2, [r4, #20]
	str	r0, [r4, #12]
	mov	lr, pc
	bx	r5
	mov	r1, #1
	mov	r3, #0
	mov	r2, #3
	adds	r0, r0, #60
	and	r0, r0, r1
	rsbmi	r0, r0, #0
	str	r0, [r4, #28]
	str	r1, [r4, #32]
	str	r2, [r4, #48]
	str	r3, [r4, #36]
	str	r3, [r4, #44]
	pop	{r4, r5, r6, lr}
	bx	lr
.L54:
	.align	2
.L53:
	.word	rabbit
	.word	rand
	.word	511
	.word	gran
	.size	initRabbits, .-initRabbits
	.global	__aeabi_idivmod
	.global	__aeabi_i2d
	.global	__aeabi_dsub
	.global	__aeabi_d2iz
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
	push	{r4, r5, r6, lr}
	ldr	r4, .L63+8
	ldr	r3, [r4, #36]
	cmp	r3, #16
	ldr	r5, [r4, #44]
	addne	r3, r3, #1
	bne	.L57
	ldr	r3, .L63+12
	add	r0, r5, #1
	ldr	r1, [r4, #48]
	mov	lr, pc
	bx	r3
	mov	r3, #1
	mov	r5, r1
	str	r1, [r4, #44]
.L57:
	ldr	r2, .L63+16
	ldr	r0, [r4, #12]
	str	r3, [r4, #36]
	mov	lr, pc
	bx	r2
	ldr	r6, .L63+20
	adr	r3, .L63
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	r6
	ldr	r3, .L63+24
	mov	lr, pc
	bx	r3
	cmp	r5, #0
	moveq	r3, #135
	str	r0, [r4, #12]
	streq	r3, [r4, #8]
	beq	.L59
	cmp	r5, #1
	moveq	r3, #120
	streq	r3, [r4, #8]
	beq	.L59
	cmp	r5, #2
	moveq	r2, #100
	moveq	r3, r2
	ldrne	r3, [r4, #8]
	streq	r2, [r4, #8]
.L59:
	ldr	r1, .L63+28
	ldr	r2, .L63+32
	ldr	r1, [r1]
	ldr	r2, [r2]
	sub	r0, r0, r1
	sub	r3, r3, r2
	str	r0, [r4, #4]
	str	r3, [r4]
	pop	{r4, r5, r6, lr}
	bx	lr
.L64:
	.align	3
.L63:
	.word	2576980378
	.word	1072798105
	.word	rabbit
	.word	__aeabi_idivmod
	.word	__aeabi_i2d
	.word	__aeabi_dsub
	.word	__aeabi_d2iz
	.word	hOff
	.word	vOff
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
	ldr	r2, .L69
	ldr	r3, [r2, #32]
	cmp	r3, #0
	beq	.L66
	ldr	r3, [r2, #4]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	r0, [r2, #28]
	ldr	r1, .L69+4
	ldrb	ip, [r2]	@ zero_extendqisi2
	cmp	r0, #0
	strh	r3, [r1, #42]	@ movhi
	strh	ip, [r1, #40]	@ movhi
	bne	.L67
	ldr	r3, [r2, #44]
	lsl	r3, r3, #7
	add	r3, r3, #16
	strh	r3, [r1, #44]	@ movhi
	bx	lr
.L66:
	mov	r2, #512
	ldr	r3, .L69+4
	strh	r2, [r3, #40]	@ movhi
	bx	lr
.L67:
	cmp	r0, #1
	ldreq	r3, [r2, #44]
	lsleq	r3, r3, #7
	addeq	r3, r3, #400
	strheq	r3, [r1, #44]	@ movhi
	bx	lr
.L70:
	.align	2
.L69:
	.word	rabbit
	.word	shadowOAM
	.size	drawRabbits, .-drawRabbits
	.global	__aeabi_fadd
	.global	__aeabi_f2iz
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
	ldr	r3, .L75
	push	{r4, r5, r6, lr}
	ldr	r1, .L75+4
	ldr	r4, [r3, #4]
	ldr	r0, [r3, #12]	@ float
	ldr	r3, .L75+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L75+12
	mov	lr, pc
	bx	r3
	mov	r5, #105
	mov	lr, #3
	mov	r1, #0
	mov	r2, #16
	ldr	r3, .L75+16
	add	r4, r4, #5
	add	ip, r3, #132
.L72:
	str	r5, [r3]
	str	r4, [r3, #4]
	str	r0, [r3, #8]
	str	lr, [r3, #20]
	str	r1, [r3, #36]
	str	r2, [r3, #28]
	str	r2, [r3, #32]
	str	r1, [r3, #16]
	add	r3, r3, #44
	cmp	r3, ip
	bne	.L72
	pop	{r4, r5, r6, lr}
	bx	lr
.L76:
	.align	2
.L75:
	.word	gran
	.word	1084227584
	.word	__aeabi_fadd
	.word	__aeabi_f2iz
	.word	foods
	.size	initFoods, .-initFoods
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
	mov	r2, #0
	push	{r4, r5, r6, lr}
	mov	r1, #1
	mov	lr, #64
	mov	r5, #90
	mov	r4, #32
	mov	ip, #3
	mov	r0, #2
	ldr	r3, .L79
	str	r2, [r3]
	ldr	r3, .L79+4
	str	r2, [r3]
	ldr	r3, .L79+8
	str	r2, [r3]
	ldr	r3, .L79+12
	str	r2, [r3, #36]
	str	r2, [r3, #40]
	str	r2, [r3, #44]
	str	r2, [r3, #28]
	ldr	r2, .L79+16
	str	r5, [r3, #8]
	str	r4, [r3, #24]
	str	lr, [r3, #20]
	str	r2, [r3, #12]	@ float
	str	ip, [r3, #48]
	str	r0, [r3, #52]
	str	r1, [r3, #16]
	str	r1, [r3, #32]
	bl	initRabbits
	pop	{r4, r5, r6, lr}
	b	initFoods
.L80:
	.align	2
.L79:
	.word	throwCount
	.word	score
	.word	hOff
	.word	gran
	.word	1114636288
	.size	initGame, .-initGame
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
	push	{r4, r5, r6, lr}
	ldr	lr, .L89
	mov	r3, #0
	mov	r2, lr
	ldr	r5, .L89+4
	ldr	ip, [r5, #16]
.L85:
	ldr	r1, [r2, #36]
	cmp	r1, #0
	bne	.L82
	cmp	ip, #1
	beq	.L88
.L82:
	add	r3, r3, #1
	cmp	r3, #3
	add	r2, r2, #44
	bne	.L85
.L81:
	pop	{r4, r5, r6, lr}
	bx	lr
.L88:
	mov	r1, #105
	add	r2, r3, r3, lsl #2
	add	r3, r3, r2, lsl #1
	ldr	r2, [r5, #4]
	add	r4, lr, r3, lsl #2
	add	r2, r2, #5
	str	r1, [lr, r3, lsl #2]
	str	ip, [r4, #36]
	str	r0, [r4, #12]
	str	r2, [r4, #4]
	ldr	r3, .L89+8
	ldr	r1, .L89+12
	ldr	r0, [r5, #12]	@ float
	mov	lr, pc
	bx	r3
	ldr	r3, .L89+16
	mov	lr, pc
	bx	r3
	ldr	r3, [r5, #28]
	cmp	r3, #0
	mvnne	r3, #2
	moveq	r3, #3
	str	r0, [r4, #8]
	str	r3, [r4, #20]
	b	.L81
.L90:
	.align	2
.L89:
	.word	foods
	.word	gran
	.word	__aeabi_fadd
	.word	1084227584
	.word	__aeabi_f2iz
	.size	fireFoods, .-fireFoods
	.global	__aeabi_i2f
	.global	__aeabi_fsub
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
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	r3, .L118
	ldrh	r3, [r3, #48]
	ands	r5, r3, #32
	ldr	r4, .L118+4
	ldr	r6, .L118+8
	sub	sp, sp, #20
	beq	.L92
	ldr	r8, .L118+12
	ldr	r9, .L118+16
	ldr	r7, .L118+20
.L93:
	ldr	r3, .L118
	ldrh	r3, [r3, #48]
	ands	r5, r3, #16
	beq	.L113
.L96:
	ldr	r3, .L118+24
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L98
	ldr	r2, .L118+28
	ldrh	r0, [r2]
	ands	r0, r0, #1
	beq	.L114
.L98:
	tst	r3, #2
	beq	.L100
	ldr	r2, .L118+28
	ldrh	r2, [r2]
	tst	r2, #2
	beq	.L115
.L100:
	tst	r3, #512
	beq	.L99
	ldr	r3, .L118+28
	ldrh	r3, [r3]
	tst	r3, #512
	beq	.L116
.L99:
	ldr	r0, [r7]
	mov	lr, pc
	bx	r8
	mov	r1, r0
	ldr	r0, [r4, #12]	@ float
	mov	lr, pc
	bx	r9
	mov	lr, pc
	bx	r6
	ldr	r2, .L118+32
	ldr	r3, [r4, #8]
	ldr	r2, [r2]
	sub	r3, r3, r2
	str	r0, [r4, #4]
	str	r3, [r4]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	b	animatePlayer
.L92:
	ldr	r0, [r4, #12]	@ float
	mov	lr, pc
	bx	r6
	mov	ip, #256
	str	r5, [sp, #8]
	str	r5, [sp, #4]
	str	r5, [sp]
	ldr	r3, [r4, #20]
	ldr	r2, [r4, #24]
	ldr	r1, [r4, #8]
	str	ip, [sp, #12]
	ldr	r5, .L118+36
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	ldr	r8, .L118+12
	bne	.L117
	ldr	r0, [r4, #16]
	mov	lr, pc
	bx	r8
	ldr	r9, .L118+16
	mov	r1, r0
	ldr	r0, [r4, #12]	@ float
	mov	lr, pc
	bx	r9
	ldr	r7, .L118+20
	ldr	r3, [r7]
	cmp	r3, #0
	str	r0, [r4, #12]	@ float
	blt	.L93
	ldr	r2, [r4, #4]
	cmp	r2, #119
	suble	r3, r3, #1
	strle	r3, [r7]
	b	.L93
.L113:
	ldr	r0, [r4, #12]	@ float
	mov	lr, pc
	bx	r6
	mov	lr, #256
	mov	ip, #512
	str	r5, [sp, #8]
	str	r5, [sp, #4]
	ldr	r3, [r4, #20]
	ldr	r2, [r4, #24]
	ldr	r1, [r4, #8]
	str	lr, [sp, #12]
	str	ip, [sp]
	ldr	r5, .L118+36
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	bne	.L96
	ldr	r0, [r4, #16]
	mov	lr, pc
	bx	r8
	ldr	r3, .L118+40
	ldr	r1, [r4, #12]	@ float
	mov	lr, pc
	bx	r3
	ldr	r3, [r7]
	cmp	r3, #272
	str	r0, [r4, #12]	@ float
	bge	.L96
	ldr	r2, [r4, #4]
	cmp	r2, #120
	addgt	r3, r3, #1
	strgt	r3, [r7]
	b	.L96
.L117:
	ldr	r9, .L118+16
	ldr	r7, .L118+20
	b	.L93
.L114:
	ldr	r2, .L118+44
	ldr	r3, [r2]
	add	r3, r3, #1
	str	r3, [r2]
	bl	fireFoods
	b	.L99
.L115:
	ldr	r2, .L118+44
	ldr	r3, [r2]
	mov	r0, #1
	add	r3, r3, #1
	str	r3, [r2]
	bl	fireFoods
	b	.L99
.L116:
	ldr	r2, .L118+44
	ldr	r3, [r2]
	mov	r0, #2
	add	r3, r3, #1
	str	r3, [r2]
	bl	fireFoods
	b	.L99
.L119:
	.align	2
.L118:
	.word	67109120
	.word	gran
	.word	__aeabi_f2iz
	.word	__aeabi_i2f
	.word	__aeabi_fsub
	.word	hOff
	.word	oldButtons
	.word	buttons
	.word	vOff
	.word	collision
	.word	__aeabi_fadd
	.word	throwCount
	.size	updateGran, .-updateGran
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
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	r3, [r0, #36]
	cmp	r3, #0
	mov	r4, r0
	ldr	r6, .L147
	sub	sp, sp, #20
	bne	.L121
	ldr	r3, [r6, #12]
	cmp	r3, #60
	ldr	r5, .L147+4
	ble	.L145
.L134:
	ldr	r2, .L147+8
	ldr	r3, [r2]
	cmp	r3, #4
	movgt	r1, #0
	ldr	r3, [r5, #40]
	addgt	r3, r3, #1
	strgt	r3, [r5, #40]
	strgt	r1, [r5, #16]
	cmp	r3, #229
	movgt	r3, #0
	movgt	r1, #1
	strgt	r3, [r2]
	strgt	r1, [r5, #16]
	strgt	r3, [r5, #40]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L121:
	ldr	r2, [r0, #12]
	ldr	r3, [r0, #8]
	ldr	r7, [r6, #28]
	ldr	r0, [r0, #20]
	bic	r1, r2, #2
	add	r3, r3, r0
	orrs	r5, r1, r7
	str	r3, [r4, #8]
	beq	.L146
	sub	r2, r2, #1
	cmp	r2, #1
	bls	.L139
.L143:
	ldr	r5, .L147+4
.L125:
	ldr	r2, .L147+12
	ldr	r2, [r2]
	sub	r3, r3, r2
	cmp	r3, #240
	str	r3, [r4, #4]
	movhi	r3, #0
	strhi	r3, [r4, #36]
	ldr	r3, [r6, #12]
	cmp	r3, #60
	bgt	.L134
.L145:
	mov	r3, #0
	ldr	r2, .L147+16
	str	r3, [r4, #36]
	str	r3, [r6, #32]
	str	r3, [r5, #32]
	mov	lr, pc
	bx	r2
	b	.L134
.L146:
	add	r0, r6, #20
	ldm	r0, {r0, r1}
	ldm	r6, {r2, r3}
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldr	r7, .L147+20
	ldr	r3, [r4, #28]
	ldr	r2, [r4, #32]
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	bne	.L124
.L144:
	ldr	r3, [r4, #8]
	b	.L143
.L139:
	cmp	r7, #1
	bne	.L143
	add	r0, r6, #20
	ldm	r0, {r0, r1}
	ldm	r6, {r2, r3}
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldr	r5, .L147+20
	ldr	r3, [r4, #28]
	ldr	r2, [r4, #32]
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L144
	mov	r3, #0
	ldr	r9, .L147+24
	str	r3, [r4, #36]
	mov	lr, pc
	bx	r9
	adds	r3, r0, #3
	and	r3, r3, #1
	ldr	r5, .L147+4
	rsbmi	r3, r3, #0
	str	r3, [r6, #28]
	ldr	r8, [r5, #12]	@ float
	mov	lr, pc
	bx	r9
	ldr	r3, .L147+28
	smull	r1, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #4
	add	r3, r3, r3, lsl #2
	rsb	r3, r3, r3, lsl #4
	sub	r0, r0, r3, lsl #1
	ldr	r3, .L147+32
	mov	lr, pc
	bx	r3
	ldr	r9, .L147+36
	mov	r1, r8
	mov	lr, pc
	bx	r9
	ldr	r1, .L147+40
	mov	lr, pc
	bx	r9
	ldr	r3, .L147+44
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #12]
	cmp	r3, #1
	moveq	r7, #3
	str	r0, [r6, #12]
	streq	r7, [r4, #16]
	beq	.L131
	cmp	r3, #2
	ldrne	r7, [r4, #16]
	streq	r7, [r4, #16]
.L131:
	ldr	ip, .L147+48
	ldr	r3, [ip]
	mov	r2, #0
	add	r7, r3, r7
	ldr	r1, .L147+52
	ldr	r3, .L147+56
	ldr	r0, .L147+60
	str	r7, [ip]
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #8]
	b	.L125
.L124:
	ldr	r8, .L147+24
	str	r5, [r4, #36]
	mov	lr, pc
	bx	r8
	subs	r3, r0, #0
	and	r3, r3, #1
	ldr	r5, .L147+4
	rsblt	r3, r3, #0
	str	r3, [r6, #28]
	ldr	r7, [r5, #12]	@ float
	mov	lr, pc
	bx	r8
	ldr	r3, .L147+28
	smull	r1, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #4
	add	r3, r3, r3, lsl #2
	rsb	r3, r3, r3, lsl #4
	sub	r0, r0, r3, lsl #1
	ldr	r3, .L147+32
	mov	lr, pc
	bx	r3
	ldr	r8, .L147+36
	mov	r1, r7
	mov	lr, pc
	bx	r8
	ldr	r1, .L147+40
	mov	lr, pc
	bx	r8
	ldr	r3, .L147+44
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #12]
	cmp	r3, #0
	str	r0, [r6, #12]
	bne	.L126
	mov	r3, #3
	mov	r1, r3
	str	r3, [r4, #16]
.L127:
	ldr	ip, .L147+48
	ldr	r3, [ip]
	add	r3, r3, r1
	str	r3, [ip]
	mov	r2, #0
	ldr	r3, .L147+56
	ldr	r1, .L147+52
	ldr	r0, .L147+60
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #8]
	b	.L125
.L126:
	cmp	r3, #2
	moveq	r3, #1
	ldrne	r1, [r4, #16]
	moveq	r1, r3
	streq	r3, [r4, #16]
	b	.L127
.L148:
	.align	2
.L147:
	.word	rabbit
	.word	gran
	.word	throwCount
	.word	hOff
	.word	goToLose
	.word	collision
	.word	rand
	.word	458129845
	.word	__aeabi_i2f
	.word	__aeabi_fadd
	.word	1125515264
	.word	__aeabi_f2iz
	.word	score
	.word	4398
	.word	playSoundB
	.word	dingSound
	.size	updateFoods, .-updateFoods
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
	push	{r4, lr}
	ldr	r4, .L151
	bl	updateGran
	bl	updateRabbits
	mov	r0, r4
	bl	updateFoods
	add	r0, r4, #44
	bl	updateFoods
	add	r0, r4, #88
	pop	{r4, lr}
	b	updateFoods
.L152:
	.align	2
.L151:
	.word	foods
	.size	updateGame, .-updateGame
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
	ldr	r3, .L161
	ldr	r3, [r3, #52]
	bic	r3, r3, #2
	cmp	r3, #1
	moveq	r1, #2
	movne	r1, #0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r5, #512
	mov	r7, #896
	mov	r6, #768
	ldr	r3, .L161+4
	ldr	r2, .L161+8
	ldr	r4, .L161+12
	add	lr, r1, #832
	add	ip, r3, #132
.L158:
	ldr	r1, [r3, #36]
	cmp	r1, #0
	strheq	r5, [r2, #80]	@ movhi
	beq	.L156
	ldr	r1, [r3, #4]
	ldr	r0, [r3, #12]
	ldrb	r8, [r3]	@ zero_extendqisi2
	and	r1, r1, r4
	orr	r1, r1, #16384
	cmp	r0, #0
	strh	r1, [r2, #82]	@ movhi
	strh	r8, [r2, #80]	@ movhi
	strheq	r6, [r2, #84]	@ movhi
	beq	.L156
	cmp	r0, #1
	strheq	lr, [r2, #84]	@ movhi
	beq	.L156
	cmp	r0, #2
	strheq	r7, [r2, #84]	@ movhi
.L156:
	add	r3, r3, #44
	cmp	r3, ip
	add	r2, r2, #8
	bne	.L158
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L162:
	.align	2
.L161:
	.word	gran
	.word	foods
	.word	shadowOAM
	.word	511
	.size	drawFoods, .-drawFoods
	.global	__aeabi_ddiv
	.align	2
	.global	getNum
	.syntax unified
	.arm
	.fpu softvfp
	.type	getNum, %function
getNum:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r6, r0
	ldr	r7, .L165
	mov	r0, r1
	mov	lr, pc
	bx	r7
	ldr	r4, .L165+4
	mov	r2, r0
	mov	r3, r1
	mov	r0, #0
	ldr	r1, .L165+8
	mov	lr, pc
	bx	r4
	mov	r4, r0
	mov	r5, r1
	mov	r0, r6
	mov	lr, pc
	bx	r7
	mov	r2, r4
	mov	r3, r5
	ldr	r4, .L165+12
	mov	lr, pc
	bx	r4
	ldr	r3, .L165+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L165+20
	smull	r1, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #2
	add	r3, r3, r3, lsl #2
	sub	r0, r0, r3, lsl #1
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L166:
	.align	2
.L165:
	.word	__aeabi_i2d
	.word	pow
	.word	1076101120
	.word	__aeabi_ddiv
	.word	__aeabi_d2iz
	.word	1717986919
	.size	getNum, .-getNum
	.align	2
	.global	drawScore
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawScore, %function
drawScore:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r4, #0
	mov	r7, #512
	mov	r9, #10
	ldr	r5, .L174
	ldr	r6, .L174+4
	ldr	r8, .L174+8
.L170:
	ldr	r3, [r6, #32]
	cmp	r3, #0
	strheq	r7, [r5, #120]	@ movhi
	bne	.L173
.L169:
	add	r4, r4, #1
	cmp	r4, #3
	add	r5, r5, #8
	bne	.L170
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L173:
	rsb	r3, r4, r4, lsl #13
	rsb	r3, r4, r3, lsl #2
	lsl	r3, r3, #1
	add	r3, r3, #123
	orr	r3, r3, #16384
	mov	r1, r4
	ldr	r0, [r8]
	strh	r9, [r5, #120]	@ movhi
	strh	r3, [r5, #122]	@ movhi
	bl	getNum
	add	r0, r0, #480
	lsl	r0, r0, #1
	strh	r0, [r5, #124]	@ movhi
	b	.L169
.L175:
	.align	2
.L174:
	.word	shadowOAM
	.word	gran
	.word	score
	.size	drawScore, .-drawScore
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
	push	{r4, lr}
	bl	drawGran
	bl	drawRabbits
	bl	drawFoods
	bl	drawScore
	ldr	r3, .L184
	ldr	r2, [r3, #32]
	cmp	r2, #0
	beq	.L177
	ldr	r3, [r3, #16]
	cmp	r3, #0
	beq	.L183
.L177:
	mov	r2, #512
	ldr	r3, .L184+4
	strh	r2, [r3, #144]	@ movhi
.L178:
	mov	r3, #67108864
	ldr	r2, .L184+8
	ldrh	r2, [r2]
	pop	{r4, lr}
	strh	r2, [r3, #16]	@ movhi
	bx	lr
.L183:
	bl	drawImTired.part.0
	b	.L178
.L185:
	.align	2
.L184:
	.word	gran
	.word	shadowOAM
	.word	hOff
	.size	drawGame, .-drawGame
	.align	2
	.global	drawImTired
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawImTired, %function
drawImTired:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L191
	ldr	r2, [r3, #32]
	cmp	r2, #0
	beq	.L187
	ldr	r3, [r3, #16]
	cmp	r3, #0
	beq	drawImTired.part.0
.L187:
	mov	r2, #512
	ldr	r3, .L191+4
	strh	r2, [r3, #144]	@ movhi
	bx	lr
.L192:
	.align	2
.L191:
	.word	gran
	.word	shadowOAM
	.size	drawImTired, .-drawImTired
	.comm	shadowOAM,1024,4
	.comm	foods,132,4
	.comm	rabbit,52,4
	.comm	gran,60,4
	.comm	throwCount,4,4
	.comm	score,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
