; PROGRAM: 6_3.ASM
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
		mov ax,0
		mov	bx,0		;making sure they are all zeros

start:		mov al,varb
		add al,3
		adc ah,0
		mov bl,vara
		mul bx
		mov bx,000fh
		mul bx
		sub ax,8
		mov rez,ax

		
shi:	mov	ax,4c00h
		int	21h
main	ENDP
code	ENDS
		
		
data	SEGMENT
vara	db	01h
varb	db	1h
rez		dw	0
data	ENDS

		END