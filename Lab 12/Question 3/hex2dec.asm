; PROGRAM: hex2dec.ASM
;
; AUTHOR: Calvin O. Ference
;
; DESCRIPTION:  Hexadicaml (one byte) to decimal converter
; 
; Version:	3.2	
; ENTER CONDITIONS : hex value to convert needs to be in al
; EXIT CONDITIONS  : the result will appear in ax
	
	PUBLIC	hex2dec
        ASSUME	cs:code

code	SEGMENT
hex2dec	PROC	FAR
init:	push	bx
	push	cx
	push	dx
	mov	ah,0
	mov	dx,0
	mov	cx,0

start:	mov	bx,100
	div	bl
	mov	ch,al
	mov	al,0
	xchg	ah,al
	mov	bl,10
	div	bl
	mov	cl,ah	;moving my remainder out of the way
	mov	ah,0
	mov	bl,16
	mul	bl
	add	cl,al
	mov	ax,cx	
	pop	dx
	pop	cx
	pop	bx
	ret
hex2dec	ENDP
code	ENDS
	END



