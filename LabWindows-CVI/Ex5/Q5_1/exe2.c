#include <analysis.h>
#include <utility.h>
#include <ansi_c.h>
#include <cvirte.h>		
#include <userint.h>
#include "exe2.h"

static int panelHandle,counter=0;
double current[10000],ar_v2[10000],ar_v1[10000],ar_ir[10000],ar_vr[10000],xtime[10000];
double dt=0.01,V1=4,V2=2,V3=3 ,V4=4, R=200,C1=50,C2=50,I1=0,I2=0,C3=50,C4=50,R12=200,R13=200,R14=200,R23=200,R24=200,R34=200; 
int plot_vr=0,plot_ir=0,plot_vc1=0,plot_vc2=0;
FILE *file;
double M[16],V[3];

int main (int argc, char *argv[])
{
	if (InitCVIRTE (0, argv, 0) == 0)
		return -1;	/* out of memory */
	if ((panelHandle = LoadPanel (0, "exe2.uir", PANEL)) < 0)
		return -1;
	DisplayPanel(panelHandle);
	SetCtrlVal (panelHandle, PANEL_V1,V1 );
	SetCtrlVal (panelHandle, PANEL_V2,V2);
	SetCtrlVal (panelHandle, PANEL_V4,V4 );
	SetCtrlVal (panelHandle, PANEL_V3,V3);
	SetCtrlVal (panelHandle, PANEL_C1,C1 );
	SetCtrlVal (panelHandle, PANEL_C2,C2 );
	SetCtrlVal (panelHandle, PANEL_R12,R12 );
	SetCtrlVal (panelHandle, PANEL_C3,C3 );
	SetCtrlVal (panelHandle, PANEL_C4,C4 );
	SetCtrlVal (panelHandle, PANEL_R12,R12 );
	SetCtrlVal (panelHandle, PANEL_R13,R13 );
	SetCtrlVal (panelHandle, PANEL_R14,R14 );
	SetCtrlVal (panelHandle, PANEL_R23,R23 );
	SetCtrlVal (panelHandle, PANEL_R24,R24 );
	SetCtrlVal (panelHandle, PANEL_R34,R34 );
	SetCtrlVal (panelHandle, PANEL_TimeInter,dt );
	RunUserInterface ();
	DiscardPanel (panelHandle);

	return 0;
}
int CVICALLBACK myTimer (int panel, int control, int event,
						 void *callbackData, int eventData1, int eventData2)
{
	static int x=0;
	double dQ1,dQ2,Q1,Q2,Q3,Q4,IC1,IC2,IC3,IC4,IR,time,I[4],dQ3,dQ4; 
	switch (event)
	{
		
		case EVENT_TIMER_TICK:
			x=!x;
			SetCtrlVal (panelHandle,PANEL_LED,x);
			SetCtrlVal (panelHandle,PANEL_STRING,TimeStr());
			if (((R!=0) &&(C1!=0)&&(C2!=0)&&(C3!=0)&&(C4!=0)))
			{
				double M[]= {-((1/R12)+(1/R13)+(1/R14)),1/R12,1/R13,1/R14,1/R12,-((1/R12)+(1/R23)+(1/R24)),1/R23,1/R24,1/R13,1/R23,-((1/R13)+(1/R23)+(1/R34)),1/R34,1/R14,1/R24,1/R34,-((1/R14)+(1/R24)+(1/R34))};
				double T[] ={V1,V2,V3,V4};
				//IR = (V1-V2)/R12;
				MatrixMul (M, T, 4, 4, 1, I);
				IC1=I[0];
				IC2=I[1];
				IC3=I[2];
				IC4=I[3];
				dQ1 = IC1*dt;
				dQ2 = IC2*dt;
				dQ3 = IC3*dt;
				dQ4 = IC4*dt;
				Q1=C1*V1+dQ1;
				Q2=C2*V2+dQ2;
				Q3=C3*V3+dQ3;
				Q4=C4*V4+dQ4;
				V1=Q1/C1;
				V2=Q2/C2;
				V3 =Q3/C3;
				V4 =Q4/C4;
				SetCtrlVal (panelHandle, PANEL_DV1,V1 );
				SetCtrlVal (panelHandle, PANEL_DV2,V2 );
				SetCtrlVal (panelHandle, PANEL_DV3,V3 );
				SetCtrlVal (panelHandle, PANEL_DV4,V4 );
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
			GetCtrlVal (panelHandle, PANEL_V3,&V3 );
			GetCtrlVal (panelHandle, PANEL_V4,&V4 );
			GetCtrlVal (panelHandle, PANEL_C1,&C1 );
			GetCtrlVal (panelHandle, PANEL_C2,&C2 );
			GetCtrlVal (panelHandle, PANEL_C3,&C3 );
			GetCtrlVal (panelHandle, PANEL_C4,&C4 );
			GetCtrlVal (panelHandle, PANEL_R12,&R12 );
			GetCtrlVal (panelHandle, PANEL_R13,&R13 );
			GetCtrlVal (panelHandle, PANEL_R14,&R14 );
			GetCtrlVal (panelHandle, PANEL_R23,&R23 );
			GetCtrlVal (panelHandle, PANEL_R24,&R24 );
			GetCtrlVal (panelHandle, PANEL_R34,&R34 );
			GetCtrlVal (panelHandle, PANEL_TimeInter,&dt );
			SetCtrlAttribute (panelHandle, PANEL_TIMER, ATTR_ENABLED, x);
			GetCtrlVal (panelHandle, PANEL_TimeInter,&inter );
			SetCtrlAttribute (panelHandle, PANEL_TIMER, ATTR_INTERVAL, inter);
			C1*=1e-6;
			C2*=1e-6;
			C3*=1e-6;
			C4*=1e-6;
			R12*= 1e3;
			R13*= 1e3;
			R14*= 1e3;
			R23*= 1e3;
			R24*= 1e3;
			R34*= 1e3;
			counter=0;
			break;
	}
	return 0;
}


