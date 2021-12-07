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
#define  PANEL_MATRIX3                    2       /* control type: table, callback function: (none) */
#define  PANEL_MATRIX2                    3       /* control type: table, callback function: (none) */
#define  PANEL_MATRIX1                    4       /* control type: table, callback function: (none) */
#define  PANEL_TEXTMSG_2                  5       /* control type: textMsg, callback function: (none) */
#define  PANEL_Calc                       6       /* control type: command, callback function: calc */
#define  PANEL_TEXTMSG                    7       /* control type: textMsg, callback function: (none) */
#define  PANEL_calc2                      8       /* control type: command, callback function: calc2 */


     /* Control Arrays: */

          /* (no control arrays in the resource file) */


     /* Menu Bars, Menus, and Menu Items: */

          /* (no menu bars in the resource file) */


     /* Callback Prototypes: */

int  CVICALLBACK calc(int panel, int control, int event, void *callbackData, int eventData1, int eventData2);
int  CVICALLBACK calc2(int panel, int control, int event, void *callbackData, int eventData1, int eventData2);
int  CVICALLBACK panelCB(int panel, int event, void *callbackData, int eventData1, int eventData2);


#ifdef __cplusplus
    }
#endif
