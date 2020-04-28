# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 16 "main.c"
# 1 "myLib.h" 1




typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 64 "myLib.h"
extern unsigned short *videoBuffer;
# 85 "myLib.h"
typedef struct {
 u16 tileimg[8192];
} charblock;


typedef struct {
 u16 tilemap[1024];
} screenblock;



void setPixel3(int col, int row, unsigned short color);
void drawRect3(int col, int row, int width, int height, volatile unsigned short color);
void fillScreen3(volatile unsigned short color);
void drawImage3(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage3(const unsigned short *image);


void setPixel4(int col, int row, unsigned char colorIndex);
void drawRect4(int col, int row, int width, int height, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);


void waitForVBlank();
void flipPage();





typedef struct {
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[];
# 157 "myLib.h"
void hideSprites();






typedef struct {
    int screenRow;
    int screenCol;
    int worldRow;
    int worldCol;
    int rdel;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int hide;
} ANISPRITE;
# 200 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 211 "myLib.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 251 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);
# 292 "myLib.h"
typedef void (*ihp)(void);
# 347 "myLib.h"
typedef struct{
    const signed char* data;
    int length;
    int frequency;
    int isPlaying;
    int loops;
    int duration;
    int priority;
    int vBlankCount;
} SOUND;




int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 17 "main.c" 2
# 1 "spritesheet.h" 1
# 21 "spritesheet.h"
extern const unsigned short spritesheetTiles[16384];


extern const unsigned short spritesheetPal[256];
# 18 "main.c" 2

# 1 "titlescreen.h" 1
# 22 "titlescreen.h"
extern const unsigned short titlescreenTiles[6944];


extern const unsigned short titlescreenMap[1024];


extern const unsigned short titlescreenPal[256];
# 20 "main.c" 2
# 1 "directions.h" 1
# 22 "directions.h"
extern const unsigned short directionsTiles[6528];


extern const unsigned short directionsMap[1024];


extern const unsigned short directionsPal[256];
# 21 "main.c" 2
# 1 "pause.h" 1
# 22 "pause.h"
extern const unsigned short pauseTiles[5808];


extern const unsigned short pauseMap[1024];


extern const unsigned short pausePal[256];
# 22 "main.c" 2
# 1 "lose.h" 1
# 22 "lose.h"
extern const unsigned short loseTiles[5648];


extern const unsigned short loseMap[1024];


extern const unsigned short losePal[256];
# 23 "main.c" 2
# 1 "house.h" 1
# 22 "house.h"
extern const unsigned short houseTiles[12128];


extern const unsigned short houseMap[2048];


extern const unsigned short housePal[256];
# 24 "main.c" 2
# 1 "sky.h" 1
# 21 "sky.h"
extern const unsigned short skyTiles[1488];


extern const unsigned short skyMap[2048];
# 25 "main.c" 2
# 1 "mainsong.h" 1




extern const signed char mainsong[374400];
# 26 "main.c" 2
# 1 "losesong.h" 1




extern const signed char losesong[41542];
# 27 "main.c" 2
# 1 "pausesong.h" 1




extern const signed char pausesong[2086560];
# 28 "main.c" 2


void initialize();

void goToStart();
void startState();
void goToGame();
void gameState();
void goToLose();
void loseState();


unsigned short buttons;
unsigned short oldButtons;

unsigned short hOff;


enum {START, DIRECTIONS, GAME, PAUSE, WIN, LOSE};
int state;



int main() {

    initialize();

    while(1) {


        oldButtons = buttons;
        buttons = (*(volatile unsigned short *)0x04000130);


        switch(state) {
            case START:
                startState();
                break;
            case DIRECTIONS:
                directionsState();
                break;
            case GAME:
                gameState();
                break;
            case PAUSE:
                pauseState();
                break;
            case LOSE:
                loseState();
                break;
        }
 }
    return 0;
}


void initialize() {
    (*(unsigned short *)0x4000000) = 0 | (1<<8) | (1<<9) | (1<<12);
    setupSounds();
 setupInterrupts();
    goToStart();
}


void goToStart() {
    DMANow(3, titlescreenPal, ((unsigned short *)0x5000000), 512 / 2);
    (*(volatile unsigned short*)0x4000008) = ((0)<<2) | ((28)<<8) | (0<<14);
    DMANow(3, titlescreenTiles, &((charblock *)0x6000000)[0], 13888 / 2);
    DMANow(3, titlescreenMap, &((screenblock *)0x6000000)[28], 2048 / 2);

    playSoundA(mainsong, 374400, 1);


    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 256);

   (*(volatile unsigned short *)0x04000010) = 0;

    state = START;
}

void goToDirections() {
    (*(volatile unsigned short *)0x04000010) = 0;
    DMANow(3, directionsPal, ((unsigned short *)0x5000000), 512 / 2);
    (*(volatile unsigned short*)0x4000008) = ((0)<<2) | ((28)<<8) | (0<<14);
    DMANow(3, directionsTiles, &((charblock *)0x6000000)[0], 13056 / 2);
    DMANow(3, directionsMap, &((screenblock *)0x6000000)[28], 2048 / 2);

    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 256);
    state = DIRECTIONS;
}

