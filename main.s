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
	.global	goToStart
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r3, #256
	ldr	r4, .L4
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L4+4
	mov	lr, pc
	bx	r4
	mov	r5, #67108864
	mov	r2, #7168
	mov	r0, #3
	strh	r2, [r5, #8]	@ movhi
	ldr	r3, .L4+8
	mov	r2, #100663296
	ldr	r1, .L4+12
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L4+16
	ldr	r1, .L4+20
	mov	lr, pc
	bx	r4
	mov	r2, #1
	ldr	r1, .L4+24
	ldr	r3, .L4+28
	ldr	r0, .L4+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+36
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+40
	mov	lr, pc
	bx	r3
	mov	r3, #256
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L4+44
	mov	lr, pc
	bx	r4
	mov	r3, #0
	ldr	r2, .L4+48
	strh	r3, [r5, #16]	@ movhi
	str	r3, [r2]
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	DMANow
	.word	titlescreenPal
	.word	6944
	.word	titlescreenTiles
	.word	100720640
	.word	titlescreenMap
	.word	374400
	.word	playSoundA
	.word	mainsong
	.word	hideSprites
	.word	waitForVBlank
	.word	shadowOAM
	.word	state
	.size	goToStart, .-goToStart
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
	mov	r2, #67108864
	mov	r1, #4864
	push	{r4, lr}
	ldr	r3, .L8
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+4
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToStart
.L9:
	.align	2
.L8:
	.word	setupSounds
	.word	setupInterrupts
	.size	initialize, .-initialize
	.align	2
	.global	goToDirections
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToDirections, %function
goToDirections:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r2, #0
	mov	r5, #67108864
	ldr	r4, .L12
	strh	r2, [r5, #16]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L12+4
	mov	lr, pc
	bx	r4
	mov	r2, #7168
	mov	r3, #6528
	strh	r2, [r5, #8]	@ movhi
	mov	r0, #3
	mov	r2, #100663296
	ldr	r1, .L12+8
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L12+12
	ldr	r1, .L12+16
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L12+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L12+24
	mov	lr, pc
	bx	r3
	mov	r3, #256
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L12+28
	mov	lr, pc
	bx	r4
	mov	r2, #1
	ldr	r3, .L12+32
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L13:
	.align	2
.L12:
	.word	DMANow
	.word	directionsPal
	.word	directionsTiles
	.word	100720640
	.word	directionsMap
	.word	hideSprites
	.word	waitForVBlank
	.word	shadowOAM
	.word	state
	.size	goToDirections, .-goToDirections
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r5, #67108864
	ldr	r3, .L16
	ldrh	r1, [r3]
	ldr	r4, .L16+4
	strh	r1, [r5, #16]	@ movhi
	mov	r3, #256
	strh	r1, [r5, #20]	@ movhi
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L16+8
	mov	lr, pc
	bx	r4
	mov	r2, #23552
	mov	r0, #3
	strh	r2, [r5, #8]	@ movhi
	ldr	r3, .L16+12
	mov	r2, #100663296
	ldr	r1, .L16+16
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L16+20
	ldr	r1, .L16+24
	mov	lr, pc
	bx	r4
	ldr	r2, .L16+28
	mov	r3, #1488
	strh	r2, [r5, #10]	@ movhi
	mov	r0, #3
	ldr	r2, .L16+32
	ldr	r1, .L16+36
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L16+40
	ldr	r1, .L16+44
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L16+48
	ldr	r1, .L16+52
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	ldr	r2, .L16+56
	mov	r0, #3
	ldr	r1, .L16+60
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L16+64
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L17:
	.align	2
.L16:
	.word	hOff
	.word	DMANow
	.word	housePal
	.word	12128
	.word	houseTiles
	.word	100720640
	.word	houseMap
	.word	24072
	.word	100696064
	.word	skyTiles
	.word	100724736
	.word	skyMap
	.word	83886592
	.word	spritesheetPal
	.word	100728832
	.word	spritesheetTiles
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r6, #67108864
	mov	r5, #0
	ldr	r4, .L20
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	strh	r5, [r6, #16]	@ movhi
	ldr	r1, .L20+4
	mov	lr, pc
	bx	r4
	mov	r2, #7168
	mov	r0, #3
	strh	r2, [r6, #8]	@ movhi
	ldr	r3, .L20+8
	mov	r2, #100663296
	ldr	r1, .L20+12
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L20+16
	ldr	r1, .L20+20
	mov	lr, pc
	bx	r4
	mov	r2, r5
	ldr	r1, .L20+24
	ldr	r3, .L20+28
	ldr	r0, .L20+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L20+36
	mov	lr, pc
	bx	r3
	ldr	r3, .L20+40
	mov	lr, pc
	bx	r3
	mov	r3, #256
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L20+44
	mov	lr, pc
	bx	r4
	mov	r2, #3
	ldr	r3, .L20+48
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L21:
	.align	2
.L20:
	.word	DMANow
	.word	pausePal
	.word	5808
	.word	pauseTiles
	.word	100720640
	.word	pauseMap
	.word	2086560
	.word	playSoundB
	.word	pausesong
	.word	hideSprites
	.word	waitForVBlank
	.word	shadowOAM
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r5, #0
	mov	r6, #67108864
	ldr	ip, .L24
	ldr	r4, .L24+4
	strh	r5, [r6, #16]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L24+8
	strh	r5, [ip]	@ movhi
	mov	lr, pc
	bx	r4
	mov	r2, #7168
	mov	r0, #3
	strh	r2, [r6, #8]	@ movhi
	ldr	r3, .L24+12
	mov	r2, #100663296
	ldr	r1, .L24+16
	mov	lr, pc
	bx	r4
	ldr	r2, .L24+20
	ldr	r1, .L24+24
	mov	r3, #1024
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L24+28
	mov	lr, pc
	bx	r3
	mov	r2, r5
	ldr	r1, .L24+32
	ldr	r3, .L24+36
	ldr	r0, .L24+40
	mov	lr, pc
	bx	r3
	ldr	r3, .L24+44
	mov	lr, pc
	bx	r3
	ldr	r3, .L24+48
	mov	lr, pc
	bx	r3
	mov	r3, #256
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L24+52
	mov	lr, pc
	bx	r4
	mov	r2, #5
	ldr	r3, .L24+56
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L25:
	.align	2
.L24:
	.word	hOff
	.word	DMANow
	.word	losePal
	.word	5648
	.word	loseTiles
	.word	100720640
	.word	loseMap
	.word	stopSound
	.word	41542
	.word	playSoundB
	.word	losesong
	.word	hideSprites
	.word	waitForVBlank
	.word	shadowOAM
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	startState
	.syntax unified
	.arm
	.fpu softvfp
	.type	startState, %function
startState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L38
	ldr	r3, .L38+4
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L27
	ldr	r2, .L38+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L36
.L27:
	tst	r3, #128
	beq	.L26
	ldr	r3, .L38+8
	ldrh	r3, [r3]
	tst	r3, #128
	beq	.L37
.L26:
	pop	{r4, lr}
	bx	lr
.L37:
	ldr	r3, .L38+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToGame
.L36:
	bl	goToDirections
	ldrh	r3, [r4]
	b	.L27
.L39:
	.align	2
.L38:
	.word	oldButtons
	.word	waitForVBlank
	.word	buttons
	.word	initGame
	.size	startState, .-startState
	.align	2
	.global	directionsState
	.syntax unified
	.arm
	.fpu softvfp
	.type	directionsState, %function
directionsState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L47
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L47+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L40
	ldr	r3, .L47+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L46
.L40:
	pop	{r4, lr}
	bx	lr
.L46:
	ldr	r3, .L47+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToGame
.L48:
	.align	2
.L47:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	initGame
	.size	directionsState, .-directionsState
	.align	2
	.global	gameState
	.syntax unified
	.arm
	.fpu softvfp
	.type	gameState, %function
gameState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L56
	mov	lr, pc
	bx	r3
	ldr	r3, .L56+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L56+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L56+12
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L56+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	ldr	r2, .L56+20
	ldrh	r2, [r2]
	lsr	r1, r2, #1
	strh	r2, [r3, #16]	@ movhi
	ldr	r2, .L56+24
	strh	r1, [r3, #20]	@ movhi
	ldrh	r3, [r2]
	tst	r3, #8
	beq	.L49
	ldr	r3, .L56+28
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L55
.L49:
	pop	{r4, lr}
	bx	lr
.L55:
	ldr	r3, .L56+32
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToPause
.L57:
	.align	2
.L56:
	.word	updateGame
	.word	drawGame
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.word	hOff
	.word	oldButtons
	.word	buttons
	.word	pauseSound
	.size	gameState, .-gameState
	.align	2
	.global	pauseState
	.syntax unified
	.arm
	.fpu softvfp
	.type	pauseState, %function
pauseState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L70
	ldr	r3, .L70+4
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L59
	ldr	r2, .L70+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L68
.L59:
	tst	r3, #64
	beq	.L58
	ldr	r3, .L70+8
	ldrh	r3, [r3]
	tst	r3, #64
	beq	.L69
.L58:
	pop	{r4, lr}
	bx	lr
.L69:
	ldr	r3, .L70+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToStart
.L68:
	ldr	r3, .L70+12
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldr	r3, .L70+16
	mov	r2, #1
	ldr	r1, .L70+20
	ldr	r0, .L70+24
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	b	.L59
.L71:
	.align	2
.L70:
	.word	oldButtons
	.word	waitForVBlank
	.word	buttons
	.word	stopSound
	.word	playSoundA
	.word	374400
	.word	mainsong
	.size	pauseState, .-pauseState
	.align	2
	.global	loseState
	.syntax unified
	.arm
	.fpu softvfp
	.type	loseState, %function
loseState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L79
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L79+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L72
	ldr	r3, .L79+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L78
.L72:
	pop	{r4, lr}
	bx	lr
.L78:
	ldr	r3, .L79+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToStart
.L80:
	.align	2
.L79:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	stopSound
	.size	loseState, .-loseState
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
	mov	r2, #67108864
	mov	r1, #4864
	push	{r4, r7, fp, lr}
	ldr	r3, .L93
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r3, .L93+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L93+8
	mov	lr, pc
	bx	r3
	ldr	r6, .L93+12
	ldr	r7, .L93+16
	ldr	r5, .L93+20
	ldr	fp, .L93+24
	ldr	r10, .L93+28
	ldr	r9, .L93+32
	ldr	r8, .L93+36
	ldr	r4, .L93+40
.L82:
	ldr	r1, [r6]
	ldrh	r3, [r7]
.L83:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r7]	@ movhi
	cmp	r1, #5
	ldrls	pc, [pc, r1, asl #2]
	b	.L83
.L85:
	.word	.L89
	.word	.L88
	.word	.L87
	.word	.L86
	.word	.L83
	.word	.L84
.L84:
	ldr	r3, .L93+44
	mov	lr, pc
	bx	r3
	b	.L82
.L86:
	mov	lr, pc
	bx	r8
	b	.L82
.L87:
	mov	lr, pc
	bx	r9
	b	.L82
.L88:
	mov	lr, pc
	bx	r10
	b	.L82
.L89:
	mov	lr, pc
	bx	fp
	b	.L82
.L94:
	.align	2
.L93:
	.word	setupSounds
	.word	setupInterrupts
	.word	goToStart
	.word	state
	.word	buttons
	.word	oldButtons
	.word	startState
	.word	directionsState
	.word	gameState
	.word	pauseState
	.word	67109120
	.word	loseState
	.size	main, .-main
	.comm	state,4,4
	.comm	hOff,2,2
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.ident	"GCC: (devkitARM release 53) 9.1.0"
