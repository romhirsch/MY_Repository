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

#define  Q2                               1
#define  Q2_CANVAS                        2       /* control type: canvas, callback function: Q4_Clicker */
#define  Q2_QUITBUTTON                    3       /* control type: command, callback function: QuitCallback */
#define  Q2_X3                            4       /* control type: numeric, callback function: (none) */
#define  Q2_X2                            5       /* control type: numeric, callback function: (none) */
#define  Q2_X1                            6       /* control type: numeric, callback function: (none) */
#define  Q2_L3                            7       /* control type: numeric, callback function: (none) */
#define  Q2_L2                            8       /* control type: numeric, callback function: (none) */
#define  Q2_L1                            9       /* control type: numeric, callback function: (none) */
#define  Q2_K3                            10      /* control type: numeric, callback function: (none) */
#define  Q2_K2                            11      /* control type: numeric, callback function: (none) */
#define  Q2_K1                            12      /* control type: numeric, callback function: (none) */
#define  Q2_M2                            13      /* control type: numeric, callback function: (none) */
#define  Q2_M1                            14      /* control type: numeric, callback function: (none) */
#define  Q2_START                         15      /* control type: command, callback function: STARTCALLBACK */
#define  Q2_TIMER                         16      /* control type: timer, callback function: TIMER */


     /* Control Arrays: */

          /* (no control arrays in the resource file) */


     /* Menu Bars, Menus, and Menu Items: */

          /* (no menu bars in the resource file) */


     /* Callback Prototypes: */

int  CVICALLBACK Q4_Clicker(int panel, int control, int event, void *callbackData, int eventData1, int eventData2);
int  CVICALLBACK QuitCallback(int panel, int control, int event, void *callbackData, int eventData1, int eventData2);
int  CVICALLBACK STARTCALLBACK(int panel, int control, int event, void *callbackData, int eventData1, int eventData2);
int  CVICALLBACK TIMER(int panel, int control, int event, void *callbackData, int eventData1, int eventData2);


#ifdef __cplusplus
    }
#endif
