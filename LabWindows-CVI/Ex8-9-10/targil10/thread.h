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

#define  PANEL                            1       /* callback function: panel1 */
#define  PANEL_c1                         2       /* control type: numeric, callback function: (none) */
#define  PANEL_c2                         3       /* control type: numeric, callback function: (none) */
#define  PANEL_start                      4       /* control type: command, callback function: start */
#define  PANEL_stop                       5       /* control type: command, callback function: stop */
#define  PANEL_share                      6       /* control type: numeric, callback function: (none) */
#define  PANEL_timethread1                7       /* control type: numeric, callback function: (none) */
#define  PANEL_timethread2                8       /* control type: numeric, callback function: (none) */
#define  PANEL_resettime                  9       /* control type: command, callback function: reset_time */


     /* Control Arrays: */

          /* (no control arrays in the resource file) */


     /* Menu Bars, Menus, and Menu Items: */

          /* (no menu bars in the resource file) */


     /* Callback Prototypes: */

int  CVICALLBACK panel1(int panel, int event, void *callbackData, int eventData1, int eventData2);
int  CVICALLBACK reset_time(int panel, int control, int event, void *callbackData, int eventData1, int eventData2);
int  CVICALLBACK start(int panel, int control, int event, void *callbackData, int eventData1, int eventData2);
int  CVICALLBACK stop(int panel, int control, int event, void *callbackData, int eventData1, int eventData2);


#ifdef __cplusplus
    }
#endif
