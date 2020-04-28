# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"
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
# 2 "game.c" 2
# 1 "game.h" 1

typedef struct {
 int screenRow;
 int screenCol;
 int worldRow;
 float worldCol;
 int cdel;
 int height;
 int width;
 int direction;

 int active;
    int aniCounter;
 int stunCounter;
    int curFrame;
    int numFrames;
    int aniState;
 int prevAniState;
} GRANNY;


typedef struct {
 int screenRow;
 int screenCol;
 int worldRow;
 int worldCol;
 int cdel;
 int height;
 int width;
 int type;

 int active;
 int aniCounter;
 int aniState;
 int curFrame;
 int numFrames;
} RABBIT;


typedef struct {
 int screenRow;
 int screenCol;
 int worldCol;
 int type;
 int worth;

 int cdel;
 int rdel;
 int height;
 int width;
 int active;
 int aniState;


} FOOD;







extern GRANNY gran;
extern FOOD foods[3];
extern RABBIT rabbit;
extern int cookiesRemaining;
extern int hOff;
extern int vOff;
extern int throwCount;
extern OBJ_ATTR shadowOAM[128];


void initGame();
void updateGame();
void drawGame();
void initGran();
void updateGran();
void animatePlayer();
void drawGran();
void initRabbits();
void updateRabbits();
void drawRabbits();
void initFoods();
void fireFoods();
void updateFoods(FOOD *);
void drawFoods();
int getNum(int, int);
void drawScore();
# 3 "game.c" 2
# 1 "spritesheet.h" 1
# 21 "spritesheet.h"
extern const unsigned short spritesheetTiles[16384];


extern const unsigned short spritesheetPal[256];
# 4 "game.c" 2
# 1 "dingSound.h" 1




extern const signed char dingSound[4498];
# 5 "game.c" 2


int hOff;
int vOff;
int score;
int throwCount;
GRANNY gran;
RABBIT rabbit;
FOOD foods[3];
OBJ_ATTR shadowOAM[128];


enum {RIGHTTHROW,LEFTTHROW,RIGHTWALK,LEFTWALK,IDLEWALK};
enum {RABFLOOR};


void initGame() {
    throwCount = 0;
    score = 0;
    hOff = 0;
    initGran();
    initRabbits();
    initFoods();
}


void updateGame() {
    updateGran();
    updateRabbits();
    for (int i = 0; i < 3; i++) {
        updateFoods(&foods[i]);
    }
}


void drawGame() {
    drawGran();
    drawRabbits();
    drawFoods();
    drawScore();
    drawImTired();
    (*(volatile unsigned short *)0x04000010) = hOff;
}


void initGran() {
    gran.worldRow = 90;
    gran.worldCol = 60;
    gran.cdel = 1;
    gran.width = 32;
    gran.height = 64;

    gran.active = 1;
    gran.aniCounter = 0;
    gran.stunCounter = 0;
    gran.curFrame = 0;
    gran.numFrames = 3;
    gran.aniState = RIGHTWALK;
    gran.direction = 0;
}


void updateGran() {
    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<5)))) {
        if (!collision(gran.worldCol, gran.worldRow, gran.width, gran.height, 0, 0, 0, 256)) {
            gran.worldCol -= gran.cdel;
            if (hOff >= 0 && gran.screenCol < 240 / 2) {
                hOff--;
            }
        }
    }
    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<4)))) {
        if (!collision(gran.worldCol, gran.worldRow, gran.width, gran.height, 512, 0, 0, 256)) {
            gran.worldCol += gran.cdel;
            if (hOff < 512 - 240 && gran.screenCol > 240 / 2) {
                hOff++;
            }
        }
    }

    if ((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0))))) {
        throwCount++;
        fireFoods(0);
    } else if ((!(~(oldButtons)&((1<<1))) && (~buttons & ((1<<1))))) {
        throwCount++;
        fireFoods(1);
    } else if ((!(~(oldButtons)&((1<<9))) && (~buttons & ((1<<9))))) {
        throwCount++;
        fireFoods(2);
    }

    gran.screenCol = gran.worldCol - hOff;
    gran.screenRow = gran.worldRow - vOff;
    animatePlayer();

}


