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

#define  MEDIA                            1
#define  MEDIA_WINDOWSMEDIAPLAYER         2       /* control type: activeX, callback function: (none) */

#define  PANEL_GAME                       2       /* callback function: GAME */
#define  PANEL_GAME_CANVAS                2       /* control type: canvas, callback function: (none) */
#define  PANEL_GAME_PICTURE_4             3       /* control type: picture, callback function: (none) */
#define  PANEL_GAME_NUMERIC_HEARTS_2      4       /* control type: numeric, callback function: (none) */
#define  PANEL_GAME_NUMERIC_SHOTS_2       5       /* control type: numeric, callback function: (none) */
#define  PANEL_GAME_PICTURE               6       /* control type: picture, callback function: (none) */
#define  PANEL_GAME_NUMERIC_HEARTS        7       /* control type: numeric, callback function: (none) */
#define  PANEL_GAME_NUMERIC_SHOTS         8       /* control type: numeric, callback function: (none) */
#define  PANEL_GAME_TEXTMSG_3             9       /* control type: textMsg, callback function: (none) */
#define  PANEL_GAME_TEXTMSG               10      /* control type: textMsg, callback function: (none) */
#define  PANEL_GAME_TEXTMSG_2             11      /* control type: textMsg, callback function: (none) */
#define  PANEL_GAME_TXT                   12      /* control type: textMsg, callback function: (none) */
#define  PANEL_GAME_PICTURE_6             13      /* control type: picture, callback function: (none) */
#define  PANEL_GAME_PICTURE_5             14      /* control type: picture, callback function: (none) */
#define  PANEL_GAME_PICTURE_3             15      /* control type: picture, callback function: (none) */

#define  PANEL_how                        3       /* callback function: quitHow */
#define  PANEL_how_PICTURE                2       /* control type: picture, callback function: (none) */

#define  PANEL_MAIN                       4       /* callback function: QuitMain */
#define  PANEL_MAIN_BUTTON_how            2       /* control type: pictButton, callback function: how_to_play_func */
#define  PANEL_MAIN_COM_main              3       /* control type: numeric, callback function: (none) */
#define  PANEL_MAIN_EXIT_BUTTON           4       /* control type: pictButton, callback function: QuitCallback */
#define  PANEL_MAIN_START_BUTTON          5       /* control type: pictButton, callback function: new_game_button */
#define  PANEL_MAIN_PICTURE_2             6       /* control type: picture, callback function: (none) */
#define  PANEL_MAIN_PICTURE_6             7       /* control type: picture, callback function: (none) */

#define  PANEL_RS                         5       /* callback function: CB */
#define  PANEL_RS_TIMER                   2       /* control type: timer, callback function: RecTimer */
#define  PANEL_RS_COM                     3       /* control type: numeric, callback function: (none) */
#define  PANEL_RS_RECIVER                 4       /* control type: textBox, callback function: (none) */
#define  PANEL_RS_applycom                5       /* control type: command, callback function: applycom */

#define  PANEL_STAT                       6       /* callback function: QuitStatics */
#define  PANEL_STAT_TAB                   2       /* control type: tab, callback function: (none) */
#define  PANEL_STAT_PICTURE               3       /* control type: picture, callback function: (none) */
#define  PANEL_STAT_PICTURE_3             4       /* control type: picture, callback function: (none) */
#define  PANEL_STAT_PICTURE_2             5       /* control type: picture, callback function: (none) */

     /* tab page panel controls */
#define  TABPANEL_TABLE_stat              2       /* control type: table, callback function: (none) */
#define  TABPANEL_PICTURE                 3       /* control type: picture, callback function: (none) */
#define  TABPANEL_PICTURE_2               4       /* control type: picture, callback function: (none) */

     /* tab page panel controls */
#define  TABPANEL_2_TABLE_stat_2          2       /* control type: table, callback function: (none) */


     /* Control Arrays: */

          /* (no control arrays in the resource file) */


     /* Menu Bars, Menus, and Menu Items: */

#define  BAR_NEWGAM                       1
#define  BAR_NEWGAM_BAR_GAME              2
#define  BAR_NEWGAM_BAR_GAME_BAR_NEWGAME  3       /* callback function: NewGame */
#define  BAR_NEWGAM_Options               4
#define  BAR_NEWGAM_Options_ITEM1         5       /* callback function: Statics */
#define  BAR_NEWGAM_Options_BAR_RS232     6       /* callback function: BAR_RS232 */
#define  BAR_NEWGAM_Options_sound_bar     7       /* callback function: menu_bar_sound_flag */
#define  BAR_NEWGAM_help                  8
#define  BAR_NEWGAM_help_ITEM2            9       /* callback function: menu_bar_about */
#define  BAR_NEWGAM_help_howtoplay        10      /* callback function: howtoplay_bar */

#define  MENUBAR                          2
#define  MENUBAR_MENU1                    2
#define  MENUBAR_MENU2                    3


     /* Callback Prototypes: */

int  CVICALLBACK applycom(int panel, int control, int event, void *callbackData, int eventData1, int eventData2);
void CVICALLBACK BAR_RS232(int menubar, int menuItem, void *callbackData, int panel);
int  CVICALLBACK CB(int panel, int event, void *callbackData, int eventData1, int eventData2);
int  CVICALLBACK GAME(int panel, int event, void *callbackData, int eventData1, int eventData2);
int  CVICALLBACK how_to_play_func(int panel, int control, int event, void *callbackData, int eventData1, int eventData2);
void CVICALLBACK howtoplay_bar(int menubar, int menuItem, void *callbackData, int panel);
void CVICALLBACK menu_bar_about(int menubar, int menuItem, void *callbackData, int panel);
void CVICALLBACK menu_bar_sound_flag(int menubar, int menuItem, void *callbackData, int panel);
int  CVICALLBACK new_game_button(int panel, int control, int event, void *callbackData, int eventData1, int eventData2);
void CVICALLBACK NewGame(int menubar, int menuItem, void *callbackData, int panel);
int  CVICALLBACK QuitCallback(int panel, int control, int event, void *callbackData, int eventData1, int eventData2);
int  CVICALLBACK quitHow(int panel, int event, void *callbackData, int eventData1, int eventData2);
int  CVICALLBACK QuitMain(int panel, int event, void *callbackData, int eventData1, int eventData2);
int  CVICALLBACK QuitStatics(int panel, int event, void *callbackData, int eventData1, int eventData2);
int  CVICALLBACK RecTimer(int panel, int control, int event, void *callbackData, int eventData1, int eventData2);
void CVICALLBACK Statics(int menubar, int menuItem, void *callbackData, int panel);


#ifdef __cplusplus
    }
#endif
