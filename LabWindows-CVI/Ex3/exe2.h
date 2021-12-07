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
#define  PANEL_V1                         3       /* control type: numeric, callback function: (none) */
#define  PANEL_V2                         4       /* control type: numeric, callback function: (none) */
#define  PANEL_C1                         5       /* control type: numeric, callback function: (none) */
#define  PANEL_C2                         6       /* control type: numeric, callback function: (none) */
#define  PANEL_R                          7       /* control type: numeric, callback function: (none) */
#define  PANEL_ENABLE                     8       /* control type: binary, callback function: Doitt */
#define  PANEL_LED                        9       /* control type: LED, callback function: (none) */
#define  PANEL_TIMER                      10      /* control type: timer, callback function: myTimer */
#define  PANEL_TimeInter                  11      /* control type: numeric, callback function: (none) */
#define  PANEL_DV1                        12      /* control type: scale, callback function: (none) */
#define  PANEL_DV2                        13      /* control type: scale, callback function: (none) */
#define  PANEL_STRING                     14      /* control type: string, callback function: (none) */
#define  PANEL_GO                         15      /* control type: command, callback function: GO */
#define  PANEL_I1                         16      /* control type: numeric, callback function: (none) */
#define  PANEL_I2                         17      /* control type: numeric, callback function: (none) */
#define  PANEL_TimeCount                  18      /* control type: numeric, callback function: (none) */
#define  PANEL_GRAPH                      19      /* control type: command, callback function: GRAPH */
#define  PANEL_DVR                        20      /* control type: scale, callback function: (none) */

#define  PANEL_2                          2
#define  PANEL_2_GRAPH                    2       /* control type: graph, callback function: (none) */
#define  PANEL_2_IRswitch                 3       /* control type: binary, callback function: IRswitch */
#define  PANEL_2_Vc1switch                4       /* control type: binary, callback function: Vc1switch */
#define  PANEL_2_Vc2switch                5       /* control type: binary, callback function: Vc2switch */
#define  PANEL_2_Vdiffswitch              6       /* control type: binary, callback function: Vdiffswitch */
#define  PANEL_2_log                      7       /* control type: binary, callback function: logswitch */
#define  PANEL_2_YVAL                     8       /* control type: numeric, callback function: (none) */
#define  PANEL_2_YVAL_2                   9       /* control type: numeric, callback function: (none) */
#define  PANEL_2_XVAL_2                   10      /* control type: numeric, callback function: (none) */
#define  PANEL_2_XVAL                     11      /* control type: numeric, callback function: (none) */
#define  PANEL_2_Cursor_2                 12      /* control type: textMsg, callback function: (none) */
#define  PANEL_2_SLOPE                    13      /* control type: numeric, callback function: (none) */
#define  PANEL_2_dIr                      14      /* control type: numeric, callback function: (none) */
#define  PANEL_2_dVc1                     15      /* control type: numeric, callback function: (none) */
#define  PANEL_2_dVc2                     16      /* control type: numeric, callback function: (none) */
#define  PANEL_2_dVr                      17      /* control type: numeric, callback function: (none) */
#define  PANEL_2_Cursor_1                 18      /* control type: textMsg, callback function: (none) */
#define  PANEL_2_DSLOPE                   19      /* control type: numeric, callback function: (none) */
#define  PANEL_2_CloseGraph               20      /* control type: command, callback function: CloseGraph */
#define  PANEL_2_ERROR                    21      /* control type: textMsg, callback function: (none) */


     /* Control Arrays: */

          /* (no control arrays in the resource file) */


     /* Menu Bars, Menus, and Menu Items: */

#define  MENUBAR                          1
#define  MENUBAR_MENU1                    2
#define  MENUBAR_MENU1_MENU2              3


     /* Callback Prototypes: */

int  CVICALLBACK CloseGraph(int panel, int control, int event, void *callbackData, int eventData1, int eventData2);
int  CVICALLBACK Doitt(int panel, int control, int event, void *callbackData, int eventData1, int eventData2);
int  CVICALLBACK GO(int panel, int control, int event, void *callbackData, int eventData1, int eventData2);
int  CVICALLBACK GRAPH(int panel, int control, int event, void *callbackData, int eventData1, int eventData2);
int  CVICALLBACK IRswitch(int panel, int control, int event, void *callbackData, int eventData1, int eventData2);
int  CVICALLBACK logswitch(int panel, int control, int event, void *callbackData, int eventData1, int eventData2);
int  CVICALLBACK myTimer(int panel, int control, int event, void *callbackData, int eventData1, int eventData2);
int  CVICALLBACK QuitCallback(int panel, int control, int event, void *callbackData, int eventData1, int eventData2);
int  CVICALLBACK Vc1switch(int panel, int control, int event, void *callbackData, int eventData1, int eventData2);
int  CVICALLBACK Vc2switch(int panel, int control, int event, void *callbackData, int eventData1, int eventData2);
int  CVICALLBACK Vdiffswitch(int panel, int control, int event, void *callbackData, int eventData1, int eventData2);


#ifdef __cplusplus
    }
#endif
