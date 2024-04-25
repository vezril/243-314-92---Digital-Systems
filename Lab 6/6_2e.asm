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
		
start:		mov	ax,vara+2
		mov	bx,varb+2
		mul	bx
		mov	rez+6,ax
		mov	cx,dx
		mov	ax,vara
		mul	bx
		add	ax,cx
		adc	dx,0
		mov	save+6,ax
		mov	save+4,dx

		mov	ax,vara+6
		mov	bx,varb
		mul	bx
		add	ax,save+6
		adc	dx,0
		mov	rez+4,ax
		mov	cx,dx

		mov	ax,vara
		mul	bx
		add	cx,ax
		adc	dx,0
		add	cx,save+4
		adc	dx,0
		mov	rez+2,cx
		mov	rez,dx
		
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
vara	dw	07fffh,0ffffh
varb	dw	007fh,0ffffh
rez		dw	0,0,0,0
save	dw	0,0,0,0
data	ENDS

		END