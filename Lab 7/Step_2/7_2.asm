; PROGRAM: 7_1a.ASM
;
; AUTHOR: Calvin O. Ference
;
; DESCRIPTION:  Division program
; 
; 

        ASSUME	cs:code, ds:data

code    SEGMENT
main    PROC   

init:	mov	ax,data
		mov	ds,ax
		mov	ax,0
		mov	bx,0
		mov	dx,0 

start:	add	b,3
		mov	ax,a
		mul	b
		mov	save,dx
		mov	bx,0fh
		mul	bx
		mov	save+4,ax
		mov	save+2,dx
		mov	ax,save
		mul	bx
		add	ax,save+2
		mov	dx,0
		mov	bx,8
		div	bx
		mov	rez,ax
		mov	ax,save+4

		div	bx
		mov	rez+2,ax	
		
endian:	mov	ax,rez
		mov	bh,al
		mov	bl,ah
		mov	rez,bx	
		mov	ax,rez+2
		mov	bh,al
		mov	bl,ah
		mov	rez+2,bx	;so it looks "nice"
		
shi:	mov	ax,4c00h
		int	21h
	
main	ENDP
code	ENDS

data	SEGMENT
a		dw	0001h
b		dw	0001h
save	dw	0,0,0
rez		dw	0,0
data	ENDS

		END