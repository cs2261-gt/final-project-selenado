
//{{BLOCK(house)

//======================================================================
//
//	house, 512x256@4, 
//	+ palette 256 entries, not compressed
//	+ 758 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32 
//	Total size: 512 + 24256 + 4096 = 28864
//
//	Time-stamp: 2020-04-04, 18:38:04
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_HOUSE_H
#define GRIT_HOUSE_H

#define houseTilesLen 24256
extern const unsigned short houseTiles[12128];

#define houseMapLen 4096
extern const unsigned short houseMap[2048];

#define housePalLen 512
extern const unsigned short housePal[256];

#endif // GRIT_HOUSE_H

//}}BLOCK(house)
