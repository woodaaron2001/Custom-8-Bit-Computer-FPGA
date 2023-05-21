;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (MINGW64)
;--------------------------------------------------------
	.module sMovement
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _charY
	.globl _charX
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_charX::
	.ds 2
_charY::
	.ds 2
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;sMovement.c:4: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;sMovement.c:5: while (1) {
00106$:
;sMovement.c:7: charX = (volatile int*)0x3002;
	ld	hl, #0x3002
	ld	(_charX), hl
;sMovement.c:8: *charX = *charX+1;
	ld	bc, (#0x3002)
	inc	bc
	ld	(0x3002), bc
;sMovement.c:10: if(*charX > 640){
	ld	hl, (_charX)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	dec	hl
	ld	a, #0x80
	cp	a, c
	ld	a, #0x02
	sbc	a, b
	jp	PO, 00125$
	xor	a, #0x80
00125$:
	jp	P, 00102$
;sMovement.c:11: *charX = 0;
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
00102$:
;sMovement.c:14: charY = (volatile int*)0x3004;
	ld	hl, #0x3004
	ld	(_charY), hl
;sMovement.c:15: *charY = *charY+1;
	ld	bc, (#0x3004)
	inc	bc
	ld	(0x3004), bc
;sMovement.c:17: if(*charY > 640){
	ld	hl, (_charY)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	dec	hl
	ld	a, #0x80
	cp	a, c
	ld	a, #0x02
	sbc	a, b
	jp	PO, 00126$
	xor	a, #0x80
00126$:
	jp	P, 00106$
;sMovement.c:18: *charY = 0;
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
;sMovement.c:22: }
	jr	00106$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
