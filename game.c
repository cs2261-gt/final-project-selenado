#include "myLib.h"
#include "game.h"
#include "spritesheet.h"

// Variables
int hOff;
int vOff;
GRANNY gran;
RABBIT rabbit;
FOOD foods[FOODCOUNT];
OBJ_ATTR shadowOAM[128];
// int cookiesRemaining;
// int playing;

// Walking animation states for aniState
enum {RIGHTTHROW,LEFTTHROW,RIGHTWALK,LEFTWALK,IDLEWALK};
enum {RABFLOOR}; 
// enum {RABFLOOR, RABLAUNCH, RABAIR};   // rabbit

// Initialize the game
void initGame() {
    hOff = 0;
    // playing = 1;
    initGran();
    initRabbits();
    initFoods();
    // cookiesRemaining = COOKIECOUNT;
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
    // waitForVBlank();
    // DMANow(3, shadowOAM, OAM, 128 * 4);

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
    
    for (int i = 0; i < FOODCOUNT; i++) {
        // throw cookies
        if (BUTTON_PRESSED(BUTTON_A)) {
            foods[i].type = 0;
            fireFoods();
        }
        // throw carrots
        if (BUTTON_PRESSED(BUTTON_B)) {
            foods[i].type = 1;
            fireFoods();
        }

    }

    // // throw cookies
    // if (BUTTON_PRESSED(BUTTON_A)) {
        
	// 	fireFoods();
	// }

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
        hOff--;
        gran.direction = 1;
    }
    if(BUTTON_HELD(BUTTON_RIGHT)){
        gran.aniState = RIGHTWALK;
        hOff++;
        gran.direction = 0;
    }
    if(BUTTON_PRESSED(BUTTON_A)) {
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
        if (gran.aniState == RIGHTWALK || gran.aniState == LEFTWALK || gran.aniState == IDLEWALK) {
            shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(gran.aniState * 4, gran.curFrame * 8);
        } 
        else {
            shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(gran.aniState * 4, gran.curFrame * 8);
        }
    } else {
        shadowOAM[0].attr0 = ATTR0_HIDE;
    }


        // shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 0);

}

// Initializes Rabbits
void initRabbits() {
    rabbit.worldRow = 135;
    // Make appear in front of gran
    rabbit.worldCol = ((rand() + 250) % 512) + gran.screenCol;
    rabbit.cdel = 1;
    rabbit.width = 64;
    rabbit.height = 64;
    rabbit.type = (rand() + 60) % 2;

    rabbit.active = 1;
    rabbit.aniCounter = 0;
    rabbit.curFrame = 0;
    rabbit.numFrames = 3;
    // rabbit.aniState = RABFLOOR;
}

// Updates Rabbits
void updateRabbits() {
    if(rabbit.aniCounter == 25) {
        rabbit.curFrame = (rabbit.curFrame + 1) % rabbit.numFrames;
        rabbit.aniCounter = 0;
    }
    rabbit.aniCounter++;

    // Move rabbit left
    rabbit.worldCol--;
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

    if (rabbit.worldCol == 60) {
        rabbit.active = 0;
        gran.active = 0;
        goToLose();
    }

}

// Draw Rabbits
void drawRabbits() {
    if (rabbit.active) {
        shadowOAM[5].attr0 = (ROWMASK & rabbit.screenRow) | ATTR0_SQUARE;
        shadowOAM[5].attr1 = (COLMASK & rabbit.screenCol) | ATTR1_MEDIUM;
        if (rabbit.type == 0) {
            shadowOAM[5].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(16, rabbit.curFrame * 4);
        } else if (rabbit.type == 1) {
            shadowOAM[5].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(24, rabbit.curFrame * 4);

        }

        // shadowOAM[5].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID((rabbit.aniState * 8) + 16, rabbit.curFrame * 4);
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
	}
}

// Fires Foods
void fireFoods() {

	// find the first inactive foods, initialize it, and set it active
	for(int i = 0; i < FOODCOUNT; i++) {
		if (foods[i].active == 0) {
			foods[i].active = 1;
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
        if (f->type == 0 && rabbit.type == 0) { // cookie
            if (collision(f->screenCol, f->screenRow, f->width, f->height, rabbit.screenCol, rabbit.screenRow, rabbit.width, rabbit.height)) {
                f->active = 0;
                // Respawn Rabbit
                rabbit.type = rand() % 2; // randomize type of new rabbit
                rabbit.worldCol = gran.worldCol + (rand() % 150) + 150; // 100 - 200 px in front of gran
            }
        } else if (f->type == 1 && rabbit.type == 1) { // carrot
            if (collision(f->screenCol, f->screenRow, f->width, f->height, rabbit.screenCol, rabbit.screenRow, rabbit.width, rabbit.height)) {
                f->active = 0;
                rabbit.type = (rand() + 3) % 2; // randomize type of new rabbit
                rabbit.worldCol = gran.worldCol + (rand() % 150) + 150; 
            }
        }


        f->screenCol = f->worldCol - hOff;

        if (f->screenCol > SCREENWIDTH || f->screenCol < 0) {
            f->active = 0;
        }
	}
}

// Draw Foods
void drawFoods() {
    for (int i = 0; i < FOODCOUNT; i++) {
        if (foods[i].active) {
            shadowOAM[10].attr0 = (ROWMASK & foods[i].screenRow) | ATTR0_SQUARE;
            shadowOAM[10].attr1 = (COLMASK & foods[i].screenCol) | ATTR1_SMALL;
            if (foods[i].type == 0) {
                shadowOAM[10].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 24);
            } else if (foods[i].type == 1) {
                // hard code for now because aniState isn't always mapped to the correct carrot direction
                int tileCol = 0;
                if (gran.aniState == LEFTWALK || gran.aniState == LEFTTHROW) {
                    tileCol = 2;
                }
                shadowOAM[10].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(tileCol, 26);
            }
        } else { // hide sprite if not active
            shadowOAM[10+i].attr0 = ATTR0_HIDE;
        }
    }

}

