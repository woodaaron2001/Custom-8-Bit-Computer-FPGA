;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (MINGW64)
;--------------------------------------------------------
	.module game
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _keyboard
	.globl _enemy2MovementCounter
	.globl _enemy2Sprite
	.globl _enemy2Y
	.globl _enemy2X
	.globl _enemy2Show
	.globl _enemy1MovementCounter
	.globl _enemy1Sprite
	.globl _enemy1Y
	.globl _enemy1X
	.globl _enemy1Show
	.globl _bulletMovementCounter
	.globl _bulletSprite
	.globl _bulletY
	.globl _bulletX
	.globl _bulletShow
	.globl _charMovementCounter
	.globl _charSprite
	.globl _charY
	.globl _charX
	.globl _charShow
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_charShow::
	.ds 2
_charX::
	.ds 2
_charY::
	.ds 2
_charSprite::
	.ds 2
_charMovementCounter::
	.ds 2
_bulletShow::
	.ds 2
_bulletX::
	.ds 2
_bulletY::
	.ds 2
_bulletSprite::
	.ds 2
_bulletMovementCounter::
	.ds 2
_enemy1Show::
	.ds 2
_enemy1X::
	.ds 2
_enemy1Y::
	.ds 2
_enemy1Sprite::
	.ds 2
_enemy1MovementCounter::
	.ds 2
_enemy2Show::
	.ds 2
_enemy2X::
	.ds 2
_enemy2Y::
	.ds 2
_enemy2Sprite::
	.ds 2
_enemy2MovementCounter::
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
;game.c:29: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;game.c:30: charMovementCounter = 0;
	ld	hl, #0x0000
	ld	(_charMovementCounter), hl
;game.c:31: bulletMovementCounter = 0;
	ld	(_bulletMovementCounter), hl
;game.c:32: enemy1MovementCounter = 0;
	ld	(_enemy1MovementCounter), hl
;game.c:33: enemy2MovementCounter = 0;
	ld	(_enemy2MovementCounter), hl
;game.c:35: keyboard = (volatile unsigned char*)0x3000; 
	ld	h, #0x30
	ld	(_keyboard), hl
;game.c:37: charShow = (volatile unsigned char*)0x3001;
	ld	l, #0x01
	ld	(_charShow), hl
;game.c:38: charX = (volatile int16_t*)0x3002;
	ld	l, #0x02
	ld	(_charX), hl
;game.c:39: charY = (volatile int16_t*)0x3004;
	ld	l, #0x04
	ld	(_charY), hl
;game.c:40: charSprite = (volatile unsigned char*)0x3006; 
	ld	l, #0x06
	ld	(_charSprite), hl
;game.c:42: bulletShow = (volatile unsigned char*)0x3007;
	ld	l, #0x07
	ld	(_bulletShow), hl
;game.c:43: bulletX = (volatile int16_t*)0x3008;
	ld	l, #0x08
	ld	(_bulletX), hl
;game.c:44: bulletY = (volatile int16_t*)0x300A;
	ld	l, #0x0a
	ld	(_bulletY), hl
;game.c:45: bulletSprite = (volatile unsigned char*)0x300C; 
	ld	l, #0x0c
	ld	(_bulletSprite), hl
;game.c:47: enemy1Show = (volatile unsigned char*)0x300D;
	ld	l, #0x0d
	ld	(_enemy1Show), hl
;game.c:48: enemy1X = (volatile int16_t*)0x300E;
	ld	l, #0x0e
	ld	(_enemy1X), hl
;game.c:49: enemy1Y = (volatile int16_t*)0x3010;
	ld	l, #0x10
	ld	(_enemy1Y), hl
;game.c:50: enemy1Sprite = (volatile unsigned char*)0x3012;
	ld	l, #0x12
	ld	(_enemy1Sprite), hl
;game.c:52: enemy2Show = (volatile unsigned char*)0x3013;
	ld	l, #0x13
	ld	(_enemy2Show), hl