void goToGame() {
    (*(volatile unsigned short *)0x04000010) = hOff;
    (*(volatile unsigned short *)0x04000014) = hOff;

    DMANow(3, housePal, ((unsigned short *)0x5000000), 512 / 2);
    (*(volatile unsigned short*)0x4000008) = ((0)<<2) | ((28)<<8) | (1<<14);
    DMANow(3, houseTiles, &((charblock *)0x6000000)[0], 24256 / 2);
    DMANow(3, houseMap, &((screenblock *)0x6000000)[28], 4096 / 2);

    (*(volatile unsigned short*)0x400000A) = ((2)<<2) | ((30)<<8) | (1<<14);
    DMANow(3, skyTiles, &((charblock *)0x6000000)[2], 2976 / 2);
    DMANow(3, skyMap, &((screenblock *)0x6000000)[30], 4096 / 2);


    DMANow(3, spritesheetPal, ((unsigned short *)0x5000200), 256);
    DMANow(3, spritesheetTiles, &((charblock *)0x6000000)[4], 32768 / 2);

    state = GAME;
}

void goToPause() {
    (*(volatile unsigned short *)0x04000010) = 0;
    DMANow(3, pausePal, ((unsigned short *)0x5000000), 512 / 2);
    (*(volatile unsigned short*)0x4000008) = ((0)<<2) | ((28)<<8) | (0<<14);
    DMANow(3, pauseTiles, &((charblock *)0x6000000)[0], 11616 / 2);
    DMANow(3, pauseMap, &((screenblock *)0x6000000)[28], 2048 / 2);

    playSoundB(pausesong, 2086560, 0);

    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 256);
    state = PAUSE;
}

void goToLose() {
    (*(volatile unsigned short *)0x04000010) = 0;
    hOff = 0;
    DMANow(3, losePal, ((unsigned short *)0x5000000), 512 / 2);
    (*(volatile unsigned short*)0x4000008) = ((0)<<2) | ((28)<<8) | (0<<14);
    DMANow(3, loseTiles, &((charblock *)0x6000000)[0], 11296 / 2);
    DMANow(3, loseMap, &((screenblock *)0x6000000)[28], 2048 / 2);
    stopSound();
    playSoundB(losesong, 41542, 0);

    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 256);
    state = LOSE;
}

void startState() {
    waitForVBlank();
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        goToDirections();
    }
    if ((!(~(oldButtons)&((1<<7))) && (~buttons & ((1<<7))))) {
        initGame();
        goToGame();
    }
}

void directionsState(){
    waitForVBlank();
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        initGame();
        goToGame();
    }
}

void gameState() {

    updateGame();
    drawGame();

 waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);

    (*(volatile unsigned short *)0x04000010) = hOff;
    (*(volatile unsigned short *)0x04000014) = hOff / 2;
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        pauseSound();
        goToPause();
    }
}

void pauseState() {
    waitForVBlank();
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        stopSound();


        goToGame();
        playSoundA(mainsong, 374400, 1);
    }
    if ((!(~(oldButtons)&((1<<6))) && (~buttons & ((1<<6))))) {
        stopSound();
        goToStart();
    }
}

void loseState() {
    waitForVBlank();
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        stopSound();
        goToStart();
    }
}
