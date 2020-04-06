// Granny Struct
typedef struct {
	int screenRow;
	int screenCol;
	int worldRow;
	int worldCol;
	int cdel;
	int height;
	int width;
	int direction;

	int active;
    int aniCounter;
    int curFrame;
    int numFrames;
    int aniState;
	int prevAniState;
} GRANNY;

// Rabbit Struct
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

// Cookie Struct
typedef struct {
	int screenRow;
	int screenCol;
	int worldCol;
	int type;

	int cdel;
	int rdel;
	int height;
	int width;
	int active;
	int aniState;
	// int curFrame;
	// int numFrames;
} FOOD;

// Constants
#define FOODCOUNT 100
#define MAPHEIGHT 256
#define MAPWIDTH 512

// Variables
extern GRANNY gran;
extern FOOD foods[FOODCOUNT];
extern RABBIT rabbit;
extern int cookiesRemaining;
extern int hOff;
extern int vOff;
extern OBJ_ATTR shadowOAM[128];

// Prototypes
void initGame();
void updateGame();
void drawGame();
void initGran();
void updateGran();
void drawGran();
void initRabbits();
void updateRabbits();
void drawRabbits();
void initFoods();
void fireFoods();
void updateFoods(FOOD *);
void drawFoods();