void animatePlayer() {


    if(!(gran.aniState == IDLEWALK && !(gran.aniState == RIGHTTHROW) && !(gran.aniState == LEFTTHROW))){
        gran.prevAniState = gran.aniState;
        gran.aniState = IDLEWALK;
    }


    if(gran.aniCounter % 20 == 0) {
        if(gran.curFrame < gran.numFrames - 1){
                gran.curFrame++;
        } else {
            gran.curFrame = 0;
            if(gran.aniState == RIGHTTHROW || gran.aniState == LEFTTHROW){
                gran.aniState = gran.prevAniState;
            }
        }
    }


    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<5)))){
        gran.aniState = LEFTWALK;
        gran.direction = 1;
    }
    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<4)))){
        gran.aniState = RIGHTWALK;
        gran.direction = 0;
    }
    if((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0)))) || (!(~(oldButtons)&((1<<1))) && (~buttons & ((1<<1)))) || (!(~(oldButtons)&((1<<9))) && (~buttons & ((1<<9))))) {
        if(gran.direction){
            gran.aniState = LEFTTHROW;

        } else {
            gran.aniState = RIGHTTHROW;

        }
    }


    if (gran.aniState == IDLEWALK) {
        gran.curFrame = 0;
        gran.aniState = gran.prevAniState;
    } else {
        gran.aniCounter++;
    }
}


void drawGran() {
    if (gran.active) {
        shadowOAM[0].attr0 = (0xFF & gran.screenRow) | (2<<14);
        shadowOAM[0].attr1 = (0x1FF & gran.screenCol) | (3<<14);
        if(gran.cdel == 1) {
            if (gran.aniState == RIGHTWALK || gran.aniState == LEFTWALK || gran.aniState == IDLEWALK) {
                shadowOAM[0].attr2 = ((0)<<12) | ((gran.curFrame * 8)*32+(gran.aniState * 4));
            }
            else {
                shadowOAM[0].attr2 = ((0)<<12) | ((gran.curFrame * 8)*32+(gran.aniState * 4));
            }
        }

    } else {
        shadowOAM[0].attr0 = (2<<8);
    }
}


void initRabbits() {
    rabbit.worldRow = 135;

    rabbit.worldCol = ((rand() + 250) % 512) + gran.screenCol;
    rabbit.width = 64;
    rabbit.height = 64;
    rabbit.type = (rand() + 60) % 2;
    rabbit.active = 1;
    rabbit.aniCounter = 0;
    rabbit.curFrame = 0;
    rabbit.numFrames = 3;
}


void updateRabbits() {
    if(rabbit.aniCounter == 16) {
        rabbit.curFrame = (rabbit.curFrame + 1) % rabbit.numFrames;
        rabbit.aniCounter = 0;
    }
    rabbit.aniCounter++;


    rabbit.worldCol -= 1.1;

    if (rabbit.curFrame == 0) {
        rabbit.worldRow = 135;
    } else if (rabbit.curFrame == 1) {
        rabbit.worldRow = 120;
    } else if (rabbit.curFrame == 2) {
        rabbit.worldRow = 100;
    }

    rabbit.screenCol = rabbit.worldCol - hOff;
    rabbit.screenRow = rabbit.worldRow - vOff;

}


void drawRabbits() {
    if (rabbit.active) {
        shadowOAM[5].attr0 = (0xFF & rabbit.screenRow) | (0<<14);
        shadowOAM[5].attr1 = (0x1FF & rabbit.screenCol) | (2<<14);
        if (rabbit.type == 0) {
            shadowOAM[5].attr2 = ((0)<<12) | ((rabbit.curFrame * 4)*32+(16));
        } else if (rabbit.type == 1) {
            shadowOAM[5].attr2 = ((0)<<12) | ((12 + (rabbit.curFrame * 4))*32+(16));

        }
    } else {
        shadowOAM[5].attr0 = (2<<8);
    }
}


void initFoods() {
    for (int i = 0; i < 3; i++) {
  foods[i].screenRow = 105;
  foods[i].screenCol = gran.screenCol + 5;
        foods[i].worldCol = gran.worldCol + 5;

  foods[i].cdel = 3;
  foods[i].active = 0;
        foods[i].height = 16;
  foods[i].width = 16;

        foods[i].worth = 0;
 }
}


