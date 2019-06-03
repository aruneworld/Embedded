#define LCD_First_Line		0x80
#define LCD_Second_Line 	0xc0
#define LCD_Curser_On  		0x0f
#define LCD_Curser_Off 		0x0c
#define LCD_Clear_Display 0x01
#define Lcd8_Data_Port 		P2

sbit Lcd8_RS = P0^0;
sbit Lcd8_RW = P0^1;
sbit Lcd8_EN = P0^2;

void Lcd8_Init();
void Lcd8_Command(unsigned char);
void Lcd8_Write(unsigned char,unsigned char);
void Lcd8_Display(unsigned char,const unsigned char*,unsigned int);
void Lcd8_Decimal2(unsigned char,unsigned char);
void Lcd8_Decimal3(unsigned char,unsigned char);
void Lcd8_Decimal4(unsigned char,unsigned int);
void Delay(unsigned int);

void Lcd8_Init()
{
	Lcd8_Command(0x38);		//to select function set
	Lcd8_Command(0x06);		//entry mode set
	Lcd8_Command(0x0c);		//display on
	Lcd8_Command(0x01);		//clear display
}

void Lcd8_Command(unsigned char com)
{
	Lcd8_Data_Port=com;
	Lcd8_EN=1;
	Lcd8_RS=Lcd8_RW=0;
	Delay(125);
	Lcd8_EN=0;
	Delay(125);
}

void Lcd8_Write(unsigned char com,unsigned char lr)
{
	Lcd8_Command(com);

	Lcd8_Data_Port=lr;			// Data 
	Lcd8_EN=Lcd8_RS=1;
	Lcd8_RW=0;
	Delay(125);
	Lcd8_EN=0;
	Delay(125);
}

void Lcd8_Display(unsigned char com,const unsigned char *word,unsigned int n)
{
	unsigned char Lcd_i;

	for(Lcd_i=0;Lcd_i<n;Lcd_i++)
	{ 
		Lcd8_Write(com+Lcd_i,word[Lcd_i]);
  	}
}

void Lcd8_Decimal2(unsigned char com,unsigned char val)
{
	unsigned int Lcd_hr,Lcd_t,Lcd_o;

	Lcd_hr=val%100;
	Lcd_t=Lcd_hr/10;
	Lcd_o=Lcd_hr%10;
	
	Lcd8_Write(com,Lcd_t+0x30);
	Lcd8_Write(com+1,Lcd_o+0x30);
}


void Lcd8_Decimal3(unsigned char com,unsigned char val)
{
	unsigned int Lcd_h,Lcd_hr,Lcd_t,Lcd_o;

	Lcd_h=val/100;
	Lcd_hr=val%100;
	Lcd_t=Lcd_hr/10;
	Lcd_o=Lcd_hr%10;
	
	Lcd8_Write(com,Lcd_h+0x30);
	Lcd8_Write(com+1,Lcd_t+0x30);
	Lcd8_Write(com+2,Lcd_o+0x30);
}

void Lcd8_Decimal4(unsigned char com,unsigned int val) 
{
	unsigned int Lcd_th,Lcd_thr,Lcd_h,Lcd_hr,Lcd_t,Lcd_o;

	val = val%10000;
	Lcd_th=val/1000;
	Lcd_thr=val%1000;
	Lcd_h=Lcd_thr/100;
	Lcd_hr=Lcd_thr%100;
	Lcd_t=Lcd_hr/10;
	Lcd_o=Lcd_hr%10;

	Lcd8_Write(com,Lcd_th+0x30);
	Lcd8_Write(com+1,Lcd_h+0x30);
	Lcd8_Write(com+2,Lcd_t+0x30);
	Lcd8_Write(com+3,Lcd_o+0x30);
}

void Delay(unsigned int del)
{
	while(del--);
}     
