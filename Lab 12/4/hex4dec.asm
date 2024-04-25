; PROGRAM: hex4dec.ASM
;
; AUTHOR: Calvin O. Ference
;
; DESCRIPTION:  Hexadicaml (one byte) to decimal converter
; 
; Version:	1.0	
; ENTER CONDITIONS : hex value to convert needs to be in ax
; EXIT CONDITIONS  : the result will appear in ax and dx
	
	PUBLIC	hex4dec
        ASSUME	cs:code

code	SEGMENT
hex4dec	PROC	FAR
init:	push	bx
	push	cx
	mov	dx,0
	mov	cx,0

start:	mov	bx,1000
	div	bx
	mov	bx,10
	div	bl
	mov	cl,ah
	mov	ah,0
	push	ax		;this is my 10^4 i'l grab him later when i'm done
	mov	ax,0
	mov	ah,cl
	mov	bx,10h
	push	dx
	mul	bx
	mov	cx,ax
	pop	ax
	mov	bx,100
	div	bl
	mov	dx,ax
	and	ax,000fh
	and	dx,0ff00h
	mov	bx,100h
	push	dx
	mul	bx
	add	cx,ax
	mov	ax,0
	pop	dx
	mov	al,dh
	mov	bx,10
	div	bl
	add	cl,ah
	and	ax,000fh
	mov	bx,10h
	mul	bx
	add	ax,cx
	pop	dx
	pop	cx
	pop	bx
	ret
hex4dec	ENDP
code	ENDS
	END



