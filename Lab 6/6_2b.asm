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
		mov	dx,0
		
start:	mov	ax,vara+2
		mov	bx,varb+2
		mul	bx			;marker 1
		mov	rez+6,ax	;marker 1 LSD & Result 1
		mov	save+6,dx	;marker 1 MSD
		mov	ax,vara
		mul	bx			;marker 2
		mov	save+4,ax	;marker 2 LSD
		mov	save+2,dx	;marker 2 MSD
		mov	ax,vara+2
		mov	bx,varb
		mul	bx			;marker 3
		add	ax,save+6	;this makes my Result 2
		adc save+4,0	;carry the one!
		mov	rez+4,ax	;Result 2
		mov	save+6,dx	;marker 3 MSD
		mov ax,vara
		mul	bx
		mov	cx,save+6
		mov	ch,al
		add	cx,save+4	;this should make my Result 3
		adc	save+2,0	;carry the one!
		mov	rez+2,cx	;Result 3 (i think)
		mov	cl,ah
		mov	ch,dl		;this should compose marker 4 MSD
		mov dx,0
		add	cx,save+2	;this should make my Result 4
		add dx,0		;carry the one! (i guess)
		mov rez,cx
		
endian:	mov	ax,rez+6
		mov bh,al
		mov bl,ah
		mov rez+6,bx
		mov ax,rez+4
		mov bh,al
		mov bl,ah
		mov rez+4,bx
		mov ax,rez+2
		mov bh,al
		mov bl,ah
		mov rez+2,bx
		mov ax,rez
		mov bh,al
		mov bl,ah
		mov rez,bx

shi:	mov	ax,4c00h
		int	21h
main	ENDP
code	ENDS
		
		
data	SEGMENT
vara	dw	0ffffh,0ffffh
varb	dw	00ffh,0ffffh
rez		dw	0,0,0,0
save	dw	0,0,0,0
data	ENDS

		END