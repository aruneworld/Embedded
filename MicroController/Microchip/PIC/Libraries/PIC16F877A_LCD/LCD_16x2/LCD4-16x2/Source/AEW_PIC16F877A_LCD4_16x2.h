//LCD Functions Developed by Arun	
	
#ifndef AEW_PIC16F877A_LCD4_16x2_h

	#define AEW_PIC16F877A_LCD4_16x2_h

	void Lcd4_Port(char a);
	void Lcd4_Cmd(char a);
	void Lcd4_Set_Cursor(unsigned int a, unsigned int b);
	void Lcd4_Clear();
	void Lcd4_Blink_Cursor_ON();
	void Lcd4_Init();
	void Lcd4_Write_Char(char a);
	void Lcd4_Write_String(unsigned char com_1,unsigned char com, char *a);
	void Lcd4_Decimal2(unsigned char com_1,unsigned char com,unsigned int val);
	void Lcd4_Decimal3(unsigned char com_1,unsigned char com,unsigned int val);
	void Lcd4_Decimal4(unsigned char com_1,unsigned char com,unsigned int val);
	void Lcd4_Decimal5(unsigned char com_1,unsigned char com,unsigned int val);
	void Lcd4_Decimal6(unsigned char com_1,unsigned char com,unsigned int val);

#endif