void fireFoods(int type) {


 for(int i = 0; i < 3; i++) {
  if (foods[i].active == 0 && gran.cdel == 1) {
   foods[i].active = 1;
            foods[i].type = type;
   foods[i].screenRow = 105;
   foods[i].screenCol = gran.screenCol + 5;
            foods[i].worldCol = gran.worldCol + 5;


            if(gran.direction){
                foods[i].cdel = -3;
            } else {
                foods[i].cdel = 3;
            }

   break;
  }
 }
}



void updateFoods(FOOD * f) {
    if (f->active) {

        f->worldCol += f->cdel;


        if ((f->type == 0 || f->type == 2) && rabbit.type == 0) {
            if (f->active && collision(f->screenCol, f->screenRow, f->width, f->height, rabbit.screenCol, rabbit.screenRow, rabbit.width, rabbit.height)) {
                f->active = 0;

                rabbit.type = rand() % 2;
                rabbit.worldCol = gran.worldCol + (rand() % 150) + 150;

                if (f->type == 0) {
                    f->worth = 3;
                }

                if (f->type == 2) {
                    f->worth = 1;
                }

                score += f->worth;
                playSoundB(dingSound, 4498 - 100, 0);
            }
        } else if ((f->type == 1 || f->type == 2) && rabbit.type == 1) {
            if (f->active && collision(f->screenCol, f->screenRow, f->width, f->height, rabbit.screenCol, rabbit.screenRow, rabbit.width, rabbit.height)) {
                f->active = 0;
                rabbit.type = (rand() + 3) % 2;
                rabbit.worldCol = gran.worldCol + (rand() % 150) + 150;

                if (f->type == 1) {
                    f->worth = 3;
                }

                if (f->type == 2) {
                    f->worth = 1;
                }
                score += f->worth;
                playSoundB(dingSound, 4498 - 100, 0);
            }
        }

        f->screenCol = f->worldCol - hOff;

        if (f->screenCol > 240 || f->screenCol < 0) {
            f->active = 0;
        }
 }


    if (rabbit.worldCol <= 60) {
        rabbit.active = 0;
        gran.active = 0;
        f->active = 0;
        goToLose();
    }


    if (throwCount >= 5) {
        gran.cdel = 0;
        gran.stunCounter++;
    }
    if (gran.stunCounter >= 230) {
        gran.cdel = 1;
        throwCount = 0;
        gran.stunCounter = 0;
    }
}


void drawFoods() {
    for (int i = 0; i < 3; i++) {
        if (foods[i].active) {
            shadowOAM[10 + i].attr0 = (0xFF & foods[i].screenRow) | (0<<14);
            shadowOAM[10 + i].attr1 = (0x1FF & foods[i].screenCol) | (1<<14);
            if (foods[i].type == 0) {
                shadowOAM[10 + i].attr2 = ((0)<<12) | ((24)*32+(0));
            } else if (foods[i].type == 1) {

                int tileCol = 0;
                if (gran.aniState == LEFTWALK || gran.aniState == LEFTTHROW) {
                    tileCol = 2;
                }
                shadowOAM[10 + i].attr2 = ((0)<<12) | ((26)*32+(tileCol));
            } else if (foods[i].type == 2) {
                shadowOAM[10 + i].attr2 = ((0)<<12) | ((28)*32+(0));
            }
        } else {
            shadowOAM[10 + i].attr0 = (2<<8);
        }
    }

}


int getNum(int num, int digit) {
    num /= pow(10, digit);
    return num % 10;
}


void drawScore() {
    for (int i = 0; i < 3; i++) {
        if (gran.active) {
            shadowOAM[15 + i].attr0 = 10 | (0<<14);
            shadowOAM[15 + i].attr1 = (1<<14) | (240 / 2 - (10 * i) + 3);
            shadowOAM[15 + i].attr2 = ((0)<<12) | ((30)*32+(2 * getNum(score, i)));
        } else {
            shadowOAM[15 + i].attr0 = (2<<8);
        }
    }
}

void drawImTired() {
    if (gran.active && gran.cdel == 0) {
        shadowOAM[18].attr0 = 10 | (1<<14) | gran.worldRow - 25;
        shadowOAM[18].attr1 = (3<<14) | gran.screenCol;
        shadowOAM[18].attr2 = ((0)<<12) | ((24)*32+(4));
    } else {
        shadowOAM[18].attr0 = (2<<8);
    }
}
