asect 0x00

start: 					#infinite game
	jsr PlayerTurn 
	jsr AiTurn
br start

PlayerTurn:
	ldi r1, 0xf3    #adress of button cell
	loop: 			#endless waiting until r0 is equal zero
	ld r1, r0 		#if player make a turn then increment r0
	tst r0
	bz loop
	ldi r0, 0			#return to the original value (to zero)
	st r1, r0 		#end of turn
	rts 

AiTurn:
	ldi r0, 0
	while			#scan field
		ldi r1,9
		cmp r0,r1
	stays nz
		ldi r1,field_mas
		add r0,r1
		ldi r2,0xF1
		ld r2,r2
		st r1,r2
		inc r0
	wend 		 
	ldi r1,field_mas + 4 #check the center cell for emptiness
	ld r1, r2
	ldi r0,0
	if 
		cmp r2,r0
	is eq
		ldi r1, 4
		ldi r0,0xf2 	#cell's adress where bot puts botSymbol
		st r0, r1
	else 
		ldi r1,field_mas
		ld r1, r2
		ldi r0,0
		if 
			cmp r2,r0
		is eq
			ldi r1, 0
			ldi r0,0xf2
			st r0, r1
			br emp 		#skipping other checks
		fi
		ldi r1,field_mas + 8
		ld r1, r2
		ldi r0,0
		if 
			cmp r2,r0
		is eq
			ldi r1, 8
			ldi r0,0xf2
			st r0, r1
			br emp 		
		fi
		ldi r1,field_mas + 1
		ld r1, r2
		ldi r0,0
		if 
			cmp r2,r0
		is eq
			ldi r1, 1
			ldi r0,0xf2
			st r0, r1
			br emp 		
		fi
		ldi r1,field_mas + 2
		ld r1, r2
		ldi r0,0
		if 
			cmp r2,r0
		is eq
			ldi r1, 2
			ldi r0,0xf2
			st r0, r1
			br emp 		
		fi
		ldi r1,field_mas + 6
		ld r1, r2
		ldi r0,0
		if 
			cmp r2,r0
		is eq
			ldi r1, 6
			ldi r0,0xf2
			st r0, r1
			br emp 		
		fi
		ldi r1,field_mas + 3
		ld r1, r2
		ldi r0,0
		if 
			cmp r2,r0
		is eq
			ldi r1, 3
			ldi r0,0xf2
			st r0, r1
			br emp 		
		fi 
		ldi r1,field_mas + 5
		ld r1, r2
		ldi r0,0
		if 
			cmp r2,r0
		is eq
			ldi r1, 5
			ldi r0,0xf2
			st r0, r1
			br emp 		
		fi
		ldi r1,field_mas + 7
		ld r1, r2
		ldi r0,0
		if 
			cmp r2,r0
		is eq
			ldi r1, 7
			ldi r0,0xf2
			st r0, r1
			br emp 		
		fi
		emp:
	fi
	rts
	
botSymbol: dc 9
field_mas: ds 9
end