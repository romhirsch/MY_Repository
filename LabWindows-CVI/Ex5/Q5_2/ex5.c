#include <analysis.h>
#include <ansi_c.h>
#include <cvirte.h>		
#include <userint.h>
#include "ex5.h"
#define Q2_interval 0.1
#define RectTop  200
#define RectHIGH  50 
#define RectWidth  100 
 

static int Q2Handle;
static int mouse_state_start, mouse_state_end, check_flag, limRectleft=100, limRectRight=300, Dis_Rect1, Distance_between, Dis_Rect2;
static double m1, m2, l01, l02, l03, x1, x2, a1, a2, size, prevx1, prevx2, k1, k2, k3, Q2_dl1, Q2_dl2, Q2_dl3, v1, v2, f1, f2, f3;

int main (int argc, char *argv[])
{
	
	if (InitCVIRTE (0, argv, 0) == 0)
		return -1;	/* out of memory */
	if ((Q2Handle = LoadPanel (0, "ex5.uir", Q2)) < 0)
		return -1;
	DisplayPanel (Q2Handle);
	// define Rect:
			
	SetCtrlVal (Q2Handle, Q2_L3, 600);
	SetCtrlAttribute (Q2Handle, Q2_CANVAS, ATTR_PEN_FILL_COLOR, VAL_BLUE);
	CanvasDrawRect (Q2Handle, Q2_CANVAS, MakeRect (RectTop, 400, RectHIGH, RectWidth), VAL_DRAW_FRAME_AND_INTERIOR);
	SetCtrlAttribute (Q2Handle, Q2_CANVAS, ATTR_PEN_FILL_COLOR, VAL_GREEN);
	CanvasDrawRect (Q2Handle, Q2_CANVAS, MakeRect (RectTop, 600, RectHIGH, RectWidth), VAL_DRAW_FRAME_AND_INTERIOR);
	RunUserInterface ();
	DiscardPanel (Q2Handle);
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



int CVICALLBACK STARTCALLBACK (int panel, int control, int event,
							void *callbackData, int eventData1, int eventData2)
{
	switch (event)
	{
		case EVENT_COMMIT:
			//input 
			GetCtrlVal (Q2Handle, Q2_M1, &m1);
			GetCtrlVal (Q2Handle, Q2_M2, &m2);
			GetCtrlVal (Q2Handle, Q2_K1, &k1); 
			GetCtrlVal (Q2Handle, Q2_K2, &k2);			
			GetCtrlVal (Q2Handle, Q2_K3, &k3);			
			GetCtrlVal (Q2Handle, Q2_L1, &Dis_Rect1);			
			GetCtrlVal (Q2Handle, Q2_L2, &Distance_between);			
			GetCtrlVal (Q2Handle, Q2_L3, &Dis_Rect2);
			GetCtrlVal (Q2Handle, Q2_X1, &l01);			
			GetCtrlVal (Q2Handle, Q2_X2, &l02);			
			GetCtrlVal (Q2Handle, Q2_X3, &l03);
			
			//calcultr distance
			Q2_dl1=Dis_Rect1-l01;
			Q2_dl2=Distance_between-l02;
			Q2_dl3=Dis_Rect2-l03;
			x1=-l01;
			x2=l03;
			size=200+Q2_dl1+Q2_dl2+Q2_dl3;
			v1=0;
			v2=0;
			//DrawImages
			limRectleft=					

			CanvasClear (Q2Handle, Q2_CANVAS, VAL_ENTIRE_OBJECT);
			SetCtrlAttribute (Q2Handle, Q2_CANVAS, ATTR_PEN_STYLE, VAL_DASH);
			CanvasDrawLine (Q2Handle, Q2_CANVAS, MakePoint (0, RectTop+25), MakePoint (Q2_dl1, RectTop+25));
			SetCtrlAttribute (Q2Handle, Q2_CANVAS, ATTR_PEN_STYLE, VAL_DASH);
			CanvasDrawLine (Q2Handle, Q2_CANVAS, MakePoint (Q2_dl1+100, RectTop+25), MakePoint (Q2_dl1+100+Q2_dl2, RectTop+25));
			CanvasDrawLine (Q2Handle, Q2_CANVAS, MakePoint (Q2_dl1+200+Q2_dl2, RectTop+25), MakePoint (size, RectTop+25));
			SetCtrlAttribute (Q2Handle, Q2_CANVAS, ATTR_PEN_FILL_COLOR, VAL_GREEN);
			CanvasDrawRect (Q2Handle, Q2_CANVAS, MakeRect (RectTop, Q2_dl1+100+Q2_dl2 ,RectHIGH, RectWidth), VAL_DRAW_FRAME_AND_INTERIOR);
			SetCtrlAttribute (Q2Handle, Q2_CANVAS, ATTR_PEN_FILL_COLOR, VAL_BLUE);
			CanvasDrawRect (Q2Handle, Q2_CANVAS, MakeRect (RectTop, Q2_dl1, RectHIGH, RectWidth), VAL_DRAW_FRAME_AND_INTERIOR);			
			SetCtrlAttribute (Q2Handle,Q2_TIMER,ATTR_INTERVAL,Q2_interval);
			SetCtrlAttribute (Q2Handle, Q2_TIMER, ATTR_ENABLED, 1);
			
	

			break;
	}
	return 0;
}

int CVICALLBACK TIMER (int panel, int control, int event,
							  void *callbackData, int eventData1, int eventData2)
{
	switch (event)
	{
		case EVENT_TIMER_TICK:
	
			f1=k1*x1;
			f2=k2*(x2-x1);
			f3=k3*(-x2);
			a1=(-f1+f2)/m1;
			a2=(-f2+f3)/m2;
			prevx1=x1;
			prevx2=x2;
			
			x1=x1+v1*Q2_interval+((a1*pow(Q2_interval,2))/2);
			v1=v1+a1*Q2_interval;
			
			x2=x2+v2*Q2_interval+((a2*pow(Q2_interval,2))/2);
			v2=v2+a2*Q2_interval;
			
			Q2_dl1=x1+Dis_Rect1;
			if(Q2_dl1<=0)
			{
				Q2_dl1=1;
				x1=prevx1;
				v1=0;
			}
			else if(Q2_dl1>(size-202))
			{
				Q2_dl1=size-203;
				x1=prevx1;
				v1=0;
			}
			Q2_dl3=-x2+Dis_Rect2;
			if(Q2_dl3<=0)
			{
				Q2_dl3=1;
				x2=prevx2;
				v2=0;
				
			}
			CanvasClear (Q2Handle, Q2_CANVAS, VAL_ENTIRE_OBJECT);
			CanvasDrawLine (Q2Handle, Q2_CANVAS, MakePoint (0, RectTop+25), MakePoint (Q2_dl1, RectTop+25));
			SetCtrlAttribute (Q2Handle, Q2_CANVAS, ATTR_PEN_FILL_COLOR, VAL_BLUE);
			CanvasDrawRect (Q2Handle, Q2_CANVAS, MakeRect (RectTop, Q2_dl1, RectHIGH, RectWidth), VAL_DRAW_FRAME_AND_INTERIOR);
			CanvasDrawLine (Q2Handle, Q2_CANVAS, MakePoint (Q2_dl1+100, RectTop+25), MakePoint (Q2_dl1+100+Q2_dl2, RectTop+25));
			SetCtrlAttribute (Q2Handle, Q2_CANVAS, ATTR_PEN_FILL_COLOR, VAL_GREEN);
			CanvasDrawRect (Q2Handle, Q2_CANVAS, MakeRect (RectTop, Q2_dl1+100+Q2_dl2, RectHIGH, RectWidth), VAL_DRAW_FRAME_AND_INTERIOR);
			CanvasDrawLine (Q2Handle, Q2_CANVAS, MakePoint (Q2_dl1+200+Q2_dl2, RectTop+25), MakePoint (size, RectTop+25));
			Q2_dl2=-(200+Q2_dl1+Q2_dl3-size);
			
			if(Q2_dl2<=0)
			{
				Q2_dl2=1;
				x1=prevx1;
				v1=0;
				x2=prevx2;
				v2=0;
			}
			
			
			CanvasClear (Q2Handle, Q2_CANVAS, VAL_ENTIRE_OBJECT);
			CanvasDrawLine (Q2Handle, Q2_CANVAS, MakePoint (0, RectTop+25), MakePoint (Q2_dl1, RectTop+25));
			SetCtrlAttribute (Q2Handle, Q2_CANVAS, ATTR_PEN_FILL_COLOR, VAL_BLUE);
			CanvasDrawRect (Q2Handle, Q2_CANVAS, MakeRect (RectTop, Q2_dl1, RectHIGH, RectWidth), VAL_DRAW_FRAME_AND_INTERIOR);
			CanvasDrawLine (Q2Handle, Q2_CANVAS, MakePoint (Q2_dl1+100, RectTop+25), MakePoint (Q2_dl1+100+Q2_dl2, RectTop+25));
			SetCtrlAttribute (Q2Handle, Q2_CANVAS, ATTR_PEN_FILL_COLOR, VAL_GREEN);
			CanvasDrawRect (Q2Handle, Q2_CANVAS, MakeRect (RectTop, Q2_dl1+100+Q2_dl2, RectHIGH, RectWidth), VAL_DRAW_FRAME_AND_INTERIOR);
			CanvasDrawLine (Q2Handle, Q2_CANVAS, MakePoint (Q2_dl1+200+Q2_dl2, RectTop+25), MakePoint (size, RectTop+25));
			break;
	}
	return 0;
}


int CVICALLBACK Q4_Clicker (int panel, int control, int event,
							void *callbackData, int eventData1, int eventData2)
{
	switch (event)
	{
		case EVENT_LEFT_CLICK:
			
			GetGlobalMouseState (&Q2Handle, &mouse_state_start, NULL, NULL, NULL, NULL);
			
		case EVENT_LEFT_CLICK_UP:
			GetGlobalMouseState (&Q2Handle, &mouse_state_end, NULL, NULL, NULL, NULL);
			CanvasClear (Q2Handle, Q2_CANVAS, VAL_ENTIRE_OBJECT);
			if(abs(limRectleft-mouse_state_start)<abs(limRectRight-mouse_state_start))
			{
				if(limRectleft+mouse_state_end-mouse_state_start>limRectRight-100)
					MessagePopup ("Error", "distance");
				else if(limRectleft+mouse_state_end-mouse_state_start<0)
					MessagePopup ("Error", "distance");
				else
				{
					limRectleft+=mouse_state_end-mouse_state_start;
					SetCtrlVal (Q2Handle, Q2_L1, limRectleft);
					SetCtrlVal (Q2Handle, Q2_L2, limRectRight-(limRectleft+100));
					SetCtrlVal (Q2Handle, Q2_L3, 1100-((limRectleft)+(limRectRight-(limRectleft+100))+200));					
				}

			}
			else
			{
				if(limRectleft+100>limRectRight+mouse_state_end-mouse_state_start)
					MessagePopup ("Error", "mWrong distance");
				else if ( limRectRight+mouse_state_end-mouse_state_start>999)
					MessagePopup ("Error", "Wrong distance");
				else
				{
					limRectRight+=mouse_state_end-mouse_state_start;
					SetCtrlVal (Q2Handle, Q2_L1, limRectleft);
					SetCtrlVal (Q2Handle, Q2_L2, limRectRight-(limRectleft+100));
					SetCtrlVal (Q2Handle, Q2_L3, 1100-((limRectleft)+(limRectRight-(limRectleft+100))+200));					
					
				}
			}
			SetCtrlAttribute (Q2Handle, Q2_CANVAS, ATTR_PEN_FILL_COLOR, VAL_BLUE);
			CanvasDrawRect (Q2Handle, Q2_CANVAS, MakeRect (RectTop, limRectleft, RectHIGH, RectWidth), VAL_DRAW_FRAME_AND_INTERIOR);
			SetCtrlAttribute (Q2Handle, Q2_CANVAS, ATTR_PEN_FILL_COLOR, VAL_GREEN);
			CanvasDrawRect (Q2Handle, Q2_CANVAS, MakeRect (RectTop, limRectRight, RectHIGH, RectWidth), VAL_DRAW_FRAME_AND_INTERIOR);
			break;
	}
	return 0;
}





