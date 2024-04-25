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

start:	mov	ax,a
		mov	bx,b
		div	bx
		mov	rez,ax
		
		mov	ax,a+2
		div	bx
		mov	rez+2,ax
		
		mov	ax,a+4
		div	bx
		mov	rez+4,ax
		
endian:	mov	ax,rez
		mov	bh,al
		mov	bl,ah
		mov	rez,ax
		mov	ax,rez+2
		mov	bh,al
		mov	bl,ah
		mov	rez+2,ax
		mov	ax,rez+4
		mov	bh,al
		mov	bl,ah
		mov	rez+4,ax
		
shi:	mov	ax,4c00h
		int	21h
	
main	ENDP
code	ENDS

data	SEGMENT
a		dw	1234h,5647h,89ABh
b		dw	0CDEFh
save	dw	0,0,0
rez		dw	0,0
data	ENDS

		END