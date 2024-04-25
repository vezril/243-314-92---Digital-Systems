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
		
start:	mov ax,vara+2
		mov	bx,varb+2
		mul bx
		mov	rez+6,ax
		mov	cx,dx
		mov	ax,vara
		mul	bx
		mov	save+6,ax
		mov	save+4,dx
		
part2:	mov	ax,vara+2
		mov	bx,varb+2
		mul	bx
		mov	save+2,dx
		add	cx,ax
		adc	save+6,0
		adc	save+4,0
		mov	rez+4,cx
		mov	ax,vara
		mul	bx
		mov cx,save+2
		mov	bx,0
		mov	bl,cl
		mov	bh,al
		add	bx,save+6
		adc save+4,0
		mov	rez+2,bx
		mov	bl,ah
		mov	bh,dl
		add	bx,save+4
		mov	rez,bx	

bigend:	mov ax,rez
		mov	bh,al
		mov	bl,ah
		mov	rez,bx
		mov ax,rez+2
		mov	bh,al
		mov	bl,ah
		mov	rez+2,bx
		mov ax,rez+4
		mov	bh,al
		mov	bl,ah
		mov	rez+4,bx
		mov ax,rez+6
		mov	bh,al
		mov	bl,ah
		mov	rez+6,bx
		
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