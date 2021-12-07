#include <ansi_c.h>
#include <cvirte.h>		
#include <userint.h>
#include "t4_q3.h"
#define CANNON_SIZE 25
#define g 9.8
static int panelHandle;
static int canvasHeight;
double F,M,Vx,Vy,V0,X0=0,Y0=0,dt,gamma,ax,ay,Teta;


int main (int argc, char *argv[])
{
	if (InitCVIRTE (0, argv, 0) == 0)
		return -1;	/* out of memory */
	if ((panelHandle = LoadPanel (0, "t4_q3.uir", PANEL)) < 0)
		return -1;
	
	DisplayPanel (panelHandle);
	SetCtrlAttribute(panelHandle,PANEL_CANVAS,ATTR_PEN_FILL_COLOR,VAL_BLACK);

	RunUserInterface ();
	
	DiscardPanel (panelHandle);
	return 0;
}

int CVICALLBACK START (int panel, int control, int event,
					   void *callbackData, int eventData1, int eventData2)
{
	static int x=0;
	switch (event)
	{
		case EVENT_COMMIT:
			//SetCtrlAttribute (panelHandle, PANEL_CANVAS, ATTR_PEN_WIDTH, 3);
			//x=!x;
			SetCtrlAttribute(panelHandle,PANEL_CANVAS,ATTR_PEN_WIDTH,3);
			SetCtrlAttribute(panelHandle,PANEL_CANVAS,ATTR_PEN_FILL_COLOR,VAL_YELLOW);
			SetCtrlAttribute(panelHandle,PANEL_CANVAS,ATTR_PEN_MODE,VAL_XOR_MODE);
			SetCtrlAttribute(panelHandle,PANEL_CANVAS,ATTR_PEN_MODE,VAL_COPY_MODE);
			GetCtrlAttribute(panelHandle,PANEL_CANVAS,ATTR_HEIGHT,&canvasHeight);
			GetCtrlVal (panelHandle, PANEL_M,&M );
			GetCtrlVal (panelHandle, PANEL_Teta,&Teta );
			GetCtrlVal (panelHandle, PANEL_V,&V0);
			GetCtrlVal (panelHandle, PANEL_dt,&dt );
			GetCtrlVal (panelHandle, PANEL_gamma,&gamma );

			SetCtrlAttribute (panelHandle, PANEL_TIMER, ATTR_ENABLED, 1);
			SetCtrlAttribute (panelHandle, PANEL_TIMER, ATTR_INTERVAL, dt);
			Vx= V0*cos(Teta);
			Vy= V0*sin(Teta);
			ax = (gamma*Vx)/M;
			ay = g+(gamma*Vy)/M;
			X0=0;
			Y0=0;
			
			break;
	}
	return 0;
}


int CVICALLBACK panelCB (int panel, int event, void *callbackData,
		int eventData1, int eventData2)
{
	if (event == EVENT_CLOSE)
		QuitUserInterface (0);
	return 0;
}

int CVICALLBACK TIMER (int panel, int control, int event,
					   void *callbackData, int eventData1, int eventData2)
{
	double Y1=0, X1;
	static int counter=0;
	char  DispStrX1[50],DispStrY1[50];

	switch (event)
	{
		case EVENT_TIMER_TICK:
			SetCtrlVal (panelHandle, PANEL_TIME,counter*dt );
			counter++;
			Y1=Y0 + Vy*dt + 0.5 * ay * pow(dt, 2);
			X1=X0 + Vx*dt + 0.5 * ax * pow(dt, 2);
			CanvasClear (panelHandle, PANEL_CANVAS, VAL_ENTIRE_OBJECT);
			//CanvasDrawPoint (panelHandle, PANEL_CANVAS, MakePoint(X1,canvasHeight-Y1));

			CanvasDrawOval (panelHandle,PANEL_CANVAS,MakeRect(canvasHeight-CANNON_SIZE/2-(int)Y1,(int)X1,CANNON_SIZE,CANNON_SIZE),VAL_DRAW_FRAME_AND_INTERIOR);
			if(Y1<=0) 
			{
				SetCtrlAttribute(panelHandle,PANEL_TIMER,ATTR_ENABLED,0);
				Y1=0;
			}
			Vy = Vy - ay*dt;
			Vx = Vx - ax*dt;
			sprintf(DispStrX1, "%f", X1);
			sprintf(DispStrY1, "%f", Y1);

			SetCtrlVal (panelHandle, PANEL_X,DispStrX1 );
			SetCtrlVal (panelHandle, PANEL_Y,DispStrY1 );
			if(Vx<=0 || X1>640)
			{
				Vx=0;
				ax=0;
			}
			Y0=Y1;
			X0=X1 ;
			
			break;
	}
	
	return 0;
}
