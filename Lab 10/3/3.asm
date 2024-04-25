; PROGRAM: 3.ASM
;
; AUTHOR: Calvin O. Ference
;
; DESCRIPTION:  Fahrenheit to Celcius Conversion Program with I/O
; 
; 

        ASSUME	cs:code, ds:data, ss:stak
	EXTRN	getbyte:FAR, newline:FAR, outstr:FAR, outbyte:FAR

code    SEGMENT
main    PROC   

init:	mov	ax,data
		mov	ds,ax
		mov	ax,0
		mov	bx,0
		mov	eflag,0 
hajime:	lea	di,msg1
	call	outstr
	call	getbyte
	mov	fah,al
	call	newline

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
		
shi:	lea	di,msg2
	call	outstr
	mov	al,cel
	call	outbyte
	mov	ax,4c00h
	int	21h

error:	mov	eflag,0FFh
	lea	di,msg3
	call	outstr
	call	newline
	jmp	shi
	
main	ENDP
code	ENDS

data	SEGMENT
fah	db	0
cel	db	0
eflag	db	0
msg1	db	"Enter a hex Value between 32h and C8h > ",04h
msg2	db	"Answer is > ",04h
msg3	db	"Out of Range, go to the Infinite Perspective Vortex",04h
data	ENDS

stak	SEGMENT	STACK
	dw	256 dup (0)
stak	ends

		END