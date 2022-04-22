asect 0x00


# 0xF1 - чип для получения поля передает массив за 9 обращений
# 0xF2 - чип хода на вход пока хз что
# 0xF3 - чип передающий инфу о текущем игроке 1 нолик
### ожидание своего хода ###
wait: 
while
stays nz
	ldi r0,0xF3
	ld r0,r0
	if 
		ldi r1,1
		cmp r1,r0
	is z
		jsr maketurn
	fi
wend
### совершаем ход ###	
maketurn: 
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
ldi r0,0
while 
	ldi r1,8
	cmp r0,r1
stays nz
	ldi r1,field_mas
	add r0,r1
	ld r1,r1
	if 
		tst r1
	is z
		ldi r2,0xF2
		st r2,r0
		break
	fi
	inc r0
wend

rts


field_mas: ds 9
end