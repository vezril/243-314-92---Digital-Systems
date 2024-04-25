; PROGRAM: ascii2word.ASM
;
; AUTHOR: Calvin O. Ference
;
; DESCRIPTION:  converts an 5 digit ascii into a word
; 
; Version:	1.0	
; ENTER CONDITIONS : A 5 digit ascii value must be stored in a string and SI must have it point at the string
; EXIT CONDITIONS  : the result will appear in AX
	
	PUBLIC	ascii2word
        ASSUME	cs:code, ds:data
	EXTRN	outstr:FAR, newline:FAR

code	SEGMENT
ascii2word	PROC	FAR
init:	push	bx
	push	cx
	mov	ax,0		;just making sure it's empty

range:	mov	al,[si]
	cmp	al,"6"
	ja	outr
	je	range2
	jmp	conv

range2:	inc	si
	mov	al,[si]
	cmp	al,"5"
	ja	outr
	je	range3
	dec	si
	jmp	conv

range3:	inc	si
	mov	al,[si]
	cmp	al,"5"
	ja	outr
	je	range4
	dec	si
	dec	si
	jmp	conv

range4:	inc	si
	mov	al,[si]
	cmp	al,"3"
	ja	outr
	je	range5
	sub	si,3
	jmp	conv

range5:	inc	si
	mov	al,[si]
	cmp	al,"5"
	ja	outstr
	sub	si,4
	jmp	conv

conv:	mov	al,[si]
	sub	al,30h
	mov	bx,2710h	;algorith for converting for 10^4
	mul	bx
	mov	cx,ax		;moving it to a safe spot for now
	inc	si		;next mem location
	mov	al,[si]
	mov	ah,0		;making sure it's empty
	mov	bx,03e8h	;algorithm for 10^3
	sub	al,30h
	mul	bx
	add	cx,ax		;adding to values together
	mov	ax,0		;clearing out ax
	inc	si		;next mem locatio
	mov	al,[si]
	sub	al,30h
	mov	bx,64h		;algorithm for 10^2
	mul	bx
	add	cx,ax
	inc	si
	mov	ax,0
	mov	al,[si]
	sub	al,30h
	mov	bx,0ah
	mul	bx
	add	cx,ax
	inc	si
	mov	al,[si]
	sub	al,30h
	add	cl,al
	mov	ax,cx
	pop	cx
	pop	bx
	ret

	

outr:	lea	di,msg1
	call	newline
	call	outstr
	mov	ax,4c00h
	int	21h

ascii2word	ENDP
code	ENDS

data	SEGMENT
msg1	db	"Value is out of range to fit in one word",04
data	ENDS
	END



