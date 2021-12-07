#include "wmp.h"
#include <rs232.h>
#include "toolbox.h"
#include <utils.h>	

#include <ansi_c.h>
#include <cvirte.h>		
#include <userint.h>
#include "gameuir.h"
#include<stdio.h>
#include <Windows.h>

//DeFine variable 
#define RAND_MAX 100;
#define TIMER_DELAY 50
#define PI 3.14159
#define SHOT_ELEMENT_HEIGHT 20
#define SHOT_ELEMENT_WIDTH 20
#define HEART_HEIGHT 25
#define HEART_WIDTH 25
#define BOMB_HEIGHT 35
#define BOMB_WIDTH 40
#define BULLET_SIZE 10
#define SHOT_SPEED 3.5
#define MAX_CHARS 15


int confStatics(void *params);
static int playerWin=0;
int Config();
void MyPolling () ;
int SendString (char *SendBuff) ;
int displayWin();
int displayLose() ;

//RS232
int SendCom = 1;
int RecvCom = 1;
int Err;
int LineNum = 0;
static int panelRS;

int menuBarHandle; 

//structions
typedef enum { right,left,up,down } clickmoute;
typedef union mColor {
	int value;
	unsigned char bytes[4];
} mColor;

//function declaration
int create_hearts_element();
int	 windowsGame();
int RotateOBJECT(OBJECT *T,int state,int tank_num);
int threadSound(void *params);
int rotate_func() ;
int load_image();
void restore_pixelArray();
int create_shot_element();
int shot(void *functionData);
int updateTankspeed(void *params);
int create_run_element();


//image process
int imageWidth, imageHeight, pixelDepth, pixels, cWidth, cHeight;
static int bitsSize,bpr;
unsigned char* bytesArray;
int* rotateArray; 
int* pixelArray;
bool Rotate,Rotate2;

mColor color;
static clickmoute last_click1=left,last_click2=left; 
static int STATE,STATE2;
static int panelGame,panelMedia,panelMain,panelStat,panelHow;
static int player_bm,background_bm,fire,explosion,wall,player_bm2,speed_bm,hearts_bm;
static int* *player_im;
CmtThreadFunctionID thID = 0;
int new_game(void);
int draw_game (void *functionData);
//int draw_game() ;
bool windowsGameStart=false;
//sound :					 
CAObjHandle mediaHandle;
bool statGame=false;




//shot 
#define SHOT_SIZE 30
static OBJECT SHOT_ARRAY[SHOT_SIZE+1];
static OBJECT SPEED_ELEMENT[10];
static OBJECT HEARTS_ELEMENT[10];
static OBJECT SHOT_ELEMENT[10];
static int INDEX_SHOT_ELEMENT=0;
static int INDEX_SHOT=0,NUM_SHOTS=SHOT_SIZE,HEARTS=4;

static bool SHOT=false,FIRE=false;
int sound_flag = 1, diff=1, control_conf = 0;
bool game_on=true;
static OBJECT tank;
static OBJECT tank2;
static OBJECT *seccond_tank;
static OBJECT *currect_tank;
static bool gameon=false ;
static playerNum=0;
int pause=0;
bool CREATE_ELEMENT_RUN = false;
bool CREATE_ELEMENT_SHOT = false;
bool GameIsStated=false;

int main (int argc, char *argv[])
{
	tank2.state=0;
	if (InitCVIRTE (0, argv, 0) == 0)
		return -1;	/* out of memory */
	if ((panelGame = LoadPanel (0, "gameuir.uir", PANEL_GAME)) < 0)
		return -1;
	if ((panelMedia = LoadPanel (0, "gameuir.uir", MEDIA)) < 0)
		return -1;
	if ((panelRS = LoadPanel (0, "gameuir.uir", PANEL_RS)) < 0)
		return -1;
	if ((panelMain = LoadPanel (0, "gameuir.uir", PANEL_MAIN)) < 0)
		return -1;
	if ((panelStat = LoadPanel (0, "gameuir.uir", PANEL_STAT)) < 0)
		return -1;
	if ((menuBarHandle = LoadMenuBar(panelGame, "gameuir.uir", BAR_NEWGAM)) < 0)
		return -1;
	
	if ((panelHow = LoadPanel(0, "gameuir.uir", PANEL_how)) < 0)
		return -1;
	GetObjHandleFromActiveXCtrl (panelMedia, MEDIA_WINDOWSMEDIAPLAYER, &mediaHandle);
	if(sound_flag)
		WMPLib_IWMPPlayer4SetURL(mediaHandle, NULL, "sounds//new_game.wav");
	DisplayPanel (panelMain);
	RunUserInterface ();
	DiscardPanel (panelGame);
	Err = CloseCom (SendCom);
	Err = CloseCom (RecvCom);
	return 0;
}



