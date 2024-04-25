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
		mul	bx			;bleh i hope this time it'll work
		mov	rez+6,ax	; Result 1
		mov	save,dx		;A1 (note these are reference markers on notes)
		
		mov	ax,vara
		mul	bx
		mov	save+2,dx	;A2
		mov	save+4,ax	;B2
		
		mov	ax,vara+2
		mov	bx,varb
		mul	bx
		
		add	ax,save
		adc	save+4,0
		mov	ax,rez+4	;Result 2
		
		add	dx,save+4
		adc	save+2,0
		
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