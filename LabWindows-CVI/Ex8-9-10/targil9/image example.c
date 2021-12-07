#include <utility.h>
#include <ansi_c.h>
#include <cvirte.h>		
#include <userint.h>
#include "image example.h"
#define SIZE 666
#define PI 3.14159
typedef union mColor {
	int value;
	unsigned char bytes[4];
} mColor;
mColor color;
static int panelHandle, bitmapid, bitmapid_loaded, bitsSize,bpr;
int imageWidth, imageHeight, pixelDepth, pixels, cWidth, cHeight;
static char imagePath[SIZE];
void restore_pixelArray();    
unsigned char* bytesArray;
int* pixelArray;
int* rotateArray; 
int* rotateArrayA;
int* convArray;



int main (int argc, char *argv[])
{
	if (InitCVIRTE (0, argv, 0) == 0)
		return -1;	/* out of memory */
	if ((panelHandle = LoadPanel (0, "image example.uir", PANEL)) < 0)
		return -1;
	DisplayPanel (panelHandle);
	GetCtrlAttribute(panelHandle,PANEL_CANVAS_2,ATTR_WIDTH,&cWidth);
	GetCtrlAttribute(panelHandle,PANEL_CANVAS_2,ATTR_HEIGHT,&cHeight);
	RunUserInterface ();
	DiscardPanel (panelHandle);
	return 0;
}

int CVICALLBACK QuitCallback (int panel, int control, int event,
							  void *callbackData, int eventData1, int eventData2)
{
	switch (event)
	{
		case EVENT_COMMIT:
			QuitUserInterface (0);
			if(pixelArray!=NULL) free(pixelArray);
			if(bytesArray!=NULL) free(bytesArray);
			if(rotateArrayA!=NULL) free(rotateArrayA);
			if(bitmapid) bitmapid=DiscardBitmap(bitmapid); 
			if(bitmapid_loaded) bitmapid_loaded=DiscardBitmap(bitmapid_loaded);
			
			break;
	}
	return 0;
}


int CVICALLBACK invert_colors (int panel, int control, int event,
							   void *callbackData, int eventData1, int eventData2)
{
	switch (event)
	{
		case EVENT_COMMIT:
			for(int i=0; i<pixels; i++) {
				pixelArray[i]=~pixelArray[i];
			}
			if(bitmapid) bitmapid=DiscardBitmap(bitmapid);
			NewBitmapEx (bpr, 32, imageWidth, imageHeight, NULL,
						 (unsigned char*)pixelArray, NULL, NULL, &bitmapid);
			CanvasDrawBitmap (panelHandle, PANEL_CANVAS_2, bitmapid,
					  VAL_ENTIRE_OBJECT, VAL_ENTIRE_OBJECT);
			break;
	}
	return 0;
}


int CVICALLBACK load_image (int panel, int control, int event,
							void *callbackData, int eventData1, int eventData2)
{
	switch (event)
	{
		case EVENT_COMMIT:
			FileSelectPopup ("", "*.*", "", "", VAL_LOAD_BUTTON, 0, 0, 1, 1, imagePath);
			GetBitmapFromFile (imagePath, &bitmapid_loaded);
			GetBitmapFromFile (imagePath, &bitmapid); 
			CanvasDrawBitmap (panelHandle, PANEL_CANVAS, bitmapid_loaded, VAL_ENTIRE_OBJECT, VAL_ENTIRE_OBJECT);
			CanvasDrawBitmap (panelHandle, PANEL_CANVAS_2, bitmapid_loaded, VAL_ENTIRE_OBJECT, VAL_ENTIRE_OBJECT);
			GetBitmapInfoEx (bitmapid_loaded, NULL, &bitsSize, NULL, NULL);
			bytesArray=(unsigned char *)malloc(bitsSize);
			GetBitmapDataEx (bitmapid_loaded, &bpr, &pixelDepth, &imageWidth, &imageHeight, NULL, bytesArray, NULL, NULL);
			pixels = imageWidth*imageHeight;
			pixelArray=(int*)malloc(pixels*sizeof(int));
			restore_pixelArray();
			break;
	}
	return 0;
}

