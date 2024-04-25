; PROGRAM: 6_1a.ASM
;
; AUTHOR: Calvin O. Ference
;
; DESCRIPTION:  Multiplication program
; 
; 

        ASSUME	cs:code, ds:data

code    SEGMENT
main    PROC    
init:	mov	ax,data
		mov	ds,ax
		mov	cx,0
		mov dx,0
		
start:	mov	ax,vara+2
	mov	bx,varb+2
	mul	bx
	mov	rez+6,ax	;D (these are markers from hand notes)
	mov	save1+4,dx	;C
	mov	ax,vara
	mul	bx
	mov	save1+2,ax	;B
	mov	save1,dx	;A
	mov	ax,vara+2
	mov	bx,varb
	mul	bx
	mov	save2+6,ax	;H
	mov	save2+4,dx	;G
	mov	ax,vara
	mul	bx
	mov	save2+2,ax	;F
	mov	save2,dx	;E

modif:	mov	ax,save2+4
	mov	cl,ah
	mov	bx,save2+2
	mov	ah,bl
	mov	save2+4,ax
	mov	ax,save2
	mov	ch,al
	mov	save2,cx


addit:	mov	ax,save1+4
	add	ax,save2+6
	adc	save1+2,0
	mov	rez+4,ax
	mov	ax,save1+2
	add	ax,save2+2
	adc	save1,0
	mov	rez+2,ax

	mov	ax,save1
	add	ax,save2
	mov	rez,ax

endian:	mov	ax,rez+6
	mov	bh,al
	mov	bl,ah
	mov	ax,rez+6
	mov	ax,rez+4
	mov	bh,al
	mov	bl,ah
	mov	ax,rez+4
	mov	ax,rez+2
	mov	bh,al
	mov	bl,ah
	mov	ax,rez+2
	mov	ax,rez
	mov	bh,al
	mov	bl,ah
	mov	ax,rez		
		
shi:	mov	ax,4c00h
		int	21h
main	ENDP
code	ENDS
		
		
data	SEGMENT
vara	dw	0ffffh,0ffffh
varb	dw	00ffh,0ffffh
rez	dw	0,0,0,0
save1	dw	0,0,0,0
save2	dw	0,0,0,0
data	ENDS

		END