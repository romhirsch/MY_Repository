#ifndef PROJECT_UTILS
#define PROJECT_UTILS

#include <windows.h>
#include <cvirte.h>	

#define PLAYER_HEIGHT 50
#define PLAYER_WIDTH 100
#define CANVAS_HEIGHT 624
#define CANVAS_WIDTH 1137
#define SPEED 5


typedef enum { false, true } bool;

typedef struct DLLIMPORT object{
	bool exist;
	int y;
	int x;
	int z;
	int state;
	int shots;
	bool rotate;
	int hearts;
	int moveToState;
	int Fire;
	int playerNum;
	int Number_shot;
	int Eelement_bomb;
	int Eelement_speed;
	double speed;
	int hits;
	int Eelement_hearts;
} OBJECT;


int DLLEXPORT check_hit_func (OBJECT* object1, OBJECT* object2, int height, int width);
int DLLEXPORT create_object(OBJECT *objects ,int object_width,int object_height);
int DLLEXPORT init_tank1(OBJECT *T);
int DLLEXPORT init_tank2(OBJECT *T);
int DLLEXPORT ReadWinsFromFile();
int DLLEXPORT WriteWinsToFile(int wintank1,int wintank2);
int  DLLEXPORT check_hit_func_tank (OBJECT* object1, OBJECT* object2, int height, int width)  ;
int  DLLEXPORT check_hit_func_tank2 (OBJECT* object1, OBJECT* object2, int height, int width);


#endif 
