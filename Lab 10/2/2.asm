; PROGRAM: 10_2.ASM
;
; AUTHOR: Calvin O. Ference
;
; DESCRIPTION:  Looping, Indexing  and I/O
; 
; 

        ASSUME	cs:code, ds:data

code    SEGMENT
main    PROC   

init:	mov	ax,data
	mov	ds,ax
	mov	ax,0
	lea	di,kanji
	lea	si,buff

hajime:	cmp	di,33		;this checks if di is at the final value
	je	shi
	mov	al,[di]
	cmp	al,40h	;this will check if the value is a number
	jb	ingore		;if so then jump to ingore
	cmp	al,5Bh	;this checks if the value is a Upper Case value
	jb	upperc		
	cmp	al,7Bh	;and this checks if the value is lower case
	jb	lowerc

upperc:		add	al,20h		;this transforms from Upper to lower case
	mov	[si],al		;sending back to memory
	inc	di
	inc	si
	jmp	hajime

lowerc:		sub	al,20h		;converting into lower case
	mov	[si],al
	inc	di
	inc	si
	jmp	hajime
	

ingore:	inc	di		;nothing much here
	jmp	hajime		;just ingores the number
	
				
shi:
	mov	ax,4c00h
	int	21h

main	ENDP
code	ENDS

data	SEGMENT
kanji	db	"0","3","o","H","4","t","0","H","O","3","S","E","c","r","7","a","z","5","y","r","3","U","S","4","K","I","3","8","I","S","5","w"
buff	db	32 dup (0)
data	ENDS

		END