;game.c:53: enemy2X = (volatile int16_t*)0x3014;
	ld	l, #0x14
	ld	(_enemy2X), hl
;game.c:54: enemy2Y = (volatile int16_t*)0x3016;
	ld	l, #0x16
	ld	(_enemy2Y), hl
;game.c:55: enemy2Sprite = (volatile unsigned char*)0x3018; 
	ld	l, #0x18
	ld	(_enemy2Sprite), hl
;game.c:58: *charX = 320;
	ld	hl, #0x0140
	ld	(0x3002), hl
;game.c:59: *charY = 240;
	ld	hl, (_charY)
	ld	(hl), #0xf0
	inc	hl
	ld	(hl), #0x00
;game.c:62: *bulletX = 100;
	ld	hl, (_bulletX)
	ld	(hl), #0x64
	inc	hl
	ld	(hl), #0x00
;game.c:63: *bulletY = 100;
	ld	hl, (_bulletY)
	ld	(hl), #0x64
	inc	hl
	ld	(hl), #0x00
;game.c:64: *bulletShow = 1;
	ld	hl, (_bulletShow)
	ld	(hl), #0x01
;game.c:67: *enemy1X = 500;
	ld	hl, (_enemy1X)
	ld	(hl), #0xf4
	inc	hl
	ld	(hl), #0x01
;game.c:68: *enemy1Y = 50;
	ld	hl, (_enemy1Y)
	ld	(hl), #0x32
	inc	hl
	ld	(hl), #0x00
;game.c:69: *enemy1Show = 1;
	ld	hl, (_enemy1Show)
	ld	(hl), #0x01
;game.c:72: *enemy2X = 50;
	ld	hl, (_enemy2X)
	ld	(hl), #0x32
	inc	hl
	ld	(hl), #0x00
;game.c:73: *enemy2Y = 300;
	ld	hl, (_enemy2Y)
	ld	(hl), #0x2c
	inc	hl
	ld	(hl), #0x01
;game.c:74: *enemy2Show = 1;
	ld	hl, (_enemy2Show)
	ld	(hl), #0x01