int CVICALLBACK GAME (int panel, int event, void *callbackData,
		int eventData1, int eventData2)
{
	static bool notchose=true;
	if (event == EVENT_CLOSE){
		game_on=false;	
		QuitUserInterface (0);
		free(bytesArray);
		free(pixelArray);
	}
	if (gameon){
		gameon=false;
		char ResBuff[100];
		while(notchose){

		PromptPopup ("Player Number", "Player Number 1 or 2 ",ResBuff,10 );
		if (strcmp("1",ResBuff)==0){
			currect_tank=&tank;
			seccond_tank=&tank2;
			playerNum=1;
			notchose=false;

		}
		else if (strcmp("2",ResBuff)==0){
			currect_tank=&tank2;
			seccond_tank=&tank;
			playerNum=2;
			notchose=false;
		}
		else{
			MessagePopup("Error","Please Chose Player 1 or 2");		
		}
	}
		SetCtrlVal (panelRS, PANEL_RS_COM, RecvCom);
		Config();
		char str[10];
		sprintf(str, "%d", playerNum);
		char send[20]="startGame";
		SendString(strcat(send, str));
		new_game();



	}
	if(statGame){
	switch ( event)
	{
		case EVENT_KEYPRESS:
			switch(eventData1) 
			{
				case 32:
					SendString("shot");
					CmtScheduleThreadPoolFunction (DEFAULT_THREAD_POOL_HANDLE,shot,currect_tank, &thID);
					if(sound_flag)
						CmtScheduleThreadPoolFunction (DEFAULT_THREAD_POOL_HANDLE,threadSound,"sounds//shotwave.wav", &thID);
					currect_tank->Number_shot++;
					break;
				case 1536: //0x800 arrow up
					SendString("up") ;
					if(currect_tank->y>0)
						currect_tank->y -= (currect_tank->speed);
						if (last_click1!=up){
							STATE = 1;
							currect_tank->moveToState = 1;
							currect_tank->rotate=true;
							Rotate = true;
						}
						last_click1=up;

					break;
				case 1792: //0x800 arrow down
					SendString("down");
					if(currect_tank->y<(CANVAS_HEIGHT-PLAYER_HEIGHT))
						currect_tank->y += (currect_tank->speed);
						if (last_click1!=down){
							STATE = 3 ;
							currect_tank->moveToState = 3;
							currect_tank->rotate=true;

							Rotate = true;
							
						}
						last_click1=down;

					break;
				case 2048: //0x800 arrow left
					SendString("left");
					if(currect_tank->x>0)
						currect_tank->x -= (currect_tank->speed);
					if (last_click1!=left){
						STATE = 0 ;
						currect_tank->moveToState = 0; 
						currect_tank->rotate=true;

						Rotate = true;
					}
					last_click1=left;
					break;
				case 2304:	//0x900 arrow right
					SendString("right");
					if(currect_tank->x<(CANVAS_WIDTH-PLAYER_WIDTH))
						currect_tank->x += (currect_tank->speed);  
					if (last_click1!=right){
						STATE = 2 ;
						currect_tank->moveToState = 2;
						currect_tank->rotate=true;
						Rotate = true;
					}
					last_click1=right;
					break;
				case 97: // a left
					if(tank2.x>=0)
						tank2.x -= (SPEED*2);
					break;
				case 100:	// d right
					if(tank2.x<(CANVAS_WIDTH-50))
						tank2.x += (SPEED*2);
					break;
				case 112: // p key
					pause = !pause;
					break;
				default:
					break;
			}

	}
	}
	return 0;
}

//image processing

int load_image(int tank_num){
	if (tank_num==1)
		player_im = &player_bm;
	else if (tank_num==2)
		player_im = &player_bm2;
	GetBitmapInfoEx (*player_im, NULL, &bitsSize, NULL, NULL);
	bytesArray=(unsigned char *)malloc(bitsSize);
	GetBitmapDataEx (*player_im, &bpr, &pixelDepth, &imageWidth, &imageHeight, NULL, bytesArray, NULL, NULL);
	pixels = imageWidth*imageHeight;
	pixelArray=(int*)malloc(pixels*sizeof(int));
	restore_pixelArray();
	return 0;
}

void restore_pixelArray()
{
	if(pixelDepth==24){
		for(int i=0, j=0; i<pixels; i++, j+=3){
			color.bytes[0]=bytesArray[j+2];
			color.bytes[1]=bytesArray[j+1];
			color.bytes[2]=bytesArray[j];
			pixelArray[i]=color.value;
		}
	}
	else if(pixelDepth==32){
		for(int i=0, j=0; i<pixels; i++, j+=4){
			color.bytes[0]=bytesArray[j];
			color.bytes[1]=bytesArray[j+1];
			color.bytes[2]=bytesArray[j+2];
			pixelArray[i]=color.value;
		}
	}
	else{
		QuitUserInterface (0);
		if(pixelArray!=NULL) free(pixelArray);
		if(bytesArray!=NULL) free(bytesArray);
		if(*player_im) *player_im=DiscardBitmap(*player_im); 
	}
}

int rotate_func ()
{
	int horizontal, vertical, pindex=0;
	rotateArray=(int*)malloc(pixels*sizeof(int));
	for(horizontal=0; horizontal<imageWidth; horizontal++)
	{
		for(vertical=imageHeight-1; vertical>=0; vertical--)
		{
			rotateArray[pindex]=pixelArray[horizontal+vertical*imageWidth];
			pindex++;
			if(pindex==pixels)
				break;
		}
	}
	for (pindex = 0; pindex<pixels; pindex++)
		pixelArray[pindex]=rotateArray[pindex];
	free(rotateArray);
//	if(player_bm) player_bm=DiscardBitmap(player_bm);
	bpr=imageHeight*4;
	imageHeight = imageWidth;
	imageWidth = bpr/4;
	NewBitmapEx (bpr, 32, imageWidth, imageHeight, NULL,
				 (unsigned char*)pixelArray, NULL, NULL, player_im);

	return 0;
}

