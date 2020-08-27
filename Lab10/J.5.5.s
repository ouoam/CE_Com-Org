    #-----------------
    # data segment
    #-----------------
		.data
		.balign	4
intro:		.asciz	"wiringPi LED blinking\n"
errMsg:		.asciz	"Setup problem ... Abort!\n"
OUTPUT		= 1	@constant
    #-----------------
    # text segment
    #-----------------
	.text
	.global	main
	.extern	printf
	.extern	wiringPiSetup
	.extern	delay
	.extern	digitalWrite
	.extern	pinMode

main:	PUSH	{ip, lr}	@push link return register on stack segment
	LDR	R0, =intro
	BL	printf
	BL	wiringPiSetup
	MOV	R1,#-1
	CMP	R0, R1
	BNE	init
	LDR	R0, =errMsg
	BL	printf
	B	done
init:
	MOV	R0, #0
	MOV	R1, #OUTPUT
	BL	pinMode
	MOV     R0, #1
	MOV     R1, #OUTPUT
	BL      pinMode
	MOV     R0, #2
	MOV     R1, #OUTPUT
	BL      pinMode
	MOV	R4, #0
	MOV	R5, #7
forLoop:
	CMP	R4, R5
	BGT	done
	MOV	R0, #0
	AND	R1, R4, #1
	BL	digitalWrite
	MOV     R0, #1
	AND     R1, R4, #2
	BL      digitalWrite
	MOV     R0, #2
	AND     R1, R4, #4
	BL      digitalWrite
	MOV	R0, #500
	BL	delay
	ADD	R4, #1
	B	forLoop
done:
	POP	{ip, pc}	@pop return address into pc