;game.c:78: while (1) {
00140$:
;game.c:79: bulletMovementCounter = bulletMovementCounter + 1;
	ld	hl, (_bulletMovementCounter)
	inc	hl
	ld	(_bulletMovementCounter), hl
;game.c:80: enemy1MovementCounter = enemy1MovementCounter + 1;
	ld	hl, (_enemy1MovementCounter)
	inc	hl
	ld	(_enemy1MovementCounter), hl
;game.c:81: enemy2MovementCounter = enemy2MovementCounter + 1;
	ld	hl, (_enemy2MovementCounter)
	inc	hl
	ld	(_enemy2MovementCounter), hl
;game.c:83: if(enemy1MovementCounter == 1000){
	ld	hl, (_enemy1MovementCounter)
	ld	a, l
	sub	a, #0xe8
	jr	NZ, 00108$
	ld	a, h
	sub	a, #0x03
	jr	NZ, 00108$
;game.c:84: enemy1MovementCounter = 0;
	ld	hl, #0x0000
	ld	(_enemy1MovementCounter), hl
;game.c:85: if(enemy1X - charX > 0){
	ld	bc, (_charX)
	ld	hl, (_enemy1X)
	cp	a, a
	sbc	hl, bc
	sra	h
	rr	l
	xor	a, a
	cp	a, l
	sbc	a, h
	jp	PO, 00231$
	xor	a, #0x80
00231$:
	jp	P, 00102$
;game.c:86: enemy1X = enemy1X -1;
	ld	hl, (_enemy1X)
	dec	hl
	dec	hl
	ld	(_enemy1X), hl
	jr	00103$
00102$:
;game.c:89: enemy1X = enemy1X +1;
	ld	hl, (_enemy1X)
	inc	hl
	inc	hl
	ld	(_enemy1X), hl
00103$:
;game.c:92: if(enemy1Y - charY > 0){
	ld	bc, (_charY)
	ld	hl, (_enemy1Y)
	cp	a, a
	sbc	hl, bc
	sra	h
	rr	l
	xor	a, a
	cp	a, l
	sbc	a, h
	jp	PO, 00232$
	xor	a, #0x80
00232$:
	jp	P, 00105$
;game.c:93: enemy1Y = enemy1Y -1;
	ld	hl, (_enemy1Y)
	dec	hl
	dec	hl
	ld	(_enemy1Y), hl
	jr	00108$
00105$:
;game.c:96: enemy1Y = enemy1Y +1;
	ld	hl, (_enemy1Y)
	inc	hl
	inc	hl
	ld	(_enemy1Y), hl
00108$:
;game.c:102: if(enemy2MovementCounter == 1000){
	ld	hl, (_enemy2MovementCounter)
	ld	a, l
	sub	a, #0xe8
	jr	NZ, 00116$
	ld	a, h
	sub	a, #0x03
	jr	NZ, 00116$
;game.c:103: enemy2MovementCounter = 0;
	ld	hl, #0x0000
	ld	(_enemy2MovementCounter), hl
;game.c:104: if(enemy2X - charX > 0){
	ld	bc, (_charX)
	ld	hl, (_enemy2X)
	cp	a, a
	sbc	hl, bc
	sra	h
	rr	l
	xor	a, a
	cp	a, l
	sbc	a, h
	jp	PO, 00235$
	xor	a, #0x80
00235$:
	jp	P, 00110$
;game.c:105: enemy2X = enemy2X -1;
	ld	hl, (_enemy2X)
	dec	hl
	dec	hl
	ld	(_enemy2X), hl
	jr	00111$
00110$:
;game.c:108: enemy2X = enemy2X +1;
	ld	hl, (_enemy2X)
	inc	hl
	inc	hl
	ld	(_enemy2X), hl
00111$:
;game.c:111: if(enemy2Y - charY > 0){
	ld	bc, (_charY)
	ld	hl, (_enemy2Y)
	cp	a, a
	sbc	hl, bc
	sra	h
	rr	l
	xor	a, a
	cp	a, l
	sbc	a, h
	jp	PO, 00236$
	xor	a, #0x80
00236$:
	jp	P, 00113$
;game.c:112: enemy2Y = enemy2Y -1;
	ld	hl, (_enemy2Y)
	dec	hl
	dec	hl
	ld	(_enemy2Y), hl
	jr	00116$
00113$:
;game.c:115: enemy2Y = enemy2Y +1;
	ld	hl, (_enemy2Y)
	inc	hl
	inc	hl
	ld	(_enemy2Y), hl
00116$:
;game.c:121: if(*keyboard == 0x1D){
	ld	hl, (_keyboard)
	ld	a, (hl)
	sub	a, #0x1d
	jr	NZ, 00120$
;game.c:122: charMovementCounter = charMovementCounter +1;
	ld	hl, (_charMovementCounter)
	inc	hl
	ld	(_charMovementCounter), hl
;game.c:123: if(charMovementCounter == 1000){
	ld	hl, (_charMovementCounter)
	ld	a, l
	sub	a, #0xe8
	jr	NZ, 00120$
	ld	a, h
	sub	a, #0x03
	jr	NZ, 00120$
;game.c:124: charMovementCounter = 0;
	ld	hl, #0x0000
	ld	(_charMovementCounter), hl
;game.c:59: *charY = 240;
	ld	bc, (_charY)
;game.c:125: *charY = *charY-1;
	ld	l, c
	ld	h, b
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	dec	de
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
00120$:
;game.c:130: if(*keyboard == 0x1B){
	ld	hl, (_keyboard)
	ld	a, (hl)
	sub	a, #0x1b
	jr	NZ, 00124$
;game.c:131: charMovementCounter = charMovementCounter +1;
	ld	hl, (_charMovementCounter)
	inc	hl
	ld	(_charMovementCounter), hl
;game.c:132: if(charMovementCounter == 1000){
	ld	hl, (_charMovementCounter)
	ld	a, l
	sub	a, #0xe8
	jr	NZ, 00124$
	ld	a, h
	sub	a, #0x03
	jr	NZ, 00124$
;game.c:133: charMovementCounter = 0;
	ld	hl, #0x0000
	ld	(_charMovementCounter), hl
;game.c:59: *charY = 240;
	ld	hl, (_charY)
;game.c:134: *charY = *charY+1;
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	dec	hl
	inc	bc
	ld	(hl), c
	inc	hl
	ld	(hl), b
00124$:
;game.c:138: if(*keyboard == 0x23){
	ld	hl, (_keyboard)
	ld	a, (hl)
	sub	a, #0x23
	jr	NZ, 00128$
;game.c:139: charMovementCounter = charMovementCounter +1;
	ld	hl, (_charMovementCounter)
	inc	hl
	ld	(_charMovementCounter), hl
;game.c:140: if(charMovementCounter == 1000){
	ld	hl, (_charMovementCounter)
	ld	a, l
	sub	a, #0xe8
	jr	NZ, 00128$
	ld	a, h
	sub	a, #0x03
	jr	NZ, 00128$
;game.c:141: charMovementCounter = 0;
	ld	hl, #0x0000
	ld	(_charMovementCounter), hl
;game.c:142: *charX = *charX+1;
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
00128$:
;game.c:147: if(*keyboard == 0x1C){
	ld	hl, (_keyboard)
	ld	a, (hl)
	sub	a, #0x1c
	jr	NZ, 00132$
;game.c:148: charMovementCounter = charMovementCounter +1;
	ld	hl, (_charMovementCounter)
	inc	hl
	ld	(_charMovementCounter), hl
;game.c:149: if(charMovementCounter == 1000){
	ld	hl, (_charMovementCounter)
	ld	a, l
	sub	a, #0xe8
	jr	NZ, 00132$
	ld	a, h
	sub	a, #0x03
	jr	NZ, 00132$
;game.c:150: charMovementCounter = 0;
	ld	hl, #0x0000
	ld	(_charMovementCounter), hl
;game.c:142: *charX = *charX+1;
	ld	hl, (_charX)
;game.c:151: *charX = *charX-1;
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	dec	hl
	dec	bc
	ld	(hl), c
	inc	hl
	ld	(hl), b
00132$:
;game.c:142: *charX = *charX+1;
	ld	bc, (_charX)
;game.c:156: if(*charX > 640 || *charX < 0){
	ld	l, c
	ld	h, b
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, #0x80
	cp	a, e
	ld	a, #0x02
	sbc	a, d
	jp	PO, 00253$
	xor	a, #0x80
00253$:
	jp	M, 00133$
	ld	l, c
	ld	h, b
	ld	e, (hl)
	inc	hl
	bit	7, (hl)
	jr	Z, 00134$
00133$:
;game.c:157: *charX = 0;
	xor	a, a
	ld	(bc), a
	inc	bc
	ld	(bc), a
00134$:
;game.c:59: *charY = 240;
	ld	bc, (_charY)
;game.c:162: if(*charY > 480 || *charY < 0){
	ld	l, c
	ld	h, b
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, #0xe0
	cp	a, e
	ld	a, #0x01
	sbc	a, d
	jp	PO, 00254$
	xor	a, #0x80
00254$:
	jp	M, 00136$
	ld	l, c
	ld	h, b
	ld	e, (hl)
	inc	hl
	bit	7, (hl)
	jp	Z, 00140$
00136$:
;game.c:163: *charY = 0;
	xor	a, a
	ld	(bc), a
	inc	bc
	ld	(bc), a
;game.c:167: }
	jp	00140$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
