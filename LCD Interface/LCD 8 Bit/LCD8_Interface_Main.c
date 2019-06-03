#include<reg51.h>
#include "LCD8.h"

void timer_init(void);

static unsigned char i;
static unsigned int x=100,y=150,cnt; 

void main()
{
	Lcd8_Init();
	Lcd8_Display(LCD_First_Line,"   Hello World  ",16);
	while(1)
	{
		Lcd8_Display(LCD_Second_Line," ArunEworld.com ",16);
	}//while(1)
}//void main()