//game function 

 int new_game(void){
	 	playerWin=0;
	 	init_tank1(&tank);
		init_tank2(&tank2);
		CanvasStartBatchDraw (panelGame, PANEL_GAME_CANVAS);
		CanvasClear (panelGame, PANEL_GAME_CANVAS, VAL_ENTIRE_OBJECT);
		//load images
		GetBitmapFromFile ("pictures//heart.png", &hearts_bm);
		GetBitmapFromFile ("pictures//speed2.jpg", &speed_bm);
		GetBitmapFromFile ("pictures//tank1.jpg", &player_bm);
		GetBitmapFromFile ("pictures//tank2.jpg", &player_bm2);
		GetBitmapFromFile ("pictures//background.png", &background_bm);
		GetBitmapFromFile ("pictures//shotElement.png", &fire);
		GetBitmapFromFile ("pictures//exp.png", &explosion);
		CanvasDrawBitmap (panelGame, PANEL_GAME_CANVAS, background_bm, VAL_ENTIRE_OBJECT, VAL_ENTIRE_OBJECT);
		CanvasDrawBitmap(panelGame, PANEL_GAME_CANVAS, player_bm, VAL_ENTIRE_OBJECT , MakeRect(tank.y, tank.x, PLAYER_HEIGHT, PLAYER_WIDTH));
		CanvasDrawBitmap(panelGame, PANEL_GAME_CANVAS, player_bm2, VAL_ENTIRE_OBJECT , MakeRect(tank2.y, tank2.x-100, PLAYER_HEIGHT, PLAYER_WIDTH));
		CanvasEndBatchDraw(panelGame, PANEL_GAME_CANVAS);
		windowsGameStart=true;
		CmtScheduleThreadPoolFunction (DEFAULT_THREAD_POOL_HANDLE, draw_game, NULL, &thID);
		//rotate tank1 
		tank.moveToState=2;
		tank.rotate=true;
		//rotate tank2
		tank2.moveToState=0;
		tank2.rotate=true;
		//CmtScheduleThreadPoolFunction (DEFAULT_THREAD_POOL_HANDLE,create_shot_element, NULL, &thID);
		//CmtScheduleThreadPoolFunction (DEFAULT_THREAD_POOL_HANDLE,create_run_element, NULL, &thID);
		//CmtScheduleThreadPoolFunction (DEFAULT_THREAD_POOL_HANDLE,create_hearts_element, NULL, &thID); 
	    return 0;
}


