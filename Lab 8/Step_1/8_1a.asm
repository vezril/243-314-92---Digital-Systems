; PROGRAM: 8_1.ASM
;
; AUTHOR: Calvin O. Ference
;
; DESCRIPTION:  Fahrenheit to Celcius Conversion Program
; 
; 

        ASSUME	cs:code, ds:data

code    SEGMENT
main    PROC   

init:	mov	ax,data
		mov	ds,ax
		mov	ax,0
		mov	bx,0
		mov	eflag,0 

start:	mov	al,fah
	cmp	al,32h
	jb	error
	cmp	al,0c8h
	ja	error
	sub	al,20h
	mov	bl,5
	mul	bl
	mov	bl,9
	div	bl
	mov	cel,al
		
shi:	mov	ax,4c00h
	int	21h

error:	mov	eflag,0FFh
	jmp	shi
	
main	ENDP
code	ENDS

data	SEGMENT
fah	db	0C8h
cel	db	0
eflag	db	0
data	ENDS

		END