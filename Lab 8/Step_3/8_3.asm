; PROGRAM: 8_2.ASM
;
; AUTHOR: Calvin O. Ference
;
; DESCRIPTION:  Parallel Resistance Calculator Program
; 
; 

        ASSUME	cs:code, ds:data

code    SEGMENT
main    PROC   

init:		mov	ax,data
		mov	ds,ax
		mov	eflag,0		;resetting everything 

ahigh:		cmp	vara,02
		ja	errora
		cmp	vara+2,0ab98h
		ja	errora
alow:		cmp	vara+2,09c4h
		jb	errora
		jmp	bhigh


bhigh:		cmp	varb,61a8h
		ja	errorb
blow:		cmp	varb,0c8h
		jb	errorb

chigh:		cmp	varc,7fh
		jg	errorc
clow:		cmp	varc,-32
		jl	errorc
shi:		mov	ax,4c00h
		int	21h

errora:		mov	eflag,01
		jmp	bhigh

errorb:		cmp	eflag,01
		je	errorb2
		mov	eflag,02
		jmp	chigh

errorb2:	mov	eflag,0Ah
		jmp	chigh

errorc:		cmp	eflag,01
		je	errorc2
		cmp	eflag,02
		je	errorc3
		cmp	eflag,0ah
		je	errorc4
		mov	eflag,04
		jmp	shi
	
errorc2:	mov	eflag,0bh
		jmp	shi
		
errorc3:	mov	eflag,0ch
		jmp	shi	
	
errorc4:	mov	eflag,0ffh
		jmp	shi

main	ENDP
code	ENDS

data	SEGMENT
vara	dw	2,0ab98h
varb	dw	61a8h
varc	db	-32
eflag	db	0
data	ENDS

		END