int draw_game (void *functionData){
	static bool OneTime=true;
	bool static exp=false,exp2=false ;
	static float count_exp=0,count_exp2=0;
	int j;
	while(game_on)
	{
		SetCtrlVal (panelGame,PANEL_GAME_NUMERIC_SHOTS,tank.shots);
		SetCtrlVal (panelGame,PANEL_GAME_NUMERIC_HEARTS,tank.hearts);
		SetCtrlVal (panelGame,PANEL_GAME_NUMERIC_SHOTS_2,tank2.shots);
		SetCtrlVal (panelGame,PANEL_GAME_NUMERIC_HEARTS_2,tank2.hearts);
		while(pause){
			SetCtrlAttribute (panelGame, PANEL_GAME_TXT, ATTR_VISIBLE, 1);
			SetCtrlVal (panelGame, PANEL_GAME_TXT, "pause");
		}
		SetCtrlAttribute (panelGame, PANEL_GAME_TXT, ATTR_VISIBLE, 0);
		while(!statGame){
			SetCtrlAttribute (panelGame, PANEL_GAME_TXT, ATTR_VISIBLE, 1);
			SetCtrlVal (panelGame, PANEL_GAME_TXT, "Wait to player");

		}
		
		if (windowsGameStart&&statGame){
			windowsGameStart=false;
			SetCtrlAttribute (panelGame, PANEL_GAME_TXT, ATTR_VISIBLE, 1);
			SetCtrlVal (panelGame, PANEL_GAME_TXT, "START GAME");
		Sleep(1e3*1);
			SetCtrlVal (panelGame, PANEL_GAME_TXT, "   Fight!!!!");
		Sleep(1e3*1);
			SetCtrlAttribute (panelGame, PANEL_GAME_TXT, ATTR_VISIBLE, 0);
		CmtScheduleThreadPoolFunction (DEFAULT_THREAD_POOL_HANDLE,create_shot_element, NULL, &thID);
		CmtScheduleThreadPoolFunction (DEFAULT_THREAD_POOL_HANDLE,create_run_element, NULL, &thID);
		CmtScheduleThreadPoolFunction (DEFAULT_THREAD_POOL_HANDLE,create_hearts_element, NULL, &thID); 
		}
		//Rotate tank1
			if(tank.rotate){ 
				RotateOBJECT(&tank,tank.moveToState,1);
				Rotate=false;

			}
		//Rotate tank2
		   if(tank2.rotate){
				int state2;
					switch(tank2.moveToState){
						case 0:
							state2=2 ;
							break;
						case 1:
							state2=3 ;
							break;
						case 2:
							state2=0;
							break;
						case 3:
							state2=1;
							break;
					}
					RotateOBJECT(&tank2,state2,2);
					tank2.rotate=false;
			}
			CmtScheduleThreadPoolFunction (DEFAULT_THREAD_POOL_HANDLE,confStatics, NULL, &thID);
			CanvasStartBatchDraw (panelGame, PANEL_GAME_CANVAS);
			CanvasClear (panelGame, PANEL_GAME_CANVAS, VAL_ENTIRE_OBJECT);
			CanvasDrawBitmap (panelGame, PANEL_GAME_CANVAS, background_bm, VAL_ENTIRE_OBJECT, VAL_ENTIRE_OBJECT);
			CanvasDrawBitmap(panelGame, PANEL_GAME_CANVAS, player_bm, VAL_ENTIRE_OBJECT , MakeRect(tank.y, tank.x, PLAYER_HEIGHT, PLAYER_WIDTH));
			CanvasDrawBitmap(panelGame, PANEL_GAME_CANVAS, player_bm2, VAL_ENTIRE_OBJECT , MakeRect(tank2.y, tank2.x-100, PLAYER_HEIGHT, PLAYER_WIDTH));
			 //#########################win_lose###################################
			if (tank.hearts==0){
				playerWin=2;
				if (playerNum==2){
					displayWin(&tank2);
					
				}
				else{
					displayLose(&tank);
				}
				game_on=false;
			
			}
			
			if (tank2.hearts==0){
				playerWin=1;
				if (playerNum==1){
					displayWin(&tank);
				}
				else{
					displayLose(&tank2);
				}
				game_on=false;
			
			}
				
			//######################### explosion #################################
			
			if (exp&&count_exp<0.07){
				count_exp+=0.01;
				CanvasDrawBitmap(panelGame, PANEL_GAME_CANVAS, explosion, VAL_ENTIRE_OBJECT , MakeRect(tank.y, tank.x, PLAYER_HEIGHT, PLAYER_WIDTH));
			}
			else{
				count_exp=0;
				exp=false;
			}
			
			if (exp2&&count_exp2<0.07){
				count_exp2+=0.01;
				CanvasDrawBitmap(panelGame, PANEL_GAME_CANVAS, explosion, VAL_ENTIRE_OBJECT , MakeRect(tank2.y, tank2.x-100, PLAYER_HEIGHT, PLAYER_WIDTH));
			}
			else{
				count_exp2=0;
				exp2=false;
			}
			
			
			//############################# element ###############################
			
			 for(j=0;j<10;j++){
				if (SHOT_ELEMENT[j].exist){
						if (check_hit_func(&(SHOT_ELEMENT[j]),currect_tank,PLAYER_HEIGHT,PLAYER_WIDTH)){
				 			SHOT_ELEMENT[j].exist=false;
							if(sound_flag)
								CmtScheduleThreadPoolFunction (DEFAULT_THREAD_POOL_HANDLE,threadSound,"sounds//elementsound.wav", &thID);
							currect_tank->shots++;
							currect_tank->Eelement_bomb++;
							SendString("addshot");

						}
						if (check_hit_func(&(SHOT_ELEMENT[j]),seccond_tank,PLAYER_HEIGHT,PLAYER_WIDTH)){
				 			SHOT_ELEMENT[j].exist=false;
							if(sound_flag)
								CmtScheduleThreadPoolFunction (DEFAULT_THREAD_POOL_HANDLE,threadSound,"sounds//elementsound.wav", &thID);


						}
						CanvasDrawBitmap(panelGame, PANEL_GAME_CANVAS, fire, VAL_ENTIRE_OBJECT , MakeRect(SHOT_ELEMENT[j].y, SHOT_ELEMENT[j].x, SHOT_ELEMENT_HEIGHT,SHOT_ELEMENT_WIDTH));
			 	}
				if (SPEED_ELEMENT[j].exist){
						if (check_hit_func(&(SPEED_ELEMENT[j]),currect_tank,PLAYER_HEIGHT,PLAYER_WIDTH)){
				 			SPEED_ELEMENT[j].exist=false;
							if(sound_flag)
								CmtScheduleThreadPoolFunction (DEFAULT_THREAD_POOL_HANDLE,threadSound,"sounds//elementsound.wav", &thID);
							CmtScheduleThreadPoolFunction (DEFAULT_THREAD_POOL_HANDLE,updateTankspeed,currect_tank, &thID);
							currect_tank->Eelement_speed++;
							SendString("addspeed");


						}
						if (check_hit_func(&(SPEED_ELEMENT[j]),seccond_tank,PLAYER_HEIGHT,PLAYER_WIDTH)){
				 			SPEED_ELEMENT[j].exist=false;
							if(sound_flag)
								CmtScheduleThreadPoolFunction (DEFAULT_THREAD_POOL_HANDLE,threadSound,"sounds//elementsound.wav", &thID);
						}
						CanvasDrawBitmap(panelGame, PANEL_GAME_CANVAS, speed_bm, VAL_ENTIRE_OBJECT , MakeRect(SPEED_ELEMENT[j].y, SPEED_ELEMENT[j].x, SHOT_ELEMENT_HEIGHT,SHOT_ELEMENT_WIDTH));
			 	}
				
				if (HEARTS_ELEMENT[j].exist){
						if (check_hit_func(&(HEARTS_ELEMENT[j]),currect_tank,PLAYER_HEIGHT,PLAYER_WIDTH)){
				 			HEARTS_ELEMENT[j].exist=false;
							if(sound_flag)
								CmtScheduleThreadPoolFunction (DEFAULT_THREAD_POOL_HANDLE,threadSound,"sounds//extra_life.wav", &thID);
							currect_tank->hearts++;
							currect_tank->Eelement_hearts++;
							SendString("addhearts");


						}
						if (check_hit_func(&(HEARTS_ELEMENT[j]),seccond_tank,PLAYER_HEIGHT,PLAYER_WIDTH)){
				 			HEARTS_ELEMENT[j].exist=false;
							if(sound_flag)
								CmtScheduleThreadPoolFunction (DEFAULT_THREAD_POOL_HANDLE,threadSound,"sounds//extra_life.wav", &thID);
						}
						CanvasDrawBitmap(panelGame, PANEL_GAME_CANVAS, hearts_bm, VAL_ENTIRE_OBJECT , MakeRect(HEARTS_ELEMENT[j].y, HEARTS_ELEMENT[j].x, SHOT_ELEMENT_HEIGHT,SHOT_ELEMENT_WIDTH));
			 	}
				
			}


			//############################# shot #################################

			for(j=0;j<SHOT_SIZE;j++)
				if (SHOT_ARRAY[j].exist){
					if (check_hit_func_tank(&SHOT_ARRAY[j],&tank,50,80)){
						SHOT_ARRAY[j].exist=false;
						tank.hearts--;
						if(sound_flag)
							CmtScheduleThreadPoolFunction (DEFAULT_THREAD_POOL_HANDLE,threadSound,"sounds//explosion.wav", &thID);
						exp=true;
						tank2.hits++;

					}
					else if (check_hit_func_tank2(&SHOT_ARRAY[j],&tank2,50,80)){
						SHOT_ARRAY[j].exist=false;
						tank2.hearts--;
						exp2=true;
						if(sound_flag)
							CmtScheduleThreadPoolFunction (DEFAULT_THREAD_POOL_HANDLE,threadSound,"sounds//explosion.wav", &thID);
						tank.hits++;
					}
					else
						CanvasDrawOval (panelGame, PANEL_GAME_CANVAS, MakeRect(SHOT_ARRAY[j].y+5,SHOT_ARRAY[j].x,BULLET_SIZE,BULLET_SIZE), VAL_DRAW_INTERIOR);
				}

			CanvasEndBatchDraw(panelGame, PANEL_GAME_CANVAS);
		Sleep(0.05*1e3);
	
	}
	return 0;
}


