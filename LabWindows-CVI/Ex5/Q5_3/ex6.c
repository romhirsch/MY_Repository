#include <analysis.h>
#include <ansi_c.h>
#include <cvirte.h>		
#include <userint.h>
#include "ex6.h"
#define PI 3.141
#define N 128


static int Handle, plot,i=0;;
static double trianim[N];

int main (int argc, char *argv[])
{
	if (InitCVIRTE (0, argv, 0) == 0)
		return -1;	/* out of memory */
	if ((Handle = LoadPanel (0,"ex6.uir", PANEL)) < 0)
		return -1;
	DisplayPanel (Handle);
	RunUserInterface ();
	DiscardPanel (Handle);
	return 0;												   
}

int CVICALLBACK STARTGO (int panel, int control, int event,
							void *callbackData, int eventData1, int eventData2)
{
	switch (event)
	{
		case EVENT_COMMIT:
//###########################################
			double R=10e3,tFFT[128],w=0,C=1e-3,L=5e-3,mehana,Hreal[N],Himage[N],Vreal[N],Vc[N];

			double   phase=0.0,trian[N],x[N] ;
			Triangle (N, 1.0, trian);
			
			plot = PlotY (Handle, PANEL_GRAPH_2, trian, N, VAL_DOUBLE, VAL_THIN_LINE, VAL_EMPTY_SQUARE, VAL_SOLID, 1, VAL_BLUE);
			FFT (trian, trianim, N);
			int k;
			for(k=0;k<N;k++)
			{
				x[k] = (2*PI*k)/N; 
				w = (2*PI*k)/N; 
				mehana = pow(R,2)+(1/pow(w*C,2))-2*L/C+pow(w*L,2);
		   		Hreal[k]=((L/C)+(pow(w*L,2)))/mehana;
				Himage[k]=R*w*L/mehana;
			}
			PlotXY (Handle, PANEL_GRAPH_3, x, trian, N, VAL_DOUBLE, VAL_DOUBLE, VAL_THIN_LINE, VAL_EMPTY_SQUARE, VAL_SOLID, 1, VAL_BLUE);
			CxMatrixVectorMul (Hreal, trian, 1, N,Vreal);
			CxMatrixVectorMul (Himage, trianim, 1, N,Vc);
			ReInvFFT (Vreal,Vc ,N);

			plot = PlotY (Handle, PANEL_GRAPH, Vc, N, VAL_DOUBLE, VAL_THIN_LINE, VAL_EMPTY_SQUARE, VAL_SOLID, 1, VAL_BLUE);
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
