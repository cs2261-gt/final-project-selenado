
//{{BLOCK(directions)

//======================================================================
//
//	directions, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 408 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 13056 + 2048 = 15616
//
//	Time-stamp: 2020-04-20, 21:13:01
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_DIRECTIONS_H
#define GRIT_DIRECTIONS_H

#define directionsTilesLen 13056
extern const unsigned short directionsTiles[6528];

#define directionsMapLen 2048
extern const unsigned short directionsMap[1024];

#define directionsPalLen 512
extern const unsigned short directionsPal[256];

#endif // GRIT_DIRECTIONS_H

//}}BLOCK(directions)