int updateTankspeed(void *params){
	OBJECT* T = (OBJECT*)params;
	T->speed=T->speed+0.3;
	Sleep(1e3*10);
	T->speed=(SPEED*2);
	return 0;
}



int RotateOBJECT(OBJECT *T,int state,int tank_num){
	int tmp = T->state;
	while(tmp!=state){
		load_image(tank_num);
		rotate_func();
		tmp++;
	if(tmp ==4)
		tmp=0;
	}
	T->state=tmp;
	return 0;
}


int threadSound(void *params){
	char* Data = (char*)params;
	WMPLib_IWMPPlayer4SetURL(mediaHandle, NULL, Data);
	return 0;	
}


int confStatics(void *params){
	int tab_handle;
	int winstank1,winstank2;
	FILE *fp;
	fp = fopen("winsFile.txt", "r"); // read mode
	fscanf(fp, "%d,%d", &winstank1,&winstank2);
	fclose(fp);
	GetPanelHandleFromTabPage(panelStat, PANEL_STAT_TAB, 0, &tab_handle);
	if (playerWin==1){
		SetTableCellVal (tab_handle, 2, MakePoint (1, 2),"Tank 1");
		SetTableCellVal (tab_handle, 2, MakePoint (2, 2), tank.Number_shot);
		SetTableCellVal (tab_handle, 2, MakePoint (3, 2), tank.Eelement_speed);
		SetTableCellVal (tab_handle, 2, MakePoint (4, 2), tank.Eelement_bomb);
		SetTableCellVal (tab_handle, 2, MakePoint (5, 2), tank.hits);
		SetTableCellVal (tab_handle, 2, MakePoint (6, 2), tank.Eelement_hearts);
		SetTableCellVal (tab_handle, 2, MakePoint (1, 3),"Tank 2");
		SetTableCellVal (tab_handle, 2, MakePoint (2, 3), tank2.Number_shot);
		SetTableCellVal (tab_handle, 2, MakePoint (3, 3), tank2.Eelement_speed);
		SetTableCellVal (tab_handle, 2, MakePoint (4, 3), tank2.Eelement_bomb);
		SetTableCellVal (tab_handle, 2, MakePoint (5, 3), tank2.hits);
		SetTableCellVal (tab_handle, 2, MakePoint (6, 3), tank2.Eelement_hearts);
		winstank1++;
		GetPanelHandleFromTabPage(panelStat, PANEL_STAT_TAB, 1, &tab_handle);
		if (winstank1>winstank2){
			SetTableCellVal (tab_handle, 2, MakePoint (1, 2),"Tank 2");
			SetTableCellVal (tab_handle, 2, MakePoint (2, 2),winstank2 );
			SetTableCellVal (tab_handle, 2, MakePoint (1, 3),"Tank 1");
			SetTableCellVal (tab_handle, 2, MakePoint (2, 3),winstank1 );
		} 
		else{
			SetTableCellVal (tab_handle, 2, MakePoint (1, 2),"Tank 1");
			SetTableCellVal (tab_handle, 2, MakePoint (2, 2),winstank1 );
			SetTableCellVal (tab_handle, 2, MakePoint (1, 3),"Tank 2");
			SetTableCellVal (tab_handle, 2, MakePoint (2, 3),winstank2 );
		}
		WriteWinsToFile(winstank1,winstank2);

	}
	else if (playerWin==2){
		SetTableCellVal (tab_handle, 2, MakePoint (1, 2),"Tank 2");
		SetTableCellVal (tab_handle, 2, MakePoint (2, 2), tank2.Number_shot);
		SetTableCellVal (tab_handle, 2, MakePoint (3, 2), tank2.Eelement_speed);
		SetTableCellVal (tab_handle, 2, MakePoint (4, 2), tank2.Eelement_bomb);
		SetTableCellVal (tab_handle, 2, MakePoint (5, 2), tank2.hits);
		SetTableCellVal (tab_handle, 2, MakePoint (6, 2), tank2.Eelement_hearts);
		SetTableCellVal (tab_handle, 2, MakePoint (1, 3),"Tank 1");
		SetTableCellVal (tab_handle, 2, MakePoint (2, 3), tank.Number_shot);
		SetTableCellVal (tab_handle, 2, MakePoint (3, 3), tank.Eelement_speed);
		SetTableCellVal (tab_handle, 2, MakePoint (4, 3), tank.Eelement_bomb);
		SetTableCellVal (tab_handle, 2, MakePoint (5, 3), tank.hits);
		SetTableCellVal (tab_handle, 2, MakePoint (6, 3), tank.Eelement_hearts);
		winstank2++;
		GetPanelHandleFromTabPage(panelStat, PANEL_STAT_TAB, 1, &tab_handle);
		if (winstank1>winstank2){
			SetTableCellVal (tab_handle, 2, MakePoint (1, 2),"Tank 2");
			SetTableCellVal (tab_handle, 2, MakePoint (2, 2),winstank2 );
			SetTableCellVal (tab_handle, 2, MakePoint (1, 3),"Tank 1");
			SetTableCellVal (tab_handle, 2, MakePoint (2, 3),winstank1 );
		} 
		else{
			SetTableCellVal (tab_handle, 2, MakePoint (1, 2),"Tank 1");
			SetTableCellVal (tab_handle, 2, MakePoint (2, 2),winstank1 );
			SetTableCellVal (tab_handle, 2, MakePoint (1, 3),"Tank 2");
			SetTableCellVal (tab_handle, 2, MakePoint (2, 3),winstank2 );	
			
		}
		WriteWinsToFile(winstank1,winstank2);
	}
	else{
		SetTableCellVal (tab_handle, 2, MakePoint (1, 2),"Tank 1");
		SetTableCellVal (tab_handle, 2, MakePoint (2, 2), tank.Number_shot);
		SetTableCellVal (tab_handle, 2, MakePoint (3, 2), tank.Eelement_speed);
		SetTableCellVal (tab_handle, 2, MakePoint (4, 2), tank.Eelement_bomb);
		SetTableCellVal (tab_handle, 2, MakePoint (5, 2), tank.hits);
		SetTableCellVal (tab_handle, 2, MakePoint (6, 2), tank.Eelement_hearts);
		SetTableCellVal (tab_handle, 2, MakePoint (1, 3),"Tank 2");
		SetTableCellVal (tab_handle, 2, MakePoint (2, 3), tank2.Number_shot);
		SetTableCellVal (tab_handle, 2, MakePoint (3, 3), tank2.Eelement_speed);
		SetTableCellVal (tab_handle, 2, MakePoint (4, 3), tank2.Eelement_bomb);
		SetTableCellVal (tab_handle, 2, MakePoint (5, 3), tank2.hits);
		SetTableCellVal (tab_handle, 2, MakePoint (6, 3), tank2.Eelement_hearts);
		GetPanelHandleFromTabPage(panelStat, PANEL_STAT_TAB, 1, &tab_handle);
		if (winstank1>winstank2){
			SetTableCellVal (tab_handle, 2, MakePoint (1, 2),"Tank 2");
			SetTableCellVal (tab_handle, 2, MakePoint (2, 2),winstank2 );
			SetTableCellVal (tab_handle, 2, MakePoint (1, 3),"Tank 1");
			SetTableCellVal (tab_handle, 2, MakePoint (2, 3),winstank1 );
		} 
		else{
			SetTableCellVal (tab_handle, 2, MakePoint (1, 2),"Tank 1");
			SetTableCellVal (tab_handle, 2, MakePoint (2, 2),winstank1 );
			SetTableCellVal (tab_handle, 2, MakePoint (1, 3),"Tank 2");
			SetTableCellVal (tab_handle, 2, MakePoint (2, 3),winstank2 );
		}
		
	}
	
	return 0;
		
}


