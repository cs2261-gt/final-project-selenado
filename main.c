#include "myLib.h"
#include "spritesheet.h"
// #include "game.h"
#include "titlescreen.h"
#include "directions.h"
#include "pause.h"
#include "win.h"
#include "lose.h"
#include "house.h"
#include "sky.h"


// Prototypes
void initialize();
// State Prototypes
void goToStart();
void startState();
void goToGame();
void gameState();
void goToLose();
void loseState();

// Button Variables
unsigned short buttons;
unsigned short oldButtons;

unsigned short hOff;

// States
enum {START, DIRECTIONS, GAME, PAUSE, WIN, LOSE};
int state;

//int seed;

int main() {

    initialize();

    while(1) {

        // Update button variables
        oldButtons = buttons;
        buttons = BUTTONS;

        // State Machine
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
            case WIN:
                winState();
                break;
            case LOSE:
                loseState();
                break;
        }
	}
    return 0;
}

// Initialize the game on first launch
void initialize() {
    REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | SPRITE_ENABLE;
    goToStart();
}

// State and State Transition Functions
void goToStart() {
    DMANow(3, titlescreenPal, PALETTE, titlescreenPalLen / 2);
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_SIZE_SMALL;
    DMANow(3, titlescreenTiles, &CHARBLOCK[0], titlescreenTilesLen / 2);
    DMANow(3, titlescreenMap, &SCREENBLOCK[28], titlescreenMapLen / 2);
    // hides sprites during start screen
    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 256);
    state = START;
}

void goToDirections() {
    DMANow(3, directionsPal, PALETTE, directionsPalLen / 2);
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_SIZE_SMALL;
    DMANow(3, directionsTiles, &CHARBLOCK[0], directionsTilesLen / 2);
    DMANow(3, directionsMap, &SCREENBLOCK[28], directionsMapLen / 2);
    // hides sprites during start screen
    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 256);
    state = DIRECTIONS;
}

void goToGame() {
    DMANow(3, housePal, PALETTE, housePalLen / 2);
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_SIZE_WIDE;
    DMANow(3, houseTiles, &CHARBLOCK[0], houseTilesLen / 2);
    DMANow(3, houseMap, &SCREENBLOCK[28], houseMapLen / 2);

    REG_BG1CNT = BG_CHARBLOCK(2) | BG_SCREENBLOCK(30) | BG_SIZE_WIDE;
    DMANow(3, skyTiles, &CHARBLOCK[2], skyTilesLen / 2);
    DMANow(3, skyMap, &SCREENBLOCK[30], skyMapLen / 2);

    //spritesheet
    DMANow(3, spritesheetPal, SPRITEPALETTE, 256);
    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);
    
    hOff = 0;
    state = GAME;
}

void goToPause() {
    DMANow(3, pausePal, PALETTE, pausePalLen / 2);
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_SIZE_SMALL;
    DMANow(3, pauseTiles, &CHARBLOCK[0], pauseTilesLen / 2);
    DMANow(3, pauseMap, &SCREENBLOCK[28], pauseMapLen / 2);
    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 256);
    state = PAUSE;
}

void goToWin() {
    DMANow(3, winPal, PALETTE, winPalLen / 2);
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_SIZE_SMALL;
    DMANow(3, winTiles, &CHARBLOCK[0], winTilesLen / 2);
    DMANow(3, winMap, &SCREENBLOCK[28], winMapLen / 2);
    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 256);
    state = WIN;
}

void goToLose() {
    DMANow(3, losePal, PALETTE, losePalLen / 2);
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_SIZE_SMALL;
    DMANow(3, loseTiles, &CHARBLOCK[0], loseTilesLen / 2);
    DMANow(3, loseMap, &SCREENBLOCK[28], loseMapLen / 2);
    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 256);
    state = LOSE;
}

void startState() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToDirections();  
    }
    if (BUTTON_PRESSED(BUTTON_DOWN)) {
        initGame();
        goToGame();
    }
}

void directionsState(){
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        initGame();
        goToGame();
    }
}

void gameState() {

    updateGame();
    drawGame();
        
    // Scroll the background
    // if(BUTTON_HELD(BUTTON_LEFT)) {
    //     hOff--;
    // }
    // if(BUTTON_HELD(BUTTON_RIGHT)) {
    // if(BUTTON_HELD(BUTTON_RIGHT)) {
    //     hOff++;
    // }

	waitForVBlank();
    DMANow(3, shadowOAM, OAM, 256);

    REG_BG0HOFF = hOff;
    REG_BG1HOFF = hOff / 2;
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }
    if (BUTTON_PRESSED(BUTTON_DOWN)) {
        goToLose();
    }
}

void pauseState() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
    }
    if (BUTTON_PRESSED(BUTTON_UP)) {
        goToStart();
    }
}

void winState() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
        // initGame();
    }
}

void loseState() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
        // initGame();
    }
}