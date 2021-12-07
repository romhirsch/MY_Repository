#include <utility.h>
#include <ansi_c.h>
#include <cvirte.h>		
#include <userint.h>
#include "exe2.h"
//init Global variables 
static int panelHandle,panelHandle2,counter=0,plothandle,LOG=0;
static double x1_curs=0, y1_curs=0, x2_curs=0, y2_curs=0, dy=0, dx=0, slope=0,Vc1_st, Vc2_st;  
int Vc1s=1,Vc2s=1,Vdiffs=1,IRs=1;
double current[10000],ar_v2[10000],ar_v1[10000],ar_ir[10000],ar_vr[10000],xtime[10000];
double dt=0.01,V1=4,V2=2,R=200,C1=50,C2=50,I1=0,I2=0,VR=0; 
int plot_vr=0,plot_ir=0,plot_vc1=0,plot_vc2=0;
FILE *file;

int main (int argc, char *argv[])
{
	if (InitCVIRTE (0, argv, 0) == 0)
		return -1;	/* out of memory */
	if ((panelHandle = LoadPanel (0, "exe2.uir", PANEL)) < 0)
		return -1;
	if ((panelHandle2 = LoadPanel (0, "exe2.uir", PANEL_2)) < 0)
		return -1;
	DisplayPanel (panelHandle);
	//get input from the uir
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
	static double dVc1, dVc2, dIr, dVr, tao,first,second;
	static int x=0;
	double dQ1,dQ2,Q1,Q2,IC1,IC2,IR,time; 
	switch (event)
	{
		case EVENT_TIMER_TICK:
			//turn on the led and start clk
			x=!x;
			SetCtrlVal (panelHandle,PANEL_LED,x);
			SetCtrlVal (panelHandle,PANEL_STRING,TimeStr());
			//go though if the params is valide 
			if (((R!=0) &&(C1!=0)&&(C2!=0))&&(fabs(V1-V2)>0.001))
			{
				//#############Calculations################  
				IR = (V1-V2)/R;
				IC1=I1-IR;
				IC2=I2+IR;
				dQ1 = IC1*dt;
				dQ2 = IC2*dt;
				Q1=C1*V1+dQ1;
				Q2=C2*V2+dQ2;
				V1=Q1/C1;
				V2=Q2/C2;
				VR=V1-V2;
				//##############cursors################
			 	GetGraphCursor (panelHandle2, PANEL_2, 1, &x1_curs, &y1_curs);
				GetGraphCursor (panelHandle2, PANEL_2, 2, &x2_curs, &y2_curs);
				SetCtrlVal (panelHandle2, PANEL_2_YVAL, y1_curs);
				SetCtrlVal (panelHandle2, PANEL_2_XVAL, x1_curs);
				SetCtrlVal (panelHandle2, PANEL_2_YVAL_2, y2_curs);
				SetCtrlVal (panelHandle2, PANEL_2_XVAL_2, x2_curs);
				dx=x1_curs-x2_curs;
				dy=y1_curs-y2_curs;
				
				if (counter<(10000)) 
				{
					//save the data to array for display on the graphs 
					current[counter]= IR;
					ar_v1[counter]=V1;
					ar_v2[counter]=V2;
					ar_ir[counter]=IR ;
					ar_vr[counter]=V1-V2;
					xtime[counter]=dt*counter;
					fprintf(file,"		%lf		%lf		%lf		%lf\n",ar_v1[counter], ar_v2[counter], ar_ir[counter],xtime[counter]);
				//############Q7-Madar############# calculate the dvc1,dvc2,dvr and dir
					first =(I1+I2)/(C1+C2)-I1/C1-(Vc1_st-Vc2_st)/(C1*R);
					second =-(I1+I2)/(C1+C2)+I2/C2+(Vc1_st-Vc2_st)/(C2*R);
					tao=(C1+C2)/(C1*C2*R);
					dVc1=first*exp(-tao*xtime[counter])+(I1+I2)/(C1+C2);
					dVc2=second*exp(-tao*xtime[counter])+(I1+I2)/(C1+C2);
					dVr=(first-second)*exp(-tao*xtime[counter]);
					dIr=dVr/R;
					counter++;
				}
				SetCtrlVal (panelHandle, PANEL_DV1,V1 );
				SetCtrlVal (panelHandle, PANEL_DV2,V2 );
				SetCtrlVal (panelHandle, PANEL_DVR,VR );

				time=counter*dt;
				//timer display 
				SetCtrlVal (panelHandle, PANEL_TimeCount,time );


			}
			plothandle=DeleteGraphPlot (panelHandle2, PANEL_2_GRAPH,-1, VAL_IMMEDIATE_DRAW);
			
			//calculate slope only if graph on mode log  
			if(LOG!=0)
			{
				if(dx!=0)
					slope=dy/dx;
				SetCtrlVal (panelHandle2, PANEL_2_SLOPE, fabs(slope));

			}	
			//switch cases for the Graphs 
			if (IRs==0)	// IR
			{
				plothandle=PlotXY (panelHandle2,PANEL_2_GRAPH ,xtime,ar_ir,counter, VAL_DOUBLE, VAL_DOUBLE, VAL_EMPTY_SQUARE, VAL_SOLID, VAL_SOLID, 1, VAL_YELLOW);
				SetCtrlVal (panelHandle2, PANEL_2_dIr, fabs(dIr));
				if(LOG!=0) 
					SetCtrlVal (panelHandle2, PANEL_2_DSLOPE, fabs(slope-dIr));


			}
			else if (Vc1s==0)	// vc1
			{
				plothandle = PlotXY (panelHandle2, PANEL_2_GRAPH, xtime, ar_v1, counter, VAL_DOUBLE, VAL_DOUBLE, VAL_EMPTY_SQUARE, VAL_SOLID, VAL_SOLID, 1, VAL_BLUE);
				SetCtrlVal (panelHandle2, PANEL_2_dVc1, fabs(dVc1));
				if(LOG!=0) 
					SetCtrlVal (panelHandle2, PANEL_2_DSLOPE, fabs(slope-dVc1));  
			}
			else if (Vc2s==0)	// vc2
			{
				plothandle = PlotXY (panelHandle2, PANEL_2_GRAPH, xtime, ar_v2, counter, VAL_DOUBLE, VAL_DOUBLE, VAL_EMPTY_SQUARE, VAL_SOLID, VAL_SOLID, 1, VAL_RED);
				SetCtrlVal (panelHandle2, PANEL_2_dVc2, fabs(dVc2));
				if(LOG!=0)
			   		SetCtrlVal (panelHandle2, PANEL_2_DSLOPE, fabs(slope-dVc2));  

			}

			else if (Vdiffs==0)	// VR
			{
				plothandle = PlotXY (panelHandle2, PANEL_2_GRAPH, xtime, ar_vr, counter, VAL_DOUBLE, VAL_DOUBLE, VAL_EMPTY_SQUARE, VAL_SOLID, VAL_SOLID, 1, VAL_GREEN);
				SetCtrlVal (panelHandle2, PANEL_2_dVr, fabs(dVr));
				if(LOG!=0)
					SetCtrlVal (panelHandle2, PANEL_2_DSLOPE, fabs(slope-dVr));  
			}
			else 
			{
				//delete all slope values 
				SetCtrlVal (panelHandle2, PANEL_2_dVc1, 0.00);
				SetCtrlVal (panelHandle2, PANEL_2_dVc2, 0.00);
				SetCtrlVal (panelHandle2, PANEL_2_dVr, 0.00);
				SetCtrlVal (panelHandle2, PANEL_2_dIr, 0.00);
				plothandle=DeleteGraphPlot (panelHandle2, PANEL_2_GRAPH,-1, VAL_IMMEDIATE_DRAW);	
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
			//get input from the uri 
			GetCtrlVal (panelHandle, PANEL_V1,&V1 );
			GetCtrlVal (panelHandle, PANEL_V2,&V2 );
			GetCtrlVal (panelHandle, PANEL_I1,&I1 );
			GetCtrlVal (panelHandle, PANEL_I2,&I2 );
			I1*=1e-6;//Units of 10^-6
			I2*=1e-6; //Units of 10^-6  
			GetCtrlVal (panelHandle, PANEL_C1,&C1 );
			GetCtrlVal (panelHandle, PANEL_C2,&C2 );
			GetCtrlVal (panelHandle, PANEL_R,&R );
			GetCtrlVal (panelHandle, PANEL_TimeInter,&dt );
			SetCtrlAttribute (panelHandle, PANEL_TIMER, ATTR_ENABLED, x);
			GetCtrlVal (panelHandle, PANEL_TimeInter,&inter );
			SetCtrlAttribute (panelHandle, PANEL_TIMER, ATTR_INTERVAL, inter);
			Vc1_st=V1;
			Vc2_st=V2;
			C1*=1e-6;//Units of 10^-6  
			C2*=1e-6;//Units of 10^-6  
			R*= 1e3; //Units of 10^3  
			if(IRs==0||Vdiffs==0||Vc1s==0||Vc2s==0)
				SetCtrlAttribute (panelHandle2, PANEL_2_ERROR, ATTR_VISIBLE, 1);
			else
				SetCtrlAttribute (panelHandle2, PANEL_2_ERROR, ATTR_VISIBLE, 0);
	
			//if is the second time to click go require do new position to the cursors 	
			if(counter>0)
			{
				SetCtrlAttribute (panelHandle, PANEL_TIMER, ATTR_ENABLED, 0);
				DeleteGraphPlot (panelHandle2, PANEL_2_GRAPH,-1, VAL_IMMEDIATE_DRAW);
				SetAxisRange (panelHandle2, PANEL_2_GRAPH, VAL_MANUAL, 0.0, 100, VAL_MANUAL, 0.0, 100);
				SetGraphCursor (panelHandle2, PANEL_2_GRAPH, 2, 1, 5);
				SetGraphCursor (panelHandle2, PANEL_2_GRAPH, 1, 5, 10);
				SetAxisRange (panelHandle2, PANEL_2_GRAPH, VAL_AUTOSCALE, 0.0, 100, VAL_AUTOSCALE, 0.0, 100);
				SetCtrlAttribute (panelHandle, PANEL_TIMER, ATTR_ENABLED, 1); 
			}
			counter=0;
			//create file in the script directory:
			file = fopen ("output_e3.txt", "w");
			//write headers to the files :
			fprintf(file,"		Vc1			Vc2			Ir			Time \n");
			break;
	}
	return 0;
}

int CVICALLBACK GRAPH (int panel, int control, int event,
					   void *callbackData, int eventData1, int eventData2)
{
	switch (event)
	{
		case EVENT_COMMIT:
			DisplayPanel(panelHandle2);
			break;
	}
	return 0;
}

int CVICALLBACK IRswitch (int panel, int control, int event,
						  void *callbackData, int eventData1, int eventData2)
{
	switch (event)
	{
		case EVENT_COMMIT:
			IRs=!IRs;//the switch change state 
			break;
	}
	return 0;
}

int CVICALLBACK Vc1switch (int panel, int control, int event,
						   void *callbackData, int eventData1, int eventData2)
{
	switch (event)
	{
		case EVENT_COMMIT:
			Vc1s=!Vc1s;//the switch change state 
	}
	return 0;
}

int CVICALLBACK Vc2switch (int panel, int control, int event,
						   void *callbackData, int eventData1, int eventData2)
{
	switch (event)
	{
		case EVENT_COMMIT:
			Vc2s=!Vc2s;//the switch change state 
			break;
	}
	return 0;
}

int CVICALLBACK Vdiffswitch (int panel, int control, int event,
							 void *callbackData, int eventData1, int eventData2)
{
	switch (event)
	{
		case EVENT_COMMIT:
			Vdiffs=!Vdiffs;//the switch change state 
			break;
	}
	return 0;
}

int CVICALLBACK logswitch (int panel, int control, int event,
						   void *callbackData, int eventData1, int eventData2)
{
	switch (event)
	{
	
		case EVENT_COMMIT:
			LOG=!LOG;
			if(LOG)
			{
				//turn on graph log mode
				SetCtrlAttribute (panelHandle2, PANEL_2_GRAPH, ATTR_XMAP_MODE, VAL_LOG);
				SetCtrlAttribute (panelHandle2, PANEL_2_GRAPH, ATTR_YMAP_MODE, VAL_LOG);
			}
			else
			{
				//turn on graph linear mode  
				SetCtrlAttribute (panelHandle2, PANEL_2_GRAPH, ATTR_XMAP_MODE, VAL_LINEAR);
				SetCtrlAttribute (panelHandle2, PANEL_2_GRAPH, ATTR_YMAP_MODE, VAL_LINEAR);	
			}
			break;
	}
	return 0;
}

int CVICALLBACK CloseGraph (int panel, int control, int event,
							void *callbackData, int eventData1, int eventData2)
{
	switch (event)
	{
		case EVENT_COMMIT:
			//close Graph panel
			HidePanel (panelHandle2);		

			break;
	}
	return 0;
}
