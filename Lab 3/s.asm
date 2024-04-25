;=============================================================================
; PROGRAM: LAB3B.ASM
;
; DESCRIPTION: A program which demonstrates the manipulation of data variables
; in memory
;
; AUTHOR: Cahvin Ouellet-Ference
;=============================================================================

        Assume cs:code, ds:data
code    SEGMENT
main    PROC
init:
        mov     ax,data ;beinging instructions
        mov     ds,ax   ;data segment

start:
	mov	ah,byte1
	mov	al,byte2
	mov	bh,byte3
	mov	byte4+1,bh
	mov	byte4+2,al
	mov	byte4+3,ah
	mov	ax,word2
	mov	byte4+4,al
	mov	byte4+5,ah
	mov	ax,word4
	mov	byte4+6,al
	mov	byte4+7,ah
	mov	ax,word3
	mov	byte4+8,al
	mov	byte4+9,ah
	mov	ax,word5
	mov	byte4+10,al
	mov	byte4+11,ah
	mov	ah,bytes+0
	mov	al,bytes+1
	mov	bh,bytes+2
	mov	bl,bytes+3
	mov	byte4+12,ah
	mov	byte4+13,al
	mov	byte4+14,bh
	mov	byte4+15,bl
	mov	ah,byte4
	mov	byte4+16,ah	

        
back2dos:

        mov     ax,4c00h
        int     21h

main    ENDP
code    ENDS
;
; Data Section below
;
;
;
;

data    SEGMENT
word1   DW      9999h   ;marker
word2	DW	0bbaah
byte1	DB	92h
byte2	DB	87h
byte3	DB	62h
word3	DW	5539h
word4	DW	4ed2h
bytes	DB	7fh,13h,0h,66h 	
word5	DW	0ee22h
byte4	DB	88h
	DB	3 DUP (0)
	DW	4 DUP (0)
	DB	5 DUP (0)

data    ENDS

        END

