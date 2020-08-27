	.global main
main:
	MOV  R1, #1
	MOV  R2, #2
	
	@ Push (store) R1 onto stack, then subtract SP by 4 bytes
	@ The ! (Write-Back symbol) updates the register SP
	STR  R1, [sp, #-4]!
	STR  R2, [sp, #-4]!

	@ Pop (load) the value and add 4 to SP
	LDR  R0, [sp], #+4
	LDR  R0, [sp], #+4
end:
	MOV  R7, #1
	SWI  0
