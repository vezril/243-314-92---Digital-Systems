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
		mov	ax,0
		mov	bx,0
		mov	cx,0
		mov	dx,0
		mov	eflag,0		;resetting everything 

start:		cmp	R1,03e8h	;1k
		jb	error
		cmp	R1,0C350h	;50k
		ja	error
		cmp	R2,03e8h	;1k
		jb	error
		cmp	R2,0C350h	;50k
		ja	error
		mov	ax,R1		;rest is the same as lab 7 part 4 except for division part
		mov	bx,R2
		mul	bx
		mov	save,dx
		mov	save+2,ax
		add	bx,R1
		adc	cx,0
		cmp	cx,1
		jae	alt
		mov	ax,save+2
		mov	dx,save
		div	bx
		
shi:		xchg	al,ah
		mov	rez,ax
		mov	ax,4c00h
		int	21h

error:		mov	eflag,0FFh
		jmp	shi

alt:		mov	dx,cx
		mov	ax,bx
		mov	bx,2
		div	bx
		mov	bx,ax
		mov	ax,save+2
		mov	dx,save
		div	bx
		mov	bx,2
		div	bx
		jmp	shi
	
main	ENDP
code	ENDS

data	SEGMENT
R1	dw	0A000h
R2	dw	0A000h
save	dw	0,0,0
rez	dw	0
eflag	db	0
data	ENDS

		END