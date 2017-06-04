//LCD Functions Developed by Arun

void Lcd4_Port(char a)
{
	if(a & 1)
		LCD4_D4 = 1;
	else
		LCD4_D4 = 0;

	if(a & 2)
		LCD4_D5 = 1;
	else
		LCD4_D5 = 0;

	if(a & 4)
		LCD4_D6 = 1;
	else
		LCD4_D6 = 0;

	if(a & 8)
		LCD4_D7 = 1;
	else
		LCD4_D7 = 0;
}

void Lcd4_Cmd(char a)
{
	LCD4_RS = 0;             // => RS = 0
	Lcd4_Port(a);
	LCD4_EN  = 1;             // => E = 1
        __delay_ms(4);
        LCD4_EN  = 0;             // => E = 0
}



void Lcd4_Set_Cursor(unsigned int a, unsigned int b)
{
	char temp,z,y;
	if(a == 1)
	{
	  temp = 0x80 + b - 1;
		z = temp>>4;
		y = temp & 0x0F;
		Lcd4_Cmd(z);
		Lcd4_Cmd(y);
	}
	else if(a == 2)
	{
		temp = 0xC0 + b - 1;
		z = temp>>4;
		y = temp & 0x0F;
		Lcd4_Cmd(z);
		Lcd4_Cmd(y);
	}
}

void Lcd4_Clear()				{	Lcd4_Cmd(0x00);	Lcd4_Cmd(0x01);	}	// clear screen 0x01
void Lcd4_Blink_Cursor_ON()		{	Lcd4_Cmd(0x00);	Lcd4_Cmd(0x0F);	}	// 0x0F


void Lcd4_Init()
{    
	Lcd4_Port(0x00); // clear screen
	__delay_ms(20);
	Lcd4_Cmd(0x03); 	//	4 bit mode
	__delay_ms(5);
	Lcd4_Cmd(0x03);
	__delay_ms(11);
	Lcd4_Cmd(0x03);
	/////////////////////////////////////////////////////
	Lcd4_Cmd(0x02); //return home
	
	Lcd4_Cmd(0x02); //return home
	Lcd4_Cmd(0x08);
	
	Lcd4_Cmd(0x00);
	Lcd4_Cmd(0x0C);
	
	Lcd4_Cmd(0x00);
    Lcd4_Cmd(0x04);	// display on and cursor  blink off
   // Lcd4_Cmd(0x0f);	// display on and cursor blink on
}

void Lcd4_Write_Char(char a)
{
   char temp,y;
   temp = a&0x0F;
   y = a&0xF0;
   LCD4_RS = 1;             // => RS = 1
   Lcd4_Port(y>>4);             //Data transfer
   LCD4_EN = 1;
   __delay_us(40);
   LCD4_EN = 0;
   Lcd4_Port(temp);
   LCD4_EN = 1;
   __delay_us(40);
   LCD4_EN = 0;
}

void Lcd4_Write_String(unsigned char com_1,unsigned char com, char *a)
{
	Lcd4_Set_Cursor(com_1, com);
	int i;
	for(i=0;a[i]!='\0';i++) 
	   Lcd4_Write_Char(a[i]);
}

void Lcd4_Decimal2(unsigned char com_1,unsigned char com,unsigned int val) //
{
	val = val%1000;
	Lcd4_Set_Cursor(com_1, com);
    Lcd4_Write_Char((val/10) + 48);
	Lcd4_Set_Cursor(com_1, com+1);
    Lcd4_Write_Char((val%10) + 48);
}

void Lcd4_Decimal3(unsigned char com_1,unsigned char com,unsigned int val) //
{
	unsigned int Lcd_thr,Lcd_h,Lcd_hr,Lcd_t,Lcd_o;

	val = val%1000;

    Lcd_h=val/100;  //1st digit
	Lcd_hr=val%100;
	
    Lcd_t=Lcd_hr/10;    // 2nd digit
	
    Lcd_o=Lcd_hr%10;    //3rd digit

    Lcd4_Set_Cursor(com_1, com);
	Lcd4_Write_Char(Lcd_h + 48);
	Lcd4_Set_Cursor(com_1, com+1);
    Lcd4_Write_Char(Lcd_t + 48);
	Lcd4_Set_Cursor(com_1, com+2);
    Lcd4_Write_Char(Lcd_o + 48);
}

