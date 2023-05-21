volatile unsigned char* vramLayer1;
volatile unsigned char* vramLayer2;
volatile unsigned char count;
volatile int vramIndex;

volatile unsigned


void main(void) {
    while (1) {
        
        for(count = 0; count <2; count++){
            vramLayer1 = (volatile unsigned char*)0x3019;
            for (vramIndex = 0; vramIndex < 1200; vramIndex++) {
                *vramLayer1 = count;
                vramLayer1 =  vramLayer1 + sizeof(unsigned char);
            }

            for (vramIndex = 0; vramIndex < 30000; vramIndex++) {
            }
        }

    }
}