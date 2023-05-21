;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (MINGW64)
;--------------------------------------------------------
	.module screenTest
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _vramIndex
	.globl _count
	.globl _vramLayer2
	.globl _vramLayer1
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_vramLayer1::
	.ds 2
_vramLayer2::
	.ds 2
_count::
	.ds 1
_vramIndex::
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
;screenTest.c:6: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;screenTest.c:7: while (1) {
00104$:
;screenTest.c:9: for(count = 0; count <2; count++){
	ld	hl, #_count
	ld	(hl), #0x00
00110$:
	ld	a, (_count+0)
	sub	a, #0x02
	jr	NC, 00104$
;screenTest.c:10: vramLayer1 = (volatile unsigned char*)0x3019;
	ld	hl, #0x3019
	ld	(_vramLayer1), hl
;screenTest.c:11: for (vramIndex = 0; vramIndex < 10; vramIndex++) {
	ld	hl, #0x0000
	ld	(_vramIndex), hl
00107$:
	ld	a, (_vramIndex+0)
	sub	a, #0x0a
	ld	a, (_vramIndex+1)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00111$
;screenTest.c:12: *vramLayer1 = count;
	ld	hl, (_vramLayer1)
	ld	a, (_count+0)
	ld	(hl), a
;screenTest.c:13: vramLayer1 =  vramLayer1 + sizeof(unsigned char);
	ld	hl, (_vramLayer1)
	inc	hl
	ld	(_vramLayer1), hl
;screenTest.c:11: for (vramIndex = 0; vramIndex < 10; vramIndex++) {
	ld	bc, (_vramIndex)
	inc	bc
	ld	(_vramIndex), bc
	jr	00107$
00111$:
;screenTest.c:9: for(count = 0; count <2; count++){
	ld	a, (_count+0)
	inc	a
	ld	(_count+0), a
;screenTest.c:18: }
	jr	00110$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
