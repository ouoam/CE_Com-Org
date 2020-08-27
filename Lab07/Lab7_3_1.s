	.data
numbers:	.byte 1, 2, 3, 4, 5

	.text
	.global main
main:
	LDR R3, =numbers	@ Load the address for the data in R3
	LDRB R0, [R3, #2]	@ Get the next item in the list
end:
	MOV R7, #1
	SWI 0