void restore_pixelArray()
{
	if(pixelDepth==24){
		for(int i=0, j=0; i<pixels; i++, j+=3){
			color.bytes[0]=bytesArray[j+2];
			color.bytes[1]=bytesArray[j+1];
			color.bytes[2]=bytesArray[j];
			pixelArray[i]=color.value;
		}
	}
	else if(pixelDepth==32){
		for(int i=0, j=0; i<pixels; i++, j+=4){
			color.bytes[0]=bytesArray[j];
			color.bytes[1]=bytesArray[j+1];
			color.bytes[2]=bytesArray[j+2];
			pixelArray[i]=color.value;
		}
	}
	else{
		QuitUserInterface (0);
		if(pixelArray!=NULL) free(pixelArray);
		if(bytesArray!=NULL) free(bytesArray);
		if(bitmapid) bitmapid=DiscardBitmap(bitmapid); 
		if(bitmapid_loaded) bitmapid_loaded=DiscardBitmap(bitmapid_loaded);
	}
}



int CVICALLBACK Rotate_im (int panel, int control, int event,
							 void *callbackData, int eventData1, int eventData2)
{
	int horizontal, vertical, pindex=0;
	switch (event)
	{
		case EVENT_COMMIT:
			rotateArray=(int*)malloc(pixels*sizeof(int)); 
			for(horizontal=0; horizontal<imageWidth; horizontal++)
			{
				for(vertical=imageHeight-1; vertical>=0; vertical--)
				{
					rotateArray[pindex]=pixelArray[horizontal+vertical*imageWidth];
					pindex++;
					if(pindex==pixels)
						break;
				}
			}
			for (pindex = 0; pindex<pixels; pindex++)
				pixelArray[pindex]=rotateArray[pindex];
			free(rotateArray);
			if(bitmapid) bitmapid=DiscardBitmap(bitmapid);
			bpr=imageHeight*4;
			imageHeight = imageWidth;
			imageWidth = bpr/4;
			NewBitmapEx (bpr, 32, imageWidth, imageHeight, NULL,
						 (unsigned char*)pixelArray, NULL, NULL, &bitmapid);
			CanvasDrawBitmap (panelHandle, PANEL_CANVAS_2, bitmapid,
					  VAL_ENTIRE_OBJECT, VAL_ENTIRE_OBJECT);
			break;
	}
	return 0;
}

int CVICALLBACK mirrorY (int panel, int control, int event,
									  void *callbackData, int eventData1, int eventData2)
{
	int vertical, horizontal, temp;
	switch (event)
	{
		case EVENT_COMMIT:
			for(vertical = 0; vertical<imageHeight/2; vertical++)
			{	
					for(horizontal = 0; horizontal<imageWidth; horizontal++)
					{
						temp = pixelArray[vertical*imageWidth + horizontal];
						pixelArray[vertical*imageWidth + horizontal] = pixelArray[(imageHeight-vertical-1)*imageWidth + horizontal];
						pixelArray[(imageHeight-vertical-1)*imageWidth + horizontal] = temp;
					}
			}
			if(bitmapid) bitmapid=DiscardBitmap(bitmapid);
			NewBitmapEx (bpr, 32, imageWidth, imageHeight, NULL,
						 (unsigned char*)pixelArray, NULL, NULL, &bitmapid);
			CanvasDrawBitmap (panelHandle, PANEL_CANVAS_2, bitmapid,
					  VAL_ENTIRE_OBJECT, VAL_ENTIRE_OBJECT);
			break;
	}
	return 0;
}

