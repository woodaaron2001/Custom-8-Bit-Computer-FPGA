;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (MINGW64)
;--------------------------------------------------------
	.module keyboard
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _keyboard
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
_keyboard::
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
;keyboard.c:5: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;keyboard.c:6: while (1) {
00114$:
;keyboard.c:8: keyboard = (volatile int*)0x3000; 
	ld	hl, #0x3000
	ld	(_keyboard), hl
;keyboard.c:10: charX = (volatile int*)0x3002;
	ld	l, #0x02
	ld	(_charX), hl
;keyboard.c:11: charY = (volatile int*)0x3004;
	ld	l, #0x04
	ld	(_charY), hl
;keyboard.c:13: if(*keyboard == 0x1D){
	ld	a, (#0x3000)
	sub	a, #0x1d
	jr	NZ, 00102$
;keyboard.c:14: *charY = *charY-1;
	ld	bc, (#0x3004)
	dec	bc
	ld	(0x3004), bc
00102$:
;keyboard.c:17: if(*keyboard == 0x1B){
	ld	hl, (_keyboard)
	ld	a, (hl)
	sub	a, #0x1b
	jr	NZ, 00104$
;keyboard.c:18: *charY = *charY+1;
	ld	hl, (_charY)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	dec	hl
	inc	bc
	ld	(hl), c
	inc	hl
	ld	(hl), b
00104$:
;keyboard.c:21: if(*keyboard == 0x23){
	ld	hl, (_keyboard)
	ld	a, (hl)
	sub	a, #0x23
	jr	NZ, 00106$
;keyboard.c:22: *charX = *charX+1;
	ld	bc, (_charX)
	ld	l, c
	ld	h, b
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	inc	de
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
00106$:
;keyboard.c:25: if(*keyboard == 0x1C){
	ld	hl, (_keyboard)
	ld	a, (hl)
	sub	a, #0x1c
	jr	NZ, 00108$
;keyboard.c:22: *charX = *charX+1;
	ld	hl, (_charX)
;keyboard.c:26: *charX = *charX-1;
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	dec	hl
	dec	bc
	ld	(hl), c
	inc	hl
	ld	(hl), b
00108$:
;keyboard.c:22: *charX = *charX+1;
	ld	bc, (_charX)
;keyboard.c:30: if(*charX > 640){
	ld	l, c
	ld	h, b
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, #0x80
	cp	a, e
	ld	a, #0x02
	sbc	a, d
	jp	PO, 00161$
	xor	a, #0x80
00161$:
	jp	P, 00110$
;keyboard.c:31: *charX = 0;
	xor	a, a
	ld	(bc), a
	inc	bc
	ld	(bc), a
00110$:
;keyboard.c:18: *charY = *charY+1;
	ld	bc, (_charY)
;keyboard.c:36: if(*charY > 640){
	ld	l, c
	ld	h, b
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, #0x80
	cp	a, e
	ld	a, #0x02
	sbc	a, d
	jp	PO, 00162$
	xor	a, #0x80
00162$:
	jp	P, 00114$
;keyboard.c:37: *charY = 0;
	xor	a, a
	ld	(bc), a
	inc	bc
	ld	(bc), a
;keyboard.c:41: }
	jp	00114$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
