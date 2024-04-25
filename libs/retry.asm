; PROGRAM: retry.ASM
;
; AUTHOR: Calvin O. Ference
;
; DESCRIPTION:  this external subroutines prompts the user when called if he wants to retry a pgm
; 
; Version:	1.0	
; ENTER CONDITIONS : AX will be used in this application and any data in it will be lost, same with DI
; EXIT CONDITIONS  : NONE
	
	PUBLIC	retry
        ASSUME	cs:code, ds:data
	EXTRN	outstr:FAR, getc:FAR, newline:FAR

code	SEGMENT
retry	PROC	FAR
init:	mov	ax,0
	push	ax
start:	call	newline
	lea	di,msg1
	call	outstr
	call	getc
	cmp	al,"y"
	je	yes
	cmp	al,"Y"
	je	yes
	cmp	al,"n"
	je	no
	cmp	al,"N"
	je	no
	call	newline
	lea	di,msg2
	call	outstr
	call	newline
	jmp	start
	

yes:	ret

no:	mov	ax,4c00h
	int	21h
retry	ENDP
code	ENDS

data	SEGMENT
msg1	db	"Do you wish to rerun this application? (Y or N) >> ",04
msg2	db	"Come again?",04
data	ENDS
	END