int displayWin(OBJECT* T){
	SetCtrlAttribute (panelGame, PANEL_GAME_TXT, ATTR_VISIBLE, 1);
	SetCtrlVal (panelGame, PANEL_GAME_TXT, "  WINNER !!!");
	CmtScheduleThreadPoolFunction (DEFAULT_THREAD_POOL_HANDLE,threadSound,"sounds//tada.wav", &thID);
Sleep(1e3*2);
	DisplayPanel(panelStat);
	return 0;
}


int displayLose(){
	SetCtrlAttribute (panelGame, PANEL_GAME_TXT, ATTR_VISIBLE, 1);
	SetCtrlVal (panelGame, PANEL_GAME_TXT, "  LOSER !!!");
	CmtScheduleThreadPoolFunction (DEFAULT_THREAD_POOL_HANDLE,threadSound,"sounds//game_over.wav", &thID);
Sleep(1e3*2);
	DisplayPanel(panelStat);
	return 0;

}


int create_hearts_element(){
Sleep(1e3*20);
	int i,x=50,y=50;
	while(game_on){
		for(i=0;i<10;i++){
			OBJECT * current_element=&HEARTS_ELEMENT[i];
			create_object(current_element,SHOT_ELEMENT_WIDTH,SHOT_ELEMENT_HEIGHT);
		Sleep(1e3*50);
		}
	}
	for(i=0;i<10;i++)
		HEARTS_ELEMENT[i].exist=false;

	return 0;
}

int create_run_element(){
Sleep(1e3*10);
	int i,x=50,y=50;
	while(game_on){
		for(i=0;i<10;i++){
			OBJECT * current_element=&SPEED_ELEMENT[i];
			create_object(current_element,SHOT_ELEMENT_WIDTH,SHOT_ELEMENT_HEIGHT);
		Sleep(1e3*20);
		}
	}
	for(i=0;i<10;i++)
		SPEED_ELEMENT[i].exist=false;
	return 0;
}

int create_shot_element(){
	int i,x=10,y=10;
	while(game_on){
		for(i=0;i<10;i++){
			OBJECT * current_element=&SHOT_ELEMENT[i];
			create_object(current_element,SHOT_ELEMENT_WIDTH,SHOT_ELEMENT_HEIGHT);
		Sleep(1e3*20);
		}
	for(i=0;i<10;i++)
		SHOT_ELEMENT[i].exist=false;
	}
	return 0;
}


