; PROGRAM: 1.ASM
;
; AUTHOR: Calvin O. Ference
;
; DESCRIPTION:  Subroutines thingy
; 
; 

        ASSUME	cs:code, ds:data, ss:stak
	EXTRN	outstr:FAR, getbyte:FAR, getword:FAR, outbyte:FAR, outword:FAR, newline:FAR
	EXTRN	getc:FAR
code    SEGMENT
;--------------------------
main    PROC   
init:		mov	ax,data
		mov	ds,ax
		mov	eflag,0		;resetting everything 

start:		call	greet		;greets the user
		call	iptval		;this is to input vars
		call	eval		;the eval part
		call	legend		;a little legend
		call	output		;the answer
		call	again		;ask if you want to do it again
shi:		mov	ax,4c00h
		int	21h
main	ENDP
;-------------------------
greet	PROC
		lea	di,smsg1	;prints out the ranges for the user
		call	outstr
		call	newline
		lea	di,smsg2
		call	outstr
		call	newline
		lea	di,smsg3
		call	outstr
		call	newline
		call	newline		;all the way to here
		mov	ax,0		;then sets all registers to 0 to be safe
		mov	bx,0
		mov	cx,0
		mov	dx,0
		ret
greet	ENDP
;-------------------------
iptval	PROC
	lea	di,msg1			;all of this next section
	call	outstr			;does is calls for the values
	call	getword			;and sends them into memory
	mov	vala,ax
	call	getword
	mov	vala+2,ax
	call	newline
	lea	di,msg2
	call	outstr
	call	getword
	mov	valb,ax
	call	newline
	lea	di,msg3
	call	outstr
	call	getbyte
	mov	valc,al
	call	newline
	ret
iptval	ENDP
;--------------------------
eval	PROC			;the following section is all the evaluation
	cmp	vala,2		;code used.
	ja	error		;It's the cheater way of doing it though
	cmp	vala+2,0AB98h
	ja	error
	cmp	vala+2,09c4h
	jb	error
pta:	cmp	valb,61A8h
	ja	error2
	cmp	valb,00c8h
	jb	error2
ptb:	cmp	valc,99
	jg	error3
	cmp	valc,-32
	jl	error3
	ret

error:	mov	eflag,01
	jmp	pta
error2:	cmp	eflag,01
	je	error2b
	mov	eflag,02
	jmp	ptb
error2b:
	mov	eflag,0Ah
	jmp	ptb
error3:	cmp	eflag,01
	je	errora
	cmp	eflag,02
	je	errorb
	cmp	eflag,0Ah
	je	errorf
	mov	eflag,04h
	ret
errora:	mov	eflag,0Bh
	ret
errorb:	mov	eflag,0Ch
	ret
errorf:	mov	eflag,0ffh
	ret
eval	ENDP
;--------------------------
legend	PROC
	lea	di,lmsg1	;this section prints out a little legend for the user
	call	outstr
	call	newline
	lea	di,lmsg2
	call	outstr
	call	newline
	lea	di,lmsg3
	call	outstr
	call	newline
	lea	di,lmsg4
	call	outstr
	call	newline
	lea	di,lmsg5
	call	outstr
	call	newline
	lea	di,lmsg6
	call	outstr
	call	newline
	lea	di,lmsg7
	call	outstr
	call	newline
	lea	di,lmsg8
	call	outstr
	call	newline		;all the way to here
	ret
legend	ENDP
;--------------------------
output	PROC
	lea	di,omsg1	;this shows Val A
	call	outstr
	mov	ax,vala
	call	outword
	mov	ax,vala+2
	call	outword		;all the way to here
	call	newline
	lea	di,omsg2	;this shows Val B
	call	outstr
	mov	ax,valb
	call	outword
	call	newline		;up to here
	lea	di,omsg3	;calling C
	call	outstr
	mov	al,valc
	call	outbyte
	call	newline		;up to here
	lea	di,omsg4	;and calling the eflag
	call	outstr
	mov	al,eflag
	call	outbyte
	call	newline
	ret
output	ENDP
;-----------------------
again	PROC
insert:	call	newline
	lea	di,amsg1
	call	outstr
	call	getc
	cmp	al,4eh
	je	shi
	cmp	al,59h
	je	start
	lea	di,amsg2
	call	outstr
	call	newline
	jmp	insert

start:	call	main

shi:	mov	ax,4c00h
	int	21h
again	ENDP

code	ENDS



data	SEGMENT
vala	dw	0,0
valb	dw	0
valc	db	0
eflag	db	0
msg1	db	"Input Value A >> ",04h
msg2	db	"Input Value B >> ",04h
msg3	db	"Input Value C >> ",04h
smsg1	db	"Range of A is, 0000 09C4h to 0002 AB98h unsigned",04
smsg2	db	"Range of B is, 00C8 to 61A8 unsigned",04
smsg3	db	"Range of A is, E0 to 63 Signed",04
lmsg1	db	"///EFLAG LEGEND\\\",04
lmsg2	db	"01, A is out of Range",04
lmsg3	db	"02, B is out of Range",04
lmsg4	db	"04, C is out of Range",04
lmsg5	db	"0A, A and B are out of Range",04
lmsg6	db	"0B, A and C are out of Range",04
lmsg7	db	"0C, B and C are out of Range",04
lmsg8	db	"FF, all are out of Range",04
omsg1	db	"Inputed Value for A >> ",04
omsg2	db	"Inputed Value for B >> ",04
omsg3	db	"Inputed Value for C >> ",04
omsg4	db	"Error Flag >> ",04h
amsg1	db	"Do you wish to evaluate some values again? (Y or N) >> ",04
amsg2	db	"Come Again?",04h
data	ENDS

stak	SEGMENT	STACK
	dw	256 dup (0)
stak	ENDS

		END