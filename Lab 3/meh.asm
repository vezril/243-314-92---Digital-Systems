;=============================================================================
; PROGRAM: LAB3B.ASM
;
; DESCRIPTION: A program which demonstrates the manipulation of data variables
; in memory
;
; AUTHOR: Calvin Ouellet-Ference
;=============================================================================

        Assume cs:code, ds:data
code    SEGMENT
main    PROC
init:
        mov     ax,data ;beinging instructions
        mov     ds,ax   ;data segment

start:
        mov     ax,0cdabh
        mov     word1,ax
        mov     ax,96efh
        mov     word2,ax
        mov     ax,5a5ah
        mov     word3,ax
        mov     ax,0bcdch
        mov     word4,ax
        mov     ax,6543h
        mov     word4+2,ax
        mov     ax,0
        mov     word4+4,ax
        mov     word4+6,ax
        mov     word4+8,ax
	mov	ax,8899h
        mov     word4+10,ax 
	mov	ax,6655h
	mov	word4+12,ax
	mov	ax,0403h
	mov	word4+14,ax
	mov	ax,81ECh
	mov	word4+16,ax
	mov	ax,84ECh
	mov	word4+18,ax
	mov	ax,5700h
	mov	word4+20,ax
	mov	ax,0E956h
	mov	word4+22,ax
        mov     ax,00BCh
	mov	word4+24,ax
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
word2   DW      0
word3   DW      0
word4   DW      0
        DW      4 DUP (0)
byte1   DB      0
byte2   DB      0
bytes   DB      1,2,3,4
data    ENDS

        END