int shot(void *param){
	OBJECT* Ttank = (OBJECT*)param;
	if (Ttank->shots>0){
		OBJECT *current_shot=&SHOT_ARRAY[INDEX_SHOT];
		if (current_shot->exist==false){
			current_shot->exist=true ;
			if (INDEX_SHOT+1== SHOT_SIZE)
				INDEX_SHOT=0;
			else
				INDEX_SHOT++;
			Ttank->shots--;
			SetCtrlVal (panelGame,PANEL_GAME_NUMERIC_SHOTS,Ttank->shots);
			Ttank->Fire=true;
			Sleep (0.2);
			Ttank->Fire=false;
			if (Ttank->playerNum==1){ 
				switch(Ttank->state){
					case 0:
						current_shot->x=Ttank->x-120;
						current_shot->y=Ttank->y+13;
						while( (current_shot->x-10)>0){
							if(current_shot->exist){
							Sleep(1e3*0.01) ;
								current_shot->x-=(SHOT_SPEED);
							}
						}
						break;
					case 1:
						current_shot->x=Ttank->x+PLAYER_WIDTH/2;
						current_shot->y=Ttank->y-50;
						while( (current_shot->y-10)>0){
							if(current_shot->exist){
							Sleep(1e3*0.01) ;
								current_shot->y-=(SHOT_SPEED);
							}
						}
						
						break;
					case 2:
						current_shot->x=Ttank->x+120;
						current_shot->y=Ttank->y+13;
						while( (current_shot->x-10)<CANVAS_WIDTH){
							if(current_shot->exist){
							Sleep(1e3*0.01) ;
								current_shot->x+=(SHOT_SPEED);
							}
						}
						break;
					case 3:
						current_shot->x=Ttank->x+PLAYER_WIDTH/2;
						current_shot->y=Ttank->y+PLAYER_HEIGHT;
						while( (current_shot->y-10)<CANVAS_HEIGHT){
							if(current_shot->exist){
							Sleep(1e3*0.01) ;
								current_shot->y+=(SHOT_SPEED);
							}
						}
						break;
				}
			}
			else if (Ttank->playerNum==2){
				switch(Ttank->state){
					case 2:
						current_shot->x=Ttank->x-120;
						current_shot->y=Ttank->y+13;
						while( (current_shot->x-10)>0){
							if(current_shot->exist){
							Sleep(1e3*0.01) ;
								current_shot->x-=(SHOT_SPEED);
							}
						}
						break;
					case 1:
						current_shot->x=Ttank->x-PLAYER_WIDTH/2;
						current_shot->y=Ttank->y+PLAYER_HEIGHT;
						while( (current_shot->y-10)<CANVAS_HEIGHT){
							if(current_shot->exist){
							Sleep(1e3*0.01) ;
								current_shot->y+=(SHOT_SPEED);
							}
						}
						break;
					case 0:
						current_shot->x=Ttank->x+120;
						current_shot->y=Ttank->y+13;
						while( (current_shot->x-10)<CANVAS_WIDTH){
							if(current_shot->exist){
							Sleep(1e3*0.01) ;
								current_shot->x+=(SHOT_SPEED);
							}
						}
						break;
					case 3:
						current_shot->x=Ttank->x-PLAYER_WIDTH/2;
						current_shot->y=Ttank->y-10;
						while( (current_shot->y-10)>0){
							if(current_shot->exist){
							Sleep(1e3*0.01) ;
								current_shot->y-=(SHOT_SPEED);
							}
						}
						
						break;
				}
				
			}
		Sleep(1e3*1) ;
			current_shot->exist=false;
		}
	}	
	return 0;
}


//command to tank2
int move_tank2(OBJECT *T,int move){
	switch(move){
			case 32:
				CmtScheduleThreadPoolFunction (DEFAULT_THREAD_POOL_HANDLE,shot,T, &thID);
				if(sound_flag)
					CmtScheduleThreadPoolFunction (DEFAULT_THREAD_POOL_HANDLE,threadSound,"sounds//shotwave.wav", &thID);
				T->Number_shot++;
				break;
			case 1536: //0x800 arrow up 
				if(T->y>0)
					T->y -= (T->speed);
					if (last_click2!=up){
						T->moveToState = 1;
						T->rotate = true;
					}
					last_click2=up;

				break;
			case 1792: //0x800 arrow down
				if(T->y<(CANVAS_HEIGHT-PLAYER_HEIGHT))
					T->y += (T->speed);
					if (last_click2!=down){
						T->moveToState = 3 ;
						T->rotate = true;
					}
					last_click2=down;

				break;
			case 2048: //0x800 arrow left
				if(T->x>0)
					T->x -= (T->speed);
				if (last_click2!=left){
					T->moveToState = 0 ; 
					T->rotate = true;
				}
				last_click2=left;
				break;
			case 2304:	//0x900 arrow right
				if(T->x<(CANVAS_WIDTH-PLAYER_WIDTH))
					T->x += (T->speed);  
				if (last_click2!=right){
					T->moveToState = 2 ; 
					T->rotate = true;
				}
				last_click2=right;
				break;
					
	}
	return 0;
}


void CVICALLBACK NewGame (int menuBar, int menuItem, void *callbackData,
						  int panel)
{
	statGame=false;
	game_on=false;
	Sleep(1e3*1);
	game_on=true;
	char str[10];
	sprintf(str, "%d", playerNum);
	char send[20]="startGame";
	SendString(strcat(send, str));
	new_game();
	
}



void MyPolling ()
{
	char RecBuff[100];
	int N;
	N = ComRdTerm (RecvCom, RecBuff, 100, 0);
	if (N>0){
		RecBuff[N] = 0;
		if (playerNum==1){
		 if ((strcmp("startGame2",RecBuff)==0)&&(!statGame)){
			 statGame=true;
		 	 SendString("startGame1");
		 }
		}
		else{
			if ((strcmp("startGame1",RecBuff)==0)&&(!statGame)){
			 statGame=true;
		 	 SendString("startGame2");
		 }	
		}
		if (strcmp("left",RecBuff)==0)
			move_tank2(seccond_tank,2048);
		else if (strcmp("right",RecBuff)==0)
			move_tank2(seccond_tank,2304);
		else if (strcmp("up",RecBuff)==0)
			move_tank2(seccond_tank,1536);
		else if (strcmp("down",RecBuff)==0)
			move_tank2(seccond_tank,1792);
		else if (strcmp("shot",RecBuff)==0)
			move_tank2(seccond_tank,32);
		else if (strcmp("addhearts",RecBuff)==0){
			seccond_tank->hearts++;
			seccond_tank->Eelement_hearts++;
		}
		else if (strcmp("addshot",RecBuff)==0){
			seccond_tank->shots++;
			seccond_tank->Eelement_bomb++;
		}
		else if (strcmp("addspeed",RecBuff)==0) {
			CmtScheduleThreadPoolFunction (DEFAULT_THREAD_POOL_HANDLE,updateTankspeed,seccond_tank, &thID);
			seccond_tank->Eelement_speed++;
		}
		InsertTextBoxLine (panelRS, PANEL_RS_RECIVER, -1, RecBuff);
		SetCtrlAttribute (panelRS, PANEL_RS_RECIVER, ATTR_FIRST_VISIBLE_LINE, LineNum++);
	}
	
	return;
}


