#include "myLib.h"
#include "game.h"
#include "spritesheet.h"
#include "dingSound.h"

// Variables
int hOff;
int vOff;
int score;
int throwCount;
GRANNY gran;
RABBIT rabbit;
FOOD foods[FOODCOUNT];
OBJ_ATTR shadowOAM[128];

// Walking animation states for aniState
enum {RIGHTTHROW,LEFTTHROW,RIGHTWALK,LEFTWALK,IDLEWALK};
enum {RABFLOOR}; 

// Initialize the game
void initGame() {
    throwCount = 0;
    score = 0;
    hOff = 0;
    initGran();
    initRabbits();
    initFoods();
}

// Updates the game each frame
void updateGame() {
    updateGran();
    updateRabbits();
    for (int i = 0; i < FOODCOUNT; i++) {
        updateFoods(&foods[i]);
    }
}

// Draws the game each frame
void drawGame() {
    drawGran();
    drawRabbits();
    drawFoods();
    drawScore();
    drawImTired();
    REG_BG0HOFF = hOff;
}

// Initializes Gran
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
    gran.aniState = RIGHTWALK;//starting sprite
    gran.direction = 0; //0:right, 1:left
}

// Updates Gran
void updateGran() {
    if(BUTTON_HELD(BUTTON_LEFT)) {
        if (!collision(gran.worldCol, gran.worldRow, gran.width, gran.height, 0, 0, 0, MAPHEIGHT)) {
            gran.worldCol -= gran.cdel;
            if (hOff >= 0 && gran.screenCol < SCREENWIDTH / 2) {
                hOff--;
            }
        }
    }
    if(BUTTON_HELD(BUTTON_RIGHT)) {
        if (!collision(gran.worldCol, gran.worldRow, gran.width, gran.height, MAPWIDTH, 0, 0, MAPHEIGHT)) {
            gran.worldCol += gran.cdel;
            if (hOff < MAPWIDTH - SCREENWIDTH && gran.screenCol > SCREENWIDTH / 2) {
                hOff++;
            }
        }  
    }
    
    if (BUTTON_PRESSED(BUTTON_A)) { // throw cookies
        throwCount++;
        fireFoods(0);
    } else if (BUTTON_PRESSED(BUTTON_B)) { // throw carrots
        throwCount++;
        fireFoods(1);
    } else if (BUTTON_PRESSED(BUTTON_L)) { // throw love treat
        throwCount++;
        fireFoods(2);
    }

    gran.screenCol = gran.worldCol - hOff;
    gran.screenRow = gran.worldRow - vOff;
    animatePlayer();

}

// Handle player animation states
void animatePlayer() {

    // Set previous state to current state
    if(!(gran.aniState == IDLEWALK && !(gran.aniState == RIGHTTHROW) && !(gran.aniState == LEFTTHROW))){ //dont reset to idle if throwing
        gran.prevAniState = gran.aniState;
        gran.aniState = IDLEWALK;
    }

    // Change the animation frame every 20 frames of gameplay
    if(gran.aniCounter % 20 == 0) {
        if(gran.curFrame < gran.numFrames - 1){
                gran.curFrame++;
        } else {
            gran.curFrame = 0;
            if(gran.aniState == RIGHTTHROW || gran.aniState == LEFTTHROW){ //once throwing animation is done, go back to idle in direction it was before
                gran.aniState = gran.prevAniState;
            }
        }
    }

    // Control movement and change animation state
    if(BUTTON_HELD(BUTTON_LEFT)){
        gran.aniState = LEFTWALK;
        gran.direction = 1;
    }
    if(BUTTON_HELD(BUTTON_RIGHT)){
        gran.aniState = RIGHTWALK;
        gran.direction = 0;
    }
    if(BUTTON_PRESSED(BUTTON_A) || BUTTON_PRESSED(BUTTON_B) || BUTTON_PRESSED(BUTTON_L)) {
        if(gran.direction){
            gran.aniState = LEFTTHROW;

        } else {
            gran.aniState = RIGHTTHROW;

        }
    }

    // If the gran aniState is idle, frame is gran standing
    if (gran.aniState == IDLEWALK) {
        gran.curFrame = 0;
        gran.aniState = gran.prevAniState;
    } else {
        gran.aniCounter++;
    }
}

