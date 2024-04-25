;
; PROGRAM: LAB0.ASM
; DESCRIPTION: A program which demonstrates the 
;              modification of memory in DEBUG.
;
; AUTHOR: <your_name_here>
;
        ASSUME  cs:code, ds:data
code	SEGMENT
main	PROC
init:	
	mov	ax,data   ;proper begin sequence
	mov	ds,ax	  ;for the data segment reg.
;
; These 4 assembly instructions will print out a message to screen
;
start:  		
	lea	di,msg
	xchg	dx,di
	mov	ah, 09
	int	21h	;print msg up until the $ sign 	
bak2dos:
	mov	ax,4c00h
        int     21h

main    ENDP
code    ENDS

data    SEGMENT
msg	DB	"Hello, World!",0ah,0dh,"$"
data    ENDS
        
        END     
