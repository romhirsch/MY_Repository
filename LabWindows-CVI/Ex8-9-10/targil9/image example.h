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
#define  PANEL_CANVAS_2                   2       /* control type: canvas, callback function: (none) */
#define  PANEL_CANVAS                     3       /* control type: canvas, callback function: (none) */
#define  PANEL_QUITBUTTON                 4       /* control type: command, callback function: QuitCallback */
#define  PANEL_SAVEIMGBUTTON              5       /* control type: command, callback function: save_image */
#define  PANEL_LOADIMGBUTTON              6       /* control type: command, callback function: load_image */
#define  PANEL_ROTATEALPHABUTTON          7       /* control type: command, callback function: rotate_angle */
#define  PANEL_ROTATEBUTTON               8       /* control type: command, callback function: Rotate_im */
#define  PANEL_MVERTICALBUTTON            9       /* control type: command, callback function: mirrorY */
#define  PANEL_MHORIZONBUTTON             10      /* control type: command, callback function: mirrorX */
#define  PANEL_INVERTBUTTON               11      /* control type: command, callback function: invert_colors */
#define  PANEL_ALPHANUMERIC               12      /* control type: numeric, callback function: (none) */
#define  PANEL_PICTYPERING                13      /* control type: ring, callback function: (none) */


     /* Control Arrays: */

          /* (no control arrays in the resource file) */


     /* Menu Bars, Menus, and Menu Items: */

          /* (no menu bars in the resource file) */


     /* Callback Prototypes: */

int  CVICALLBACK invert_colors(int panel, int control, int event, void *callbackData, int eventData1, int eventData2);
int  CVICALLBACK load_image(int panel, int control, int event, void *callbackData, int eventData1, int eventData2);
int  CVICALLBACK mirrorX(int panel, int control, int event, void *callbackData, int eventData1, int eventData2);
int  CVICALLBACK mirrorY(int panel, int control, int event, void *callbackData, int eventData1, int eventData2);
int  CVICALLBACK QuitCallback(int panel, int control, int event, void *callbackData, int eventData1, int eventData2);
int  CVICALLBACK rotate_angle(int panel, int control, int event, void *callbackData, int eventData1, int eventData2);
int  CVICALLBACK Rotate_im(int panel, int control, int event, void *callbackData, int eventData1, int eventData2);
int  CVICALLBACK save_image(int panel, int control, int event, void *callbackData, int eventData1, int eventData2);


#ifdef __cplusplus
    }
#endif
