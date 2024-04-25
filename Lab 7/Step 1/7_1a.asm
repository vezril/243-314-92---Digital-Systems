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

start:	mov	ax,100h
		mov	bx,5
		div	bx
		add	ax,01
		mov	rez,al
		
shi:	mov	ax,4c00h
		int	21h
	
main	ENDP
code	ENDS

data	SEGMENT
rez		db	0
data	ENDS

		END