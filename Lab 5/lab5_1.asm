; PROGRAM: lab6_1.ASM
;
; AUTHOR: Calvin O. Ference
;
; DESCRIPTION:  
; 
; 

        ASSUME	cs:code, ds:data

code    SEGMENT
main    PROC    

init:
	mov	ax,data
	mov	ds,ax
	mov	ah,0
     
arith:
	mov	al,byte1	;wax on
	add	al,byte2	;begin arith op
	adc	ah,0		;just to take care of any carry
	add	al,byte3
	adc	ah,0
	add	al,byte4
	adc	ah,0
	add	al,byte5
	adc	ah,0
	add	al,byte6
	adc	ah,0
	add	al,byte7
	adc	ah,0
	add	al,byte8
	adc	ah,0
	add	al,byte9
	adc	ah,0
	add	al,byte10
	adc	ah,0
	add	al,byte11
	adc	ah,0
	add	al,byte12
	adc	ah,0
	add	al,byte13
	adc	ah,0
	add	al,byte14
	adc	ah,0     	;end arith op
	mov	resm,ah		;wax off
	mov	resl,al

shi:	mov	ax,4c00h
        int	21h

main    ENDP
code    ENDS

data	SEGMENT
mkr1	dw	0FFFFh	;start marker   
byte1	DB	0A5h
byte2	DB	7bh
byte3	DB	6eh
byte4 	DB	2dh
byte5	DB	1fh
byte6	DB	0ch
byte7	DB	77h
byte8	DB	99h
byte9	DB	10h
byte10	DB	0bbh
byte11	DB	3dh
byte12	DB	43h
byte13	DB	55h
byte14	DB	0AAh
resm	DB	?	;MSB for result
resl	DB	?	;LSB for result
mkr2	dw	0FFFFh	;end marker
data	ENDS
        END    