// Draw Gran
void drawGran() {
    if (gran.active) {
        shadowOAM[0].attr0 = (ROWMASK & gran.screenRow) | ATTR0_TALL;
        shadowOAM[0].attr1 = (COLMASK & gran.screenCol) | ATTR1_LARGE;
        if(gran.cdel == 1) {
            if (gran.aniState == RIGHTWALK || gran.aniState == LEFTWALK || gran.aniState == IDLEWALK) {
                shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(gran.aniState * 4, gran.curFrame * 8);
            } 
            else {
                shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(gran.aniState * 4, gran.curFrame * 8);
            }
        }

    } else {
        shadowOAM[0].attr0 = ATTR0_HIDE;
    }
}

// Initializes Rabbits
void initRabbits() {
    rabbit.worldRow = 135;
    // Make appear in front of gran
    rabbit.worldCol = ((rand() + 250) % 512) + gran.screenCol;
    rabbit.width = 64;
    rabbit.height = 64;
    rabbit.type = (rand() + 60) % 2;
    rabbit.active = 1;
    rabbit.aniCounter = 0;
    rabbit.curFrame = 0;
    rabbit.numFrames = 3;
}

// Updates Rabbits
void updateRabbits() {
    if(rabbit.aniCounter == 16) {
        rabbit.curFrame = (rabbit.curFrame + 1) % rabbit.numFrames;
        rabbit.aniCounter = 0;
    }
    rabbit.aniCounter++;

    // Move rabbit left
    rabbit.worldCol -= 1.1;
    // Move rabbit up and down
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

// Draw Rabbits
void drawRabbits() {
    if (rabbit.active) {
        shadowOAM[5].attr0 = (ROWMASK & rabbit.screenRow) | ATTR0_SQUARE;
        shadowOAM[5].attr1 = (COLMASK & rabbit.screenCol) | ATTR1_MEDIUM;
        if (rabbit.type == 0) {
            shadowOAM[5].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(16, rabbit.curFrame * 4);
        } else if (rabbit.type == 1) {
            shadowOAM[5].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(16, 12 + (rabbit.curFrame * 4));

        }
    } else {  //hide sprite if not active
        shadowOAM[5].attr0 = ATTR0_HIDE;
    }
}

// Initializes Foods
void initFoods() {
    for (int i = 0; i < FOODCOUNT; i++) {
		foods[i].screenRow = 105;
		foods[i].screenCol = gran.screenCol + 5;
        foods[i].worldCol = gran.worldCol + 5;

		foods[i].cdel = 3;
		foods[i].active = 0;
        foods[i].height = 16;
		foods[i].width = 16;
        // carrot/cookie worth 3 points
        foods[i].worth = 0;
	}
}

// Fires Foods
void fireFoods(int type) {

	// find the first inactive foods, initialize it, and set it active
	for(int i = 0; i < FOODCOUNT; i++) {
		if (foods[i].active == 0 && gran.cdel == 1) {
			foods[i].active = 1;
            foods[i].type = type;
			foods[i].screenRow = 105;
			foods[i].screenCol = gran.screenCol + 5;
            foods[i].worldCol = gran.worldCol + 5;

            //determine direction food is thrown
            if(gran.direction){ //left
                foods[i].cdel = -3;
            } else { //right
                foods[i].cdel = 3;
            }

			break;
		}
	}
}


// Updates Food
void updateFoods(FOOD * f) {
    if (f->active) {
        // Move food based off of direction that is set upon firing
        f->worldCol += f->cdel;

        // Food - rabbit collision
        if ((f->type == 0 || f->type == 2) && rabbit.type == 0) { // cookie & cheat cookie
            if (f->active && collision(f->screenCol, f->screenRow, f->width, f->height, rabbit.screenCol, rabbit.screenRow, rabbit.width, rabbit.height)) {
                f->active = 0;
                // Respawn Rabbit
                rabbit.type = rand() % 2; // randomize type of new rabbit
                rabbit.worldCol = gran.worldCol + (rand() % 150) + 150; // 100 - 200 px in front of gran
                // cookie worth 3 point
                if (f->type == 0) {
                    f->worth = 3;
                }
                // cheat only worth 1 point
                if (f->type == 2) {
                    f->worth = 1;
                }

                score += f->worth;
                playSoundB(dingSound, DINGSOUNDLEN - 100, 0);
            }
        } else if ((f->type == 1 || f->type == 2) && rabbit.type == 1) { // carrot & cheat cookie
            if (f->active && collision(f->screenCol, f->screenRow, f->width, f->height, rabbit.screenCol, rabbit.screenRow, rabbit.width, rabbit.height)) {
                f->active = 0;
                rabbit.type = (rand() + 3) % 2; // randomize type of new rabbit
                rabbit.worldCol = gran.worldCol + (rand() % 150) + 150; 
                // carrot worth 3 point
                if (f->type == 1) {
                    f->worth = 3;
                }
                // cheat only worth 1 point
                if (f->type == 2) {
                    f->worth = 1;
                }
                score += f->worth;
                playSoundB(dingSound, DINGSOUNDLEN - 100, 0);
            }
        }

        f->screenCol = f->worldCol - hOff;

        if (f->screenCol > SCREENWIDTH || f->screenCol < 0) {
            f->active = 0;
        }
	}

    // reaches garden
    if (rabbit.worldCol <= 60) {
        rabbit.active = 0;
        gran.active = 0;
        f->active = 0;
        goToLose();
    }

    // pauses granny
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

// Draw Foods
void drawFoods() {
    for (int i = 0; i < FOODCOUNT; i++) {
        if (foods[i].active) {
            shadowOAM[10 + i].attr0 = (ROWMASK & foods[i].screenRow) | ATTR0_SQUARE;
            shadowOAM[10 + i].attr1 = (COLMASK & foods[i].screenCol) | ATTR1_SMALL;
            if (foods[i].type == 0) {  // cookie
                shadowOAM[10 + i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 24);
            } else if (foods[i].type == 1) {  // carrot
                // hard code for now because aniState isn't always mapped to the correct carrot direction
                int tileCol = 0;
                if (gran.aniState == LEFTWALK || gran.aniState == LEFTTHROW) {
                    tileCol = 2;
                }
                shadowOAM[10 + i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(tileCol, 26);
            } else if (foods[i].type == 2) { // cheat
                shadowOAM[10 + i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 28); 
            }
        } else { // hide sprite if not active
            shadowOAM[10 + i].attr0 = ATTR0_HIDE;
        }
    }

}

// Helper for drawScore()
int getNum(int num, int digit) {
    num /= pow(10, digit);
    return num % 10;
}

// Draws Score
void drawScore() {
    for (int i = 0; i < 3; i++) {
        if (gran.active) {
            shadowOAM[15 + i].attr0 = 10 | ATTR0_SQUARE;
            shadowOAM[15 + i].attr1 = ATTR1_SMALL | (SCREENWIDTH / 2 - (10 * i) + 3);
            shadowOAM[15 + i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(2 * getNum(score, i), 30);
        } else { // hide sprite if not active
            shadowOAM[15 + i].attr0 = ATTR0_HIDE;
        }
    }
}

void drawImTired() {
    if (gran.active && gran.cdel == 0) {
        shadowOAM[18].attr0 = 10 | ATTR0_WIDE | gran.worldRow - 25;
        shadowOAM[18].attr1 = ATTR1_LARGE | gran.screenCol;
        shadowOAM[18].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(4, 24);
    } else { // hide sprite if not active
        shadowOAM[18].attr0 = ATTR0_HIDE;
    }
}