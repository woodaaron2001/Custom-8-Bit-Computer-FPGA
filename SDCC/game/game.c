#include <stdint.h>
volatile unsigned char* charShow;
volatile int16_t* charX;
volatile int16_t* charY;
volatile unsigned char* charSprite;
volatile int16_t charMovementCounter; 

volatile unsigned char* bulletShow;
volatile int16_t* bulletX;
volatile int16_t* bulletY;
volatile unsigned char* bulletSprite;
volatile int16_t bulletMovementCounter; 

volatile unsigned char* enemy1Show;
volatile int16_t* enemy1X;
volatile int16_t* enemy1Y;
volatile unsigned char* enemy1Sprite;
volatile int16_t enemy1MovementCounter; 

volatile unsigned char* enemy2Show;
volatile int16_t* enemy2X;
volatile int16_t* enemy2Y;
volatile unsigned char* enemy2Sprite;
volatile int16_t enemy2MovementCounter; 

volatile unsigned char* keyboard;


void main(void) {
    charMovementCounter = 0;
    bulletMovementCounter = 0;
    enemy1MovementCounter = 0;
    enemy2MovementCounter = 0;

    keyboard = (volatile unsigned char*)0x3000; 

    charShow = (volatile unsigned char*)0x3001;
    charX = (volatile int16_t*)0x3002;
    charY = (volatile int16_t*)0x3004;
    charSprite = (volatile unsigned char*)0x3006; 

    bulletShow = (volatile unsigned char*)0x3007;
    bulletX = (volatile int16_t*)0x3008;
    bulletY = (volatile int16_t*)0x300A;
    bulletSprite = (volatile unsigned char*)0x300C; 

    enemy1Show = (volatile unsigned char*)0x300D;
    enemy1X = (volatile int16_t*)0x300E;
    enemy1Y = (volatile int16_t*)0x3010;
    enemy1Sprite = (volatile unsigned char*)0x3012;

    enemy2Show = (volatile unsigned char*)0x3013;
    enemy2X = (volatile int16_t*)0x3014;
    enemy2Y = (volatile int16_t*)0x3016;
    enemy2Sprite = (volatile unsigned char*)0x3018; 


    *charX = 320;
    *charY = 240;


    *bulletX = 100;
    *bulletY = 100;
    *bulletShow = 1;


    *enemy1X = 500;
    *enemy1Y = 50;
    *enemy1Show = 1;


    *enemy2X = 50;
    *enemy2Y = 300;
    *enemy2Show = 1;



    while (1) {
        bulletMovementCounter = bulletMovementCounter + 1;
        enemy1MovementCounter = enemy1MovementCounter + 1;
        enemy2MovementCounter = enemy2MovementCounter + 1;

        if(enemy1MovementCounter == 1000){
            enemy1MovementCounter = 0;
            if(enemy1X - charX > 0){
                enemy1X = enemy1X -1;
            }
            else{
                enemy1X = enemy1X +1;
            }

            if(enemy1Y - charY > 0){
                enemy1Y = enemy1Y -1;
            }
            else{
                enemy1Y = enemy1Y +1;
            }

        }


        if(enemy2MovementCounter == 1000){
            enemy2MovementCounter = 0;
            if(enemy2X - charX > 0){
                enemy2X = enemy2X -1;
            }
            else{
                enemy2X = enemy2X +1;
            }

            if(enemy2Y - charY > 0){
                enemy2Y = enemy2Y -1;
            }
            else{
                enemy2Y = enemy2Y +1;
            }

        }


        if(*keyboard == 'W'){
            charMovementCounter = charMovementCounter +1;
            if(charMovementCounter == 1000){
                charMovementCounter = 0;
                *charY = *charY-1;
            }

        }
        
        if(*keyboard == 'S'){
            charMovementCounter = charMovementCounter +1;
            if(charMovementCounter == 1000){
                charMovementCounter = 0;
                *charY = *charY+1;
            }
        }

        if(*keyboard == 'D'){
            charMovementCounter = charMovementCounter +1;
            if(charMovementCounter == 1000){
                charMovementCounter = 0;
                *charX = *charX+1;
            }
            
        }
        
        if(*keyboard == 'A'){
            charMovementCounter = charMovementCounter +1;
            if(charMovementCounter == 1000){
                charMovementCounter = 0;
                *charX = *charX-1;
            }
        }


        if(*charX > 640 || *charX < 0){
            *charX = 0;
        }



        if(*charY > 480 || *charY < 0){
            *charY = 0;
        }

    }
}