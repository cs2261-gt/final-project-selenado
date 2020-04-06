
//{{BLOCK(pause)

//======================================================================
//
//	pause, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 363 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 11616 + 2048 = 14176
//
//	Time-stamp: 2020-03-29, 21:21:22
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_PAUSE_H
#define GRIT_PAUSE_H

#define pauseTilesLen 11616
extern const unsigned short pauseTiles[5808];

#define pauseMapLen 2048
extern const unsigned short pauseMap[1024];

#define pausePalLen 512
extern const unsigned short pausePal[256];

#endif // GRIT_PAUSE_H

//}}BLOCK(pause)
