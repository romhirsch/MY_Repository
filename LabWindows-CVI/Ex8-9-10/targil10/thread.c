#include <utility.h>
#include <cvirte.h>		
#include <userint.h>
#include "thread.h"
static int CVICALLBACK count(void * functionData);
static int CVICALLBACK count2(void * functionData);
static int stop1 = 1 ;
CmtThreadFunctionID thID = 0;
static CmtThreadLockHandle Lock ;
static double timet1=1,timet2=1;
static int panelHandle;
static double share=0;

int main (int argc, char *argv[])
{
	if (InitCVIRTE (0, argv, 0) == 0)
		return -1;	/* out of memory */
	if ((panelHandle = LoadPanel (0, "thread.uir", PANEL)) < 0)
		return -1;
	DisplayPanel (panelHandle);
	CmtNewLock("", 0, &Lock);

	RunUserInterface ();
	DiscardPanel (panelHandle);
	return 0;
}


static int CVICALLBACK count(void * functionData)
{
	
	static double c=0;
	int res=0;

	while(stop1==1){
		SetCtrlVal(panelHandle, PANEL_c1,c);
		Delay (timet1);
		c++;
	CmtTryToGetLock (Lock,&res);
	if(res)
		{
			SetCtrlVal(panelHandle, PANEL_share,share);
			share=share-1 ;
			CmtReleaseLock (Lock);

		}
	}
	
	return -1;
}

static int CVICALLBACK count2(void * functionData)
{
	static double c=0;
	int res=0;
		while(stop1==1){

	SetCtrlVal(panelHandle, PANEL_c2,c);
	
	Delay (timet2);
	c++;
	CmtTryToGetLock (Lock,&res);
	if(res)
	{
	SetCtrlVal(panelHandle, PANEL_share,share);
	share=share+10;
	CmtReleaseLock (Lock);

	}
		}
	return -1;
}


int CVICALLBACK panel1 (int panel, int event, void *callbackData,
		int eventData1, int eventData2)
{
	if (event == EVENT_CLOSE)
		QuitUserInterface (0);
	return 0;
}

int CVICALLBACK start (int panel, int control, int event,
					   void *callbackData, int eventData1, int eventData2)
{
	switch (event)
	{
		case EVENT_COMMIT:
			CmtScheduleThreadPoolFunction (DEFAULT_THREAD_POOL_HANDLE, count, NULL, &thID);
			CmtScheduleThreadPoolFunction (DEFAULT_THREAD_POOL_HANDLE, count2, NULL, &thID);

			break;
	}
	return 0;
}

int CVICALLBACK stop (int panel, int control, int event,
					  void *callbackData, int eventData1, int eventData2)
{
	switch (event)
	{
		case EVENT_COMMIT:
			stop1=0;
			break;
	}
	return 0;
}

int CVICALLBACK reset_time (int panel, int control, int event,
						   void *callbackData, int eventData1, int eventData2)
{
	switch (event)
	{
		case EVENT_COMMIT:
			GetCtrlVal(panelHandle, PANEL_timethread1,&timet1);
			GetCtrlVal(panelHandle, PANEL_timethread2,&timet2);
			break;
	}
	return 0;
}
