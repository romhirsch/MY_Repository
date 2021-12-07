#include "utils.h"
#include <ansi_c.h>
#include "toolbox.h"

int  DLLEXPORT check_hit_func (OBJECT* object1, OBJECT* object2, int height, int width){
   	if (!(object1->exist) || !(object2->exist)) return 0;
	if (((object1->x < object2->x + width && object1->x > object2->x) || 
				(object1->x + width/2 < object2->x + width && object1->x + width/2 > object2->x) || 
				(object1->x + width < object2->x + width && object1->x + width > object2->x)) && 
				((object1->y < object2->y + height && object1->y > object2->y) || 
				(object1->y + height/2 < object2->y + height && object1->y + height/2 > object2->y) || 
				(object1->y + height < object2->y + height && object1->y + height > object2->y))) return 1;
	else return 0;
}


int DLLEXPORT create_object(OBJECT *objects ,int object_width,int object_height)
{
	srand(clock());
	objects->exist=true;
	objects->x=(int)Random(object_width, CANVAS_WIDTH - object_width);
	objects->y=(int)Random(object_height, CANVAS_HEIGHT - object_height);
	return 1;
}


int DLLEXPORT init_tank1(OBJECT *T){
	T->y=CANVAS_HEIGHT/2;
	T->x = 0;
	T->exist=true;
	T->shots=8;
	T->state=0;
	T->hearts=3;
	T->rotate=false;
	T->Fire=false;
	T->playerNum=1;
	T->speed=(SPEED*2);
	T->Number_shot=0;
	T->Eelement_bomb=0;
	T->Eelement_speed=0;
	T->Eelement_hearts=0;
	T->hits=0;
	return 0;
}


int DLLEXPORT init_tank2(OBJECT *T){
	T->y= CANVAS_HEIGHT/2;
	T->x = CANVAS_WIDTH;
	T->exist=true;
	T->shots=8;
	T->state=1;
	T->hearts=3;
	T->rotate=false;
	T->Fire=false;
	T->playerNum=2;
	T->speed=(SPEED*2);
	T->Number_shot=0;
	T->Eelement_bomb=0;
	T->Eelement_speed=0;
	T->Eelement_hearts=0;
	T->hits=0;
	return 0;
}

int DLLEXPORT ReadWinsFromFile(){
	FILE *fp;
	int wintank1,wintank2;
	fp = fopen("winsFile.txt", "r"); // read mode
	fscanf(fp, "%d,%d", &wintank1,&wintank2);
	fclose(fp);
	return wintank1,wintank2  ;
	
}

int DLLEXPORT WriteWinsToFile(int wintank1,int wintank2){
	FILE *fp;
	fp = fopen("winsFile.txt", "w"); // read mode
	fprintf(fp, "%d,%d", wintank1,wintank2);
	fclose(fp);
	return wintank1,wintank2  ;
	
	
}

int  DLLEXPORT check_hit_func_tank2 (OBJECT* object1, OBJECT* object2, int height, int width)
{
	if (!(object1->exist) || !(object2->exist)) return 0;
		if (((object1->x > object2->x - width) && (object1->x < object2->x)) && ((object1->y < object2->y + height) && (object1->y > object2->y)) ) 
			return 1;
	else return 0;
}


int  DLLEXPORT check_hit_func_tank (OBJECT* object1, OBJECT* object2, int height, int width)
{
	if (!(object1->exist) || !(object2->exist)) return 0;
		if (((object1->x < object2->x + width) && (object1->x > object2->x)) && ((object1->y < object2->y + height) && (object1->y > object2->y)) ) 
			return 1;
	else return 0;
}
