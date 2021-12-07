#include <analysis.h>
#include <cvirte.h>		
#include <userint.h>
#include "targil4.h"

static int panelHandle;
double M1array[9],M2array[3],M3array[3],deter,invarray[9];

int main (int argc, char *argv[])
{
	if (InitCVIRTE (0, argv, 0) == 0)
		return -1;	/* out of memory */
	if ((panelHandle = LoadPanel (0, "targil4.uir", PANEL)) < 0)
		return -1;
	DisplayPanel (panelHandle);
	double array1[] = {1.0,2.0,2.0},array2[]={1,2,3,4,5,6,7,8,9};
	SetTableCellRangeVals (panelHandle, PANEL_MATRIX2, MakeRect (1, 1, 3, 1), array1, VAL_ROW_MAJOR);
	SetTableCellRangeVals (panelHandle, PANEL_MATRIX1, MakeRect (1, 1, 3, 3), array2, VAL_ROW_MAJOR);

	RunUserInterface ();
	DiscardPanel (panelHandle);
	return 0;
}

int CVICALLBACK calc (int panel, int control, int event,
					  void *callbackData, int eventData1, int eventData2)
{
	switch (event)
	{
		case EVENT_COMMIT:
			GetTableCellRangeVals (panelHandle, PANEL_MATRIX1, MakeRect (1, 1, 3, 3), M1array, VAL_ROW_MAJOR);
			GetTableCellRangeVals (panelHandle, PANEL_MATRIX2, MakeRect (1, 1, 3, 1), M2array, VAL_ROW_MAJOR);
			MatrixMul (M1array, M2array, 3, 3, 1, M3array);
			SetTableCellRangeVals (panelHandle, PANEL_MATRIX3, MakeRect (1, 1, 1, 3), M3array, VAL_ROW_MAJOR);
			break;
	}
	return 0;
}
 /// HIFN Exit when the user dismisses the panel.
int CVICALLBACK panelCB (int panel, int event, void *callbackData,
		int eventData1, int eventData2)
{
	if (event == EVENT_CLOSE)
		QuitUserInterface (0);
	return 0;
}

int CVICALLBACK calc2 (int panel, int control, int event,
					   void *callbackData, int eventData1, int eventData2)
{
	switch (event)
	{
		case EVENT_COMMIT:
			GetTableCellRangeVals (panelHandle, PANEL_MATRIX1, MakeRect (1, 1, 3, 3), M1array, VAL_ROW_MAJOR);
			GetTableCellRangeVals (panelHandle, PANEL_MATRIX2, MakeRect (1, 1, 3, 1), M2array, VAL_ROW_MAJOR);
		  	Determinant (M1array, 3, &deter);
			if (deter!=0)
			{
				  InvMatrix (M1array, 3, invarray);
				  GetTableCellRangeVals (panelHandle, PANEL_MATRIX3, MakeRect (1, 1, 1, 3), M3array, VAL_ROW_MAJOR);
			 	  MatrixMul (invarray, M3array, 3, 3, 1, M2array);
				  SetTableCellRangeVals (panelHandle, PANEL_MATRIX2, MakeRect (1, 1, 3, 1), M2array, VAL_ROW_MAJOR);

			}
			else 
			{
				MessagePopup ("ERROR", "Determinant is eq zero cant invert the matrix ");
	
			}
			break;
	}
	return 0;
}
