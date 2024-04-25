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
	mov	ah,byte16
	mov	byte16+1,ah
	mov	ah,byte15
	mov	byte16+2,ah
	mov	ah,byte14
	mov	byte16+3,ah
	mov	ah,byte13
	mov	byte16+4,ah
	mov	ah,byte12
	mov	byte16+5,ah
	mov	ah,byte11
	mov	byte16+6,ah
	mov	ah,byte10
	mov	byte16+7,ah
	mov	ah,byte9
	mov	byte16+8,ah
	mov	ah,byte8
	mov	byte16+9,ah
	mov	ah,byte7
	mov	byte16+10,ah
	mov	ah,byte6
	mov	byte16+11,ah
	mov	ah,byte5
	mov	byte16+12,ah
	mov	ah,byte4
	mov	byte16+13,ah
	mov	ah,byte3
	mov	byte16+14,ah
	mov	ah,byte2
	mov	byte16+15,ah
	mov	ah,byte1
	mov	byte16+16,ah
        
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
byte1	DB	0A5h
byte2	DB	7bh
byte3	DB	6eh
byte4 	DB	2dh
byte5	DB	1fh
byte6	DB	0ch
byte7	DB	77h
byte8	DB	99h
byte9	DB	10h
byte10	DB	0bbh
byte11	DB	3dh
byte12	DB	43h
byte13	DB	0h
byte14	DB	0h
byte15	DB	55h
byte16	DB	0AAh
	DB	16 DUP (0)

data    ENDS

        END

