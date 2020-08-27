.global gcd
gcd:
	CMP R0, R1
	BEQ end
	BLT else
	
	SUB R0, R0, R1
	B gcd
else:
	SUB R1, R1, R0
	B gcd
end:
	BX LR
