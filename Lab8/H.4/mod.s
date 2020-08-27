.global mod
mod:
	CMP R0, R1
	BLT end
	SUB R0, R0, R1
	B mod
end:
	BX LR
