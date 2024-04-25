; PROGRAM: nibadd.ASM
;
; AUTHOR: Calvin O. Ference
;
; DESCRIPTION:  Byte Nibble Add
; 
; Version:	1.0	
; ENTER CONDITIONS : must have di point at the desired data segment
; EXIT CONDITIONS  : the result will be stored in al as max value it can reach is 3Ch
	
	PUBLIC	nibadd
        ASSUME	cs:code

code	SEGMENT
nibadd	PROC	FAR
init:	push	bx
	push	cx
	mov	cl,4

start:	mov	ax,[di]
	mov	bx,ax
	and	ax,0F0Fh	;masks the MS nibble
	and	bx,0F0F0h	;masks the LS nibble
	ror	bx,cl		;moves the bits to the right so that it's one byte value
	add	bl,bh		;adds them together
	add	al,ah		;adds these together as well
	add	al,bl		;and makes up the final sum
	mov	ah,0		;just to erase any unessary data
	pop	cx		;returns any previous value stored
	pop	bx
	ret
nibadd	ENDP
code	ENDS
	END



