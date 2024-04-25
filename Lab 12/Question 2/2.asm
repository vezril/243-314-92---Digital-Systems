; PROGRAM: 2.ASM
;
; AUTHOR: Calvin O. Ference
;
; DESCRIPTION:  Bit CNT using EXTRN Sbr
; 
; Version:	1.0

        ASSUME	cs:code, ds:data, ss:stak
	EXTRN	outstr:FAR, getbyte:FAR, getword:FAR, outbyte:FAR, outword:FAR, newline:FAR
	EXTRN	getc:FAR, nibadd:FAR

code    SEGMENT
main    PROC   
init:	mov	ax,data
	mov	ds,ax
	mov	ax,0
	mov	cx,32		;setting my counter
	lea	di,buff

start:	
	call	nibadd
	add	csum+2,al	;adds the results directly into memory
	adc	csum,0		;with a carry if needed
	dec	cx		;decrementing the counter
	cmp	cx,0		;and checking it if it's done
	je	part2		;if so then go to the end
	add	di,2
	jmp	start

part2:	lea	di,buff2
	mov	cx,32
s2:	call	nibadd
	add	csum+2,al
	adc	csum,0
	dec	cx
	cmp	cx,0
	je	done
	add	di,2
	jmp	s2

done:	mov	al,csum
	call	outbyte
	mov	al,csum+2
	call	outbyte		

shi:	mov	ax,4c00h
	int	21h
main	ENDP
code	ENDS

	
data	SEGMENT
buff	dw	1234h,5678h,9874h,0deadh,0abcdh,0dcabh,0fa56h,9635h,7412h,7139h,9431h,5678h,1295h,8528h,1111h,2222h,3333h,4444h,5555h,6666h,7777h,8888h,9999h,0aaaah,0bbbbh,0cccch,0ddddh,0eeeeh,0ffffh,9875h,9514h,0894h
buff2	dw	7890h,3596h,0fbach,0dddeh,0fffdh,0aaach,6545h,0258h,8645h,9634h,1238h,3574h,9582h,0025h,8500h,0de00h,0adeh,0ab00h,8434h,5adeh,0cdeah,5413h,0f00fh,4784h,0fdeah,9874h,1238h,258ah,0aabbh,0ccddh,0ffddh,0bbcch
csum	db	0,0
data	ENDS


stak	SEGMENT	STACK
	dw	1024 dup (0)
stak	ENDS

		END