int  Config (){
	Err = OpenComConfig (SendCom, "", 9600, 0, 7, 1, 512, 512);
	Err = OpenComConfig (RecvCom, "", 9600, 0, 7, 1, 512, 512);
	SetCtrlAttribute (panelRS, PANEL_RS_TIMER, ATTR_ENABLED, 1);
	InstallComCallback (RecvCom, LWRS_RXFLAG, 0, 0, 0, 0); 

	return 0;
}


int SendString (char *SendBuff)
{
	int Len;
	Len = strlen(SendBuff);
	//
	ComWrt (SendCom, SendBuff, Len+1);
	return 0;
}


int CVICALLBACK RecTimer (int panel, int control, int event,
		void *callbackData, int eventData1, int eventData2)
{
char RecBuff[100];
//Config ();
int N;
	switch (event)
	{
		case EVENT_TIMER_TICK:
			N = GetInQLen (RecvCom);
			if (!N)  return(0);
			MyPolling ();
			break;
	}
	return 1;
}


void CVICALLBACK BAR_RS232 (int menuBar, int menuItem, void *callbackData,
							int panel)
{
	GetCtrlVal (panelRS, PANEL_RS_COM, &SendCom);
	DisplayPanel (panelRS);
	
}


int CVICALLBACK CB (int panel, int event, void *callbackData,
					int eventData1, int eventData2)
{
	switch (event)
	{
		case EVENT_CLOSE:
			HidePanel (panelRS);
			break;
	}
	return 0;
}


//main PANEL : 


int CVICALLBACK how_to_play_func (int panel, int control, int event,
								  void *callbackData, int eventData1, int eventData2)
{
	switch (event)
	{
		case EVENT_COMMIT:
			DisplayPanel (panelHow);

			break;
	}
	return 0;
}


int CVICALLBACK new_game_button (int panel, int control, int event,
								 void *callbackData, int eventData1, int eventData2)
{
	switch (event)
	{
		case EVENT_COMMIT:
			GetCtrlVal (panelMain, PANEL_MAIN_COM_main, &SendCom);
			GetCtrlVal (panelMain, PANEL_MAIN_COM_main, &RecvCom);
			SetCtrlVal (panelRS, PANEL_RS_COM, SendCom);

			CmtScheduleThreadPoolFunction (DEFAULT_THREAD_POOL_HANDLE,threadSound,"sounds//ui-clicked.wav", &thID);
			gameon=true;
			DisplayPanel (panelGame);
			HidePanel (panelMain);
			break;
	}
	return 0;
}


int CVICALLBACK QuitCallback (int panel, int control, int event,
							  void *callbackData, int eventData1, int eventData2)
{
	switch (event)
	{
		case EVENT_COMMIT:
			QuitUserInterface (0);
			break;
	}
	return 0;
}



void CVICALLBACK menu_bar_sound_flag (int menuBar, int menuItem, void *callbackData, int panel){
	sound_flag = !sound_flag;
	SetMenuBarAttribute (menuBarHandle, BAR_NEWGAM_Options_sound_bar, ATTR_CHECKED, sound_flag);
}



int  CVICALLBACK QuitStatics(int panel, int event, void *callbackData, int eventData1, int eventData2)

{
	switch (event)
	{
		case EVENT_CLOSE:
			HidePanel (panelStat);
			break;
	}
	return 0;
}


int CVICALLBACK QuitMain (int panel, int event, void *callbackData,
						  int eventData1, int eventData2)
{
	switch (event)
	{
		case EVENT_CLOSE:
			QuitUserInterface (0);

			break;
	}
	return 0;
}


void CVICALLBACK Statics (int menuBar, int menuItem, void *callbackData,
						  int panel)
{
	DisplayPanel(panelStat);	
}


int CVICALLBACK quitHow (int panel, int event, void *callbackData,
						 int eventData1, int eventData2)
{
	switch (event)
	{
		case EVENT_CLOSE:
		   HidePanel(panelHow);
			break;
	}
	return 0;
}


void CVICALLBACK menu_bar_about (int menuBar, int menuItem, void *callbackData,
								 int panel)
{
	if(sound_flag)
		CmtScheduleThreadPoolFunction (DEFAULT_THREAD_POOL_HANDLE,threadSound,"sounds//ui-clicked.wav", &thID);
	MessagePopup("About", "Combat_Tanks \nCreate with LabWindows/CVI IDE\nCopyright Rom & Omer Inc. 2021\nAFEKA Tel-Aviv Academic College of Engineering");
}


void CVICALLBACK howtoplay_bar (int menuBar, int menuItem, void *callbackData,
								int panel)
{
	DisplayPanel (panelHow);

}

int CVICALLBACK applycom (int panel, int control, int event,
						  void *callbackData, int eventData1, int eventData2)
{
	switch (event)
	{
		case EVENT_COMMIT:
			GetCtrlVal (panelRS, PANEL_RS_COM, &SendCom);  
			GetCtrlVal (panelMain, PANEL_MAIN_COM_main, &RecvCom);
			Config ();

			break;
	}
	return 0;
}


