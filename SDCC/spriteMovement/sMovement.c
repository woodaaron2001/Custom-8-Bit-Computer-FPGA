volatile int* charX;
volatile int* charY;

void main(void) {
    while (1) {
        
        charX = (volatile int*)0x3002;
        *charX = *charX+1;
        
        if(*charX > 640){
            *charX = 0;
        }

        charY = (volatile int*)0x3004;
        *charY = *charY+1;

        if(*charY > 640){
            *charY = 0;
        }

    }
}