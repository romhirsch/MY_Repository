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

#define  PANEL                            1
#define  PANEL_QUITBUTTON                 2       /* control type: command, callback function: QuitCallback */
#define  PANEL_V3                         3       /* control type: numeric, callback function: (none) */
#define  PANEL_V4                         4       /* control type: numeric, callback function: (none) */
#define  PANEL_V1                         5       /* control type: numeric, callback function: (none) */
#define  PANEL_V2                         6       /* control type: numeric, callback function: (none) */
#define  PANEL_C4                         7       /* control type: numeric, callback function: (none) */
#define  PANEL_C3                         8       /* control type: numeric, callback function: (none) */
#define  PANEL_C1                         9       /* control type: numeric, callback function: (none) */
#define  PANEL_C2                         10      /* control type: numeric, callback function: (none) */
#define  PANEL_R13                        11      /* control type: numeric, callback function: (none) */
#define  PANEL_R14                        12      /* control type: numeric, callback function: (none) */
#define  PANEL_R23                        13      /* control type: numeric, callback function: (none) */
#define  PANEL_R34                        14      /* control type: numeric, callback function: (none) */
#define  PANEL_R24                        15      /* control type: numeric, callback function: (none) */
#define  PANEL_R12                        16      /* control type: numeric, callback function: (none) */
#define  PANEL_ENABLE                     17      /* control type: binary, callback function: Doitt */
#define  PANEL_LED                        18      /* control type: LED, callback function: (none) */
#define  PANEL_TIMER                      19      /* control type: timer, callback function: myTimer */
#define  PANEL_TimeInter                  20      /* control type: numeric, callback function: (none) */
#define  PANEL_DV3                        21      /* control type: scale, callback function: (none) */
#define  PANEL_DV4                        22      /* control type: scale, callback function: (none) */
#define  PANEL_DV1                        23      /* control type: scale, callback function: (none) */
#define  PANEL_DV2                        24      /* control type: scale, callback function: (none) */
#define  PANEL_STRING                     25      /* control type: string, callback function: (none) */
#define  PANEL_GO                         26      /* control type: command, callback function: GO */
#define  PANEL_TimeCount                  27      /* control type: numeric, callback function: (none) */


     /* Control Arrays: */

          /* (no control arrays in the resource file) */


     /* Menu Bars, Menus, and Menu Items: */

#define  MENUBAR                          1
#define  MENUBAR_MENU1                    2
#define  MENUBAR_MENU1_MENU2              3


     /* Callback Prototypes: */

int  CVICALLBACK Doitt(int panel, int control, int event, void *callbackData, int eventData1, int eventData2);
int  CVICALLBACK GO(int panel, int control, int event, void *callbackData, int eventData1, int eventData2);
int  CVICALLBACK myTimer(int panel, int control, int event, void *callbackData, int eventData1, int eventData2);
int  CVICALLBACK QuitCallback(int panel, int control, int event, void *callbackData, int eventData1, int eventData2);


#ifdef __cplusplus
    }
#endif
