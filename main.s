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
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L4
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L4+4
	mov	lr, pc
	bx	r4
	mov	r2, #67108864
	mov	r1, #7168
	mov	r0, #3
	strh	r1, [r2, #8]	@ movhi
	ldr	r3, .L4+8
	mov	r2, #100663296
	ldr	r1, .L4+12
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L4+16
	ldr	r1, .L4+20
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+28
	mov	lr, pc
	bx	r3
	mov	r3, #256
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L4+32
	mov	lr, pc
	bx	r4
	mov	r2, #0
	ldr	r3, .L4+36
	pop	{r4, lr}
	str	r2, [r3]
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
	@ link register save eliminated.
	mov	r3, #67108864
	mov	r2, #4864
	strh	r2, [r3]	@ movhi
	b	goToStart
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
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L9
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L9+4
	mov	lr, pc
	bx	r4
	mov	r2, #67108864
	mov	r1, #7168
	mov	r0, #3
	strh	r1, [r2, #8]	@ movhi
	ldr	r3, .L9+8
	mov	r2, #100663296
	ldr	r1, .L9+12
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L9+16
	ldr	r1, .L9+20
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L9+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L9+28
	mov	lr, pc
	bx	r3
	mov	r3, #256
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L9+32
	mov	lr, pc
	bx	r4
	mov	r2, #1
	ldr	r3, .L9+36
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L10:
	.align	2
.L9:
	.word	DMANow
	.word	directionsPal
	.word	5456
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
	mov	r3, #256
	ldr	r4, .L13
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L13+4
	mov	lr, pc
	bx	r4
	mov	r5, #67108864
	mov	r2, #23552
	mov	r0, #3
	strh	r2, [r5, #8]	@ movhi
	ldr	r3, .L13+8
	mov	r2, #100663296
	ldr	r1, .L13+12
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L13+16
	ldr	r1, .L13+20
	mov	lr, pc
	bx	r4
	ldr	r2, .L13+24
	mov	r3, #1488
	strh	r2, [r5, #10]	@ movhi
	mov	r0, #3
	ldr	r2, .L13+28
	ldr	r1, .L13+32
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L13+36
	ldr	r1, .L13+40
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L13+44
	ldr	r1, .L13+48
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L13+52
	ldr	r1, .L13+56
	mov	lr, pc
	bx	r4
	mov	r0, #0
	mov	r2, #2
	ldr	r1, .L13+60
	ldr	r3, .L13+64
	strh	r0, [r1]	@ movhi
	str	r2, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L14:
	.align	2
.L13:
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
	.word	hOff
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
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L17
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L17+4
	mov	lr, pc
	bx	r4
	mov	r2, #67108864
	mov	r1, #7168
	mov	r0, #3
	strh	r1, [r2, #8]	@ movhi
	ldr	r3, .L17+8
	mov	r2, #100663296
	ldr	r1, .L17+12
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L17+16
	ldr	r1, .L17+20
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L17+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L17+28
	mov	lr, pc
	bx	r3
	mov	r3, #256
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L17+32
	mov	lr, pc
	bx	r4
	mov	r2, #3
	ldr	r3, .L17+36
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L18:
	.align	2
.L17:
	.word	DMANow
	.word	pausePal
	.word	5808
	.word	pauseTiles
	.word	100720640
	.word	pauseMap
	.word	hideSprites
	.word	waitForVBlank
	.word	shadowOAM
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L21
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L21+4
	mov	lr, pc
	bx	r4
	mov	r2, #67108864
	mov	r1, #7168
	mov	r0, #3
	strh	r1, [r2, #8]	@ movhi
	ldr	r3, .L21+8
	mov	r2, #100663296
	ldr	r1, .L21+12
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L21+16
	ldr	r1, .L21+20
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L21+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L21+28
	mov	lr, pc
	bx	r3
	mov	r3, #256
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L21+32
	mov	lr, pc
	bx	r4
	mov	r2, #4
	ldr	r3, .L21+36
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L22:
	.align	2
.L21:
	.word	DMANow
	.word	winPal
	.word	5744
	.word	winTiles
	.word	100720640
	.word	winMap
	.word	hideSprites
	.word	waitForVBlank
	.word	shadowOAM
	.word	state
	.size	goToWin, .-goToWin
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
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L25
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L25+4
	mov	lr, pc
	bx	r4
	mov	r2, #67108864
	mov	r1, #7168
	mov	r3, #5696
	strh	r1, [r2, #8]	@ movhi
	mov	r0, #3
	mov	r2, #100663296
	ldr	r1, .L25+8
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L25+12
	ldr	r1, .L25+16
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L25+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L25+24
	mov	lr, pc
	bx	r3
	mov	r3, #256
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L25+28
	mov	lr, pc
	bx	r4
	mov	r2, #5
	ldr	r3, .L25+32
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L26:
	.align	2
.L25:
	.word	DMANow
	.word	losePal
	.word	loseTiles
	.word	100720640
	.word	loseMap
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
	ldr	r4, .L39
	ldr	r3, .L39+4
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L28
	ldr	r2, .L39+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L37
.L28:
	tst	r3, #128
	beq	.L27
	ldr	r3, .L39+8
	ldrh	r3, [r3]
	tst	r3, #128
	beq	.L38
.L27:
	pop	{r4, lr}
	bx	lr
.L38:
	ldr	r3, .L39+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToGame
.L37:
	bl	goToDirections
	ldrh	r3, [r4]
	b	.L28
.L40:
	.align	2
.L39:
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
	ldr	r3, .L48
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L48+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L41
	ldr	r3, .L48+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L47
.L41:
	pop	{r4, lr}
	bx	lr
.L47:
	ldr	r3, .L48+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToGame
.L49:
	.align	2
.L48:
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
	ldr	r3, .L62
	mov	lr, pc
	bx	r3
	ldr	r3, .L62+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L62+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L62+12
	mov	r3, #256
	mov	r2, #117440512
	ldr	r1, .L62+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	ldr	r2, .L62+20
	ldrh	r2, [r2]
	lsr	r1, r2, #1
	strh	r2, [r3, #16]	@ movhi
	ldr	r4, .L62+24
	strh	r1, [r3, #20]	@ movhi
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L51
	ldr	r2, .L62+28
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L60
.L51:
	tst	r3, #128
	beq	.L50
	ldr	r3, .L62+28
	ldrh	r3, [r3]
	tst	r3, #128
	beq	.L61
.L50:
	pop	{r4, lr}
	bx	lr
.L61:
	pop	{r4, lr}
	b	goToLose
.L60:
	bl	goToPause
	ldrh	r3, [r4]
	b	.L51
.L63:
	.align	2
.L62:
	.word	updateGame
	.word	drawGame
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.word	hOff
	.word	oldButtons
	.word	buttons
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
	ldr	r4, .L76
	ldr	r3, .L76+4
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L65
	ldr	r2, .L76+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L74
.L65:
	tst	r3, #64
	beq	.L64
	ldr	r3, .L76+8
	ldrh	r3, [r3]
	tst	r3, #64
	beq	.L75
.L64:
	pop	{r4, lr}
	bx	lr
.L75:
	pop	{r4, lr}
	b	goToStart
.L74:
	bl	goToGame
	ldrh	r3, [r4]
	b	.L65
.L77:
	.align	2
.L76:
	.word	oldButtons
	.word	waitForVBlank
	.word	buttons
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
	ldr	r3, .L85
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L85+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L78
	ldr	r3, .L85+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L84
.L78:
	pop	{r4, lr}
	bx	lr
.L84:
	pop	{r4, lr}
	b	goToStart
.L86:
	.align	2
.L85:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
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
	ldr	r3, .L99
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r6, .L99+4
	ldr	r8, .L99+8
	ldr	r5, .L99+12
	ldr	fp, .L99+16
	ldr	r10, .L99+20
	ldr	r9, .L99+24
	ldr	r7, .L99+28
	ldr	r4, .L99+32
.L88:
	ldr	r1, [r6]
	ldrh	r3, [r8]
.L89:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r8]	@ movhi
	cmp	r1, #5
	ldrls	pc, [pc, r1, asl #2]
	b	.L89
.L91:
	.word	.L95
	.word	.L94
	.word	.L93
	.word	.L92
	.word	.L90
	.word	.L90
.L90:
	mov	lr, pc
	bx	r7
	b	.L88
.L92:
	ldr	r3, .L99+36
	mov	lr, pc
	bx	r3
	b	.L88
.L93:
	mov	lr, pc
	bx	r9
	b	.L88
.L94:
	mov	lr, pc
	bx	r10
	b	.L88
.L95:
	mov	lr, pc
	bx	fp
	b	.L88
.L100:
	.align	2
.L99:
	.word	goToStart
	.word	state
	.word	buttons
	.word	oldButtons
	.word	startState
	.word	directionsState
	.word	gameState
	.word	loseState
	.word	67109120
	.word	pauseState
	.size	main, .-main
	.text
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
	@ link register save eliminated.
	b	loseState
	.size	winState, .-winState
	.comm	state,4,4
	.comm	hOff,2,2
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.ident	"GCC: (devkitARM release 53) 9.1.0"
