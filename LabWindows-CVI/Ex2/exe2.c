#include <utility.h>
#include <ansi_c.h>
#include <cvirte.h>		
#include <userint.h>
#include "exe2.h"

static int panelHandle,counter=0;
double current[10000],ar_v2[10000],ar_v1[10000],ar_ir[10000],ar_vr[10000],xtime[10000];
double dt=0.01,V1=4,V2=2,R=200,C1=50,C2=50,I1=0,I2=0; 
int plot_vr=0,plot_ir=0,plot_vc1=0,plot_vc2=0;
FILE *file;

int main (int argc, char *argv[])
{
	if (InitCVIRTE (0, argv, 0) == 0)
		return -1;	/* out of memory */
	if ((panelHandle = LoadPanel (0, "exe2.uir", PANEL)) < 0)
		return -1;
	DisplayPanel(panelHandle);
	SetCtrlVal (panelHandle, PANEL_V1,V1 );
	SetCtrlVal (panelHandle, PANEL_V2,V2);
	SetCtrlVal (panelHandle, PANEL_I1,I1 );
	SetCtrlVal (panelHandle, PANEL_I2,I2 );
	SetCtrlVal (panelHandle, PANEL_C1,C1 );
	SetCtrlVal (panelHandle, PANEL_C2,C2 );
	SetCtrlVal (panelHandle, PANEL_R,R );
	SetCtrlVal (panelHandle, PANEL_TimeInter,dt );
	RunUserInterface ();
	DiscardPanel (panelHandle);

	return 0;
}
int CVICALLBACK myTimer (int panel, int control, int event,
						 void *callbackData, int eventData1, int eventData2)
{
	static int x=0;
	double dQ1,dQ2,Q1,Q2,IC1,IC2,IR,time; 
	switch (event)
	{
		case EVENT_TIMER_TICK:
			x=!x;
			SetCtrlVal (panelHandle,PANEL_LED,x);
			SetCtrlVal (panelHandle,PANEL_STRING,TimeStr());
			if (((R!=0) &&(C1!=0)&&(C2!=0))&&(fabs(V1-V2)>0.001))
			{
				IR = (V1-V2)/R;
				IC1=I1-IR;
				IC2=I2+IR;
				dQ1 = IC1*dt;
				dQ2 = IC2*dt;
				Q1=C1*V1+dQ1;
				Q2=C2*V2+dQ2;
				V1=Q1/C1;
				V2=Q2/C2;
				if (counter<(10000)) 
				{
					current[counter]= IR;
					ar_v1[counter]=V1;
					ar_v2[counter]=V2;
					ar_ir[counter]=IR ;
					ar_vr[counter]=V1-V2;
					xtime[counter]=dt*counter;
					counter++;
				}
				SetCtrlVal (panelHandle, PANEL_DV1,V1 );
				SetCtrlVal (panelHandle, PANEL_DV2,V2 );
				time=counter*dt;
				SetCtrlVal (panelHandle, PANEL_TimeCount,time );

			}

	
			break;
	}
	return 0;
}

int CVICALLBACK Doitt (int panel, int control, int event,
					  void *callbackData, int eventData1, int eventData2)
{
	int x;

	switch (event)
	{
		case EVENT_COMMIT:
			GetCtrlVal(panelHandle,PANEL_ENABLE,&x);
			SetCtrlAttribute (panelHandle, PANEL_TIMER, ATTR_ENABLED, x);
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

int CVICALLBACK GO (int panel, int control, int event,
					void *callbackData, int eventData1, int eventData2)
{
	int x=1; 
	double inter;
	switch (event)
	{
		case EVENT_COMMIT:
			GetCtrlVal (panelHandle, PANEL_V1,&V1 );
			GetCtrlVal (panelHandle, PANEL_V2,&V2 );
			GetCtrlVal (panelHandle, PANEL_I1,&I1 );
			GetCtrlVal (panelHandle, PANEL_I2,&I2 );
			I1*=1e-6;
			I2*=1e-6;
			GetCtrlVal (panelHandle, PANEL_C1,&C1 );
			GetCtrlVal (panelHandle, PANEL_C2,&C2 );
			GetCtrlVal (panelHandle, PANEL_R,&R );
			GetCtrlVal (panelHandle, PANEL_TimeInter,&dt );
			SetCtrlAttribute (panelHandle, PANEL_TIMER, ATTR_ENABLED, x);
			GetCtrlVal (panelHandle, PANEL_TimeInter,&inter );
			SetCtrlAttribute (panelHandle, PANEL_TIMER, ATTR_INTERVAL, inter);
			C1*=1e-6;
			C2*=1e-6;
			R*= 1e3;
			counter=0;
			break;
	}
	return 0;
}


