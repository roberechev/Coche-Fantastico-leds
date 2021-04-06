

/***********************************************************
					Coche fantastico
					   roberechev
***********************************************************/
ser r16
out ddrd, r16
main:
	;desplazamiento izquierda
	ldi r16, 1
	repetirL:
		out portd,r16 ; inicializar puerto D como salida

	;delay 200ms
	CALL funcionDelay200ms ;Guarda el puntero de retorno(Para poder volver al mismo punto) y hace un salto a la funcion (ocupa 2 espacios en la pila dr RAM)
	
		lsl r16 ;multiplicador por 2 para desplazar a la izquierda
		cpi r16, 0
		brne repetirL

	;desplazamiento derecha
	ldi r16, 64
	repetirR:
		out portd,r16

    ;delay 200ms
	CALL funcionDelay200ms ;Guarda el puntero de retorno(Para poder volver al mismo punto) y hace un salto a la funcion
	
		lsr r16 ;divisor por 2 para desplazar a la derecha
		cpi r16, 1
		brne repetirR

	rjmp main

/***********************************************************
				 Fin Coche Fantastico
***********************************************************/


/***********************************************************
					delay 200ms
***********************************************************/

funcionDelay200ms:
		push r16
		push r17 ;guardo en una pila de la ram los registros (como copia de seguridad)
		push r18
			ldi  r16, 5
			ldi  r17, 15
			ldi  r18, 242
		L1: dec  r18
			brne L1
			dec  r17
			brne L1
			dec  r16
			brne L1
		pop r18
		pop r17 ;recuperas de la pila de la ram el valor guardado del registro (recuperas copia de seguridad)
		pop r16
			RET ;Vuelves al puntero guardado con la instruccion CALL