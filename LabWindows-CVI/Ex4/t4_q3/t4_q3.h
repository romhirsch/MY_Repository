/**************************************************************************/
/* LabWindows/CVI User Interface Resource (UIR) Include File              */
/*                                                                        */
/* WARNING: Do not add to, delete from, or otherwise modify the contents  */
/*          of this include file.                                         */
/**************************************************************************/

#include <userint.h>

#ifdef __cplusplus
    extern "C" {
#endif

     /* Panels and Controls: */

#define  PANEL                            1       /* callback function: panelCB */
#define  PANEL_CANVAS                     2       /* control type: canvas, callback function: (none) */
#define  PANEL_START                      3       /* control type: command, callback function: START */
#define  PANEL_dt                         4       /* control type: numeric, callback function: (none) */
#define  PANEL_Teta                       5       /* control type: numeric, callback function: (none) */
#define  PANEL_V                          6       /* control type: numeric, callback function: (none) */
#define  PANEL_M                          7       /* control type: numeric, callback function: (none) */
#define  PANEL_gamma                      8       /* control type: numeric, callback function: (none) */
#define  PANEL_TIME                       9       /* control type: numeric, callback function: (none) */
#define  PANEL_Y                          10      /* control type: string, callback function: (none) */
#define  PANEL_X                          11      /* control type: string, callback function: (none) */
#define  PANEL_TIMER                      12      /* control type: timer, callback function: TIMER */


     /* Control Arrays: */

          /* (no control arrays in the resource file) */


     /* Menu Bars, Menus, and Menu Items: */

          /* (no menu bars in the resource file) */


     /* Callback Prototypes: */

int  CVICALLBACK panelCB(int panel, int event, void *callbackData, int eventData1, int eventData2);
int  CVICALLBACK START(int panel, int control, int event, void *callbackData, int eventData1, int eventData2);
int  CVICALLBACK TIMER(int panel, int control, int event, void *callbackData, int eventData1, int eventData2);


#ifdef __cplusplus
    }
#endif
