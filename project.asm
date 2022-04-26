asect 0x00


# 0xF1 - чип для получения поля передает массив за 9 обращений
# 0xF2 - чип хода на вход номер ячейки от 0 до 8
# 0xF3 - чип передающий инфу о текущем игроке 1 нолик

#### ожидание своего хода ####
#ldi r0,0xF3 для тестирования
#ldi r1,1
#st r0,r1
wait: 
while
	ldi r0,0
	tst r0
stays z
	ldi r0,0xF3
	ld r0,r0
	if 
		ldi r1,1
		cmp r1,r0
	is z
		jsr maketurn
	fi
wend	

#### конец блока ####

### совершаем ход ###	
maketurn:
# записываем поле в массив 
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
# ищем первое попавшееся место
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
#ldi r0,0xF3 для тестирования
#ldi r1,0
#st r0,r1
rts
jsr wait # потому что rts не работает
###  конец блока ###

### завершение работы при конце игры ###
endgame: halt
###  конец блока ###
field_mas: ds 9 #массив поля 
end