void Lcd4_Decimal4(unsigned char com_1,unsigned char com,unsigned int val) //
{
	unsigned int Lcd_th,Lcd_thr,Lcd_h,Lcd_hr,Lcd_t,Lcd_o;

	val = val%100000;
    
	Lcd_th=val/1000;   //1st digit
	Lcd_thr=val%1000;
	
    Lcd_h=Lcd_thr/100;  //2nd digit
	Lcd_hr=Lcd_thr%100;
	
    Lcd_t=Lcd_hr/10;    // 3rd digit
	
    Lcd_o=Lcd_hr%10;    //4th digit

 
    Lcd4_Set_Cursor(com_1, com);
	Lcd4_Write_Char(Lcd_th + 48);
    Lcd4_Set_Cursor(com_1, com+1);
	Lcd4_Write_Char(Lcd_h + 48);
	Lcd4_Set_Cursor(com_1, com+2);
    Lcd4_Write_Char(Lcd_t + 48);
	Lcd4_Set_Cursor(com_1, com+3);
    Lcd4_Write_Char(Lcd_o + 48);
}

void Lcd4_Decimal5(unsigned char com_1,unsigned char com,unsigned int val) //
{
	unsigned int Lcd_t5h, Lcd_t5hr, Lcd_th,Lcd_thr,Lcd_h,Lcd_hr,Lcd_t,Lcd_o;

	val = val%100000;
 
    Lcd_t5h=val/10000;    //1st digit
	Lcd_t5hr=val%10000;
    
	Lcd_th=Lcd_t5hr/1000;   //2nd digit
	Lcd_thr=Lcd_t5hr%1000;
	
    Lcd_h=Lcd_thr/100;  //3rd digit
	Lcd_hr=Lcd_thr%100;
	
    Lcd_t=Lcd_hr/10;    // 4th digit
	
    Lcd_o=Lcd_hr%10;    //5th digit

    
    Lcd4_Set_Cursor(com_1, com);
	Lcd4_Write_Char(Lcd_t5h + 48);
    
    Lcd4_Set_Cursor(com_1, com+1);
	Lcd4_Write_Char(Lcd_th + 48);
    Lcd4_Set_Cursor(com_1, com+2);
	Lcd4_Write_Char(Lcd_h + 48);
	Lcd4_Set_Cursor(com_1, com+3);
    Lcd4_Write_Char(Lcd_t + 48);
	Lcd4_Set_Cursor(com_1, com+4);
    Lcd4_Write_Char(Lcd_o + 48);
}

void Lcd4_Decimal6(unsigned char com_1,unsigned char com,unsigned int val) //
{
	unsigned int Lcd_t6h, Lcd_t6hr, Lcd_t5h, Lcd_t5hr, Lcd_th,Lcd_thr,Lcd_h,Lcd_hr,Lcd_t,Lcd_o;

	val = val%1000000;
    
    Lcd_t6h=val/100000;     //1st digit
	Lcd_t6hr=val%100000;
    
    Lcd_t5h=Lcd_t6hr/10000; //2nd digit
	Lcd_t5hr=Lcd_t6hr%10000;
    
	Lcd_th=Lcd_t5hr/1000;   //3r digit
	Lcd_thr=Lcd_t5hr%1000;
	
    Lcd_h=Lcd_thr/100;  //4th digit
	Lcd_hr=Lcd_thr%100;
	
    Lcd_t=Lcd_hr/10;    //5th digit
	
    Lcd_o=Lcd_hr%10;    //6th digit

    Lcd4_Set_Cursor(com_1, com);
	Lcd4_Write_Char(Lcd_t6h + 48);
    
    Lcd4_Set_Cursor(com_1, com+1);
	Lcd4_Write_Char(Lcd_t5h + 48);
    
    Lcd4_Set_Cursor(com_1, com+2);
	Lcd4_Write_Char(Lcd_th + 48);
    Lcd4_Set_Cursor(com_1, com+3);
	Lcd4_Write_Char(Lcd_h + 48);
	Lcd4_Set_Cursor(com_1, com+4);
    Lcd4_Write_Char(Lcd_t + 48);
	Lcd4_Set_Cursor(com_1, com+5);
    Lcd4_Write_Char(Lcd_o + 48);
}