int CVICALLBACK rotate_angle (int panel, int control, int event,
								  void *callbackData, int eventData1, int eventData2)
{
	double angle, rad;
	int vertical, horizontal;
	int pindex;
	Point pr, p;
	switch (event)
	{
		case EVENT_COMMIT:
			GetCtrlVal(panelHandle,PANEL_ALPHANUMERIC, &angle);
			rad = PI*(angle/180);
			if(rotateArrayA!=NULL) free(rotateArrayA);
			rotateArrayA=(int*)malloc(pixels*4*sizeof(int));
			for(vertical=0; vertical < imageHeight*2; vertical++)
			{
				for(horizontal=0; horizontal < imageWidth*2; horizontal++)
				{
					pindex = imageWidth*2*vertical + horizontal;
					color.bytes[0] = 0xFF;
					color.bytes[1] = 0xFF;
					color.bytes[2] = 0xFF;
					rotateArrayA[pindex]  = color.value;
				}
			}
			for(vertical=0; vertical<imageHeight; vertical++)
			{
				for(horizontal=0; horizontal<imageWidth; horizontal++)
				{
					p.x = horizontal-imageWidth/2; 
					p.y = vertical-imageHeight/2;
					pr.x = (int)RoundRealToNearestInteger(((double)p.x)*cos(rad)-((double)p.y)*sin(rad));
					pr.y = (int)RoundRealToNearestInteger(((double)p.x)*sin(rad)+((double)p.y)*cos(rad));
					pr.x = pr.x + imageWidth;
					pr.y = pr.y + imageHeight;
					pindex = imageWidth*2*pr.y+pr.x;
					rotateArrayA[pindex] = pixelArray[vertical*imageWidth+horizontal];
				}
			}
			if(bitmapid) bitmapid=DiscardBitmap(bitmapid);
			NewBitmapEx (imageWidth*2*pixelDepth/8, 32, imageWidth*2, imageHeight*2, NULL,
						 (unsigned char*)rotateArrayA, NULL, NULL, &bitmapid);
			CanvasDrawBitmap (panelHandle, PANEL_CANVAS_2, bitmapid,
					  VAL_ENTIRE_OBJECT, VAL_ENTIRE_OBJECT);
			break;
	}
	return 0;
}

int CVICALLBACK save_image (int panel, int control, int event,
							void *callbackData, int eventData1, int eventData2)
{
	int pic_type = 0;
	switch (event)
	{
		case EVENT_COMMIT:
			GetCtrlVal(panelHandle, PANEL_PICTYPERING, &pic_type);
			switch(pic_type)
			{
				case 1:
					FileSelectPopup ("", ".bmp", "", "", VAL_SAVE_BUTTON, 0, 0, 1, 1, imagePath);
					SaveBitmapToBMPFile (bitmapid, imagePath);
					break;
				case 2:
					FileSelectPopup ("", ".jpeg", "", "", VAL_SAVE_BUTTON, 0, 0, 1, 1, imagePath);
					SaveBitmapToJPEGFile (bitmapid, imagePath, 0, 88);
					break;
				case 3:
					FileSelectPopup ("", ".png", "", "", VAL_SAVE_BUTTON, 0, 0, 1, 1, imagePath);
					SaveBitmapToPNGFile (bitmapid, imagePath);
					break;
				case 4:
					FileSelectPopup ("", ".tif", "", "", VAL_SAVE_BUTTON, 0, 0, 1, 1, imagePath);
					SaveBitmapToTIFFile (bitmapid, imagePath, TIF_COMPRESSION_ZIP);
					break;
				default:
					break;
			}
			break;
	}
	return 0;
}

int CVICALLBACK mirrorX (int panel, int control, int event,
										void *callbackData, int eventData1, int eventData2)
{
	int vertical, horizontal, temp;
	switch (event)
	{
		case EVENT_COMMIT:
			for(vertical = 0; vertical<imageHeight; vertical++)
			{	
					for(horizontal = 0; horizontal<imageWidth/2; horizontal++)
					{
						temp = pixelArray[vertical*imageWidth + horizontal];
						pixelArray[vertical*imageWidth + horizontal] = pixelArray[vertical*imageWidth + (imageWidth-horizontal-1)];
						pixelArray[vertical*imageWidth + (imageWidth-horizontal-1)] = temp;
					}
			}
			if(bitmapid) bitmapid=DiscardBitmap(bitmapid);
			NewBitmapEx (bpr, 32, imageWidth, imageHeight, NULL,
						 (unsigned char*)pixelArray, NULL, NULL, &bitmapid);
			CanvasDrawBitmap (panelHandle, PANEL_CANVAS_2, bitmapid,
					  VAL_ENTIRE_OBJECT, VAL_ENTIRE_OBJECT);
			break;
	}
	return 0;
}



