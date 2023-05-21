volatile int* charX;
volatile int* charY;
volatile unsigned char* keyboard;
volatile int movementCounter; 

void main(void) {
    movementCounter = 0;
    while (1) {
        
        keyboard = (volatile int*)0x3000; 

        charX = (volatile int*)0x3002;
        charY = (volatile int*)0x3004;

        if(*keyboard == 0x1D){
            movementCounter = movementCounter +1;
            if(movementCounter == 1000){
                movementCounter = 0;
                *charY = *charY-1;
            }

        }
        
        if(*keyboard == 0x1B){
            movementCounter = movementCounter +1;
            if(movementCounter == 1000){
                movementCounter = 0;
                *charY = *charY+1;
            }
        }

        if(*keyboard == 0x23){
            movementCounter = movementCounter +1;
            if(movementCounter == 1000){
                movementCounter = 0;
                *charX = *charX+1;
            }
            
        }
        
        if(*keyboard == 0x1C){
            movementCounter = movementCounter +1;
            if(movementCounter == 1000){
                movementCounter = 0;
                *charX = *charX-1;
            }
        }


        if(*charX > 640 || *charX < 0){
            *charX = 0;
        }



        if(*charY > 640 || *charY < 0){
            *charY = 0;
        }

    }
}