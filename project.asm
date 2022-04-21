asect 0x00
ldi r0,0
while
	
	ldi r1,8
	cmp r0,r1
stays nz
	ldi r1,field_mas
	add r0,r1
	ldi r2,0xF1
	ld r2,r2
	st r1,r2
	inc r0
wend
halt

field_mas: ds 9
end