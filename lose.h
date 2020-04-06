
//{{BLOCK(lose)

//======================================================================
//
//	lose, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 356 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 11392 + 2048 = 13952
//
//	Time-stamp: 2020-03-29, 22:34:07
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_LOSE_H
#define GRIT_LOSE_H

#define loseTilesLen 11392
extern const unsigned short loseTiles[5696];

#define loseMapLen 2048
extern const unsigned short loseMap[1024];

#define losePalLen 512
extern const unsigned short losePal[256];

#endif // GRIT_LOSE_H

//}}BLOCK(lose)
