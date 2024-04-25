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
		mov	cx,0
		mov	dx,0 

multi:	mov	ax,R1
		mov	bx,R2
		mul	bx
		mov	save,dx
		mov	save+2,ax
		
additi:	add	bx,R1
		adc	cx,0
		
divisi:	mov	ax,save+2
		mov	dx,save
		div	bx
			
shi:	mov	rez,ax
		mov	ax,4c00h
		int	21h
	
main	ENDP
code	ENDS

data	SEGMENT
R1		dw	4E20h
R2		dw	3A98h
save	dw	0,0,0
rez		dw	0
data	ENDS

		END