#include "PIC16F877A_ADC.h"

//ADC 8 bit 
Adc8_Cha(unsigned char val)
{
	ADFM=0;
	adc_del=25;

	if(val==0)
	{
		adc_temp0=0;
		for(adc_j=0;adc_j<10;adc_j++)
		{
			ADCON0=0x00;
		    ADON=1;
		    while(adc_del--);
		    ADCON0 =0x05;                
			while(ADCON0!=0X01);
		    adc_temp=ADRESH;
			adc_temp0=adc_temp0+adc_temp;	
		}
	}
	else if(val==1)
	{
		adc_temp0=0;
		for(adc_j=0;adc_j<10;adc_j++)
		{
			ADCON0=0x08;
		    ADON=1;
		    while(adc_del--);
		    ADCON0 =0x0d;                
			while(ADCON0!=0X09);
		    adc_temp=ADRESH;
			adc_temp0=adc_temp0+adc_temp;	
		}
	}
	else if(val==2)
	{
		adc_temp0=0;
		for(adc_j=0;adc_j<10;adc_j++)
		{
			ADCON0=0x10;
		    ADON=1;
		    while(adc_del--);
		    ADCON0 =0x15;               
			while(ADCON0!=0x11);
		    adc_temp=ADRESH;
			adc_temp0=adc_temp0+adc_temp;	
		}
	}
	else if(val==3)
	{
		adc_temp0=0;
		for(adc_j=0;adc_j<10;adc_j++)
		{
			ADCON0=0x18;
		    ADON=1;
		    while(adc_del--);
		    ADCON0 =0x1d;               
			while(ADCON0!=0x19);
		    adc_temp=ADRESH;
			adc_temp0=adc_temp0+adc_temp;	
		}
	}
	else if(val==4)
	{
		adc_temp0=0;
		for(adc_j=0;adc_j<10;adc_j++)
		{
			ADCON0=0x20;
		    ADON=1;
		    while(adc_del--);
		    ADCON0 =0x25;               
			while(ADCON0!=0x21);
		    adc_temp=ADRESH;
			adc_temp0=adc_temp0+adc_temp;	
		}
	}
	else if(val==5)
	{
		adc_temp0=0;
		for(adc_j=0;adc_j<10;adc_j++)
		{
			ADCON0=0x28;
		    ADON=1;
		    while(adc_del--);
		    ADCON0 =0x2d;                
			while(ADCON0!=0x29);
		    adc_temp=ADRESH;
			adc_temp0=adc_temp0+adc_temp;	
		}
	}
	else if(val==6)
	{
		adc_temp0=0;
		for(adc_j=0;adc_j<10;adc_j++)
		{
			ADCON0=0x30;
		    ADON=1;
		    while(adc_del--);
		    ADCON0 =0x35;               
			while(ADCON0!=0x31);
		    adc_temp=ADRESH;
			adc_temp0=adc_temp0+adc_temp;	
		}
	}
	else if(val==7)
	{
		adc_temp0=0;
		for(adc_j=0;adc_j<10;adc_j++)
		{
			ADCON0=0x38;
		    ADON=1;
		    while(adc_del--);
		    ADCON0 =0x3d;                
			while(ADCON0!=0x39);
		    adc_temp=ADRESH;
			adc_temp0=adc_temp0+adc_temp;	
		}
	}
	adc_val=adc_temp0/10;
	return adc_val;
}	//ADC 8 bit end

//ADC 10 bit resolution 
Adc10_Cha(unsigned char val)
{
	ADFM=1;
	adc_del=25;

	if(val==0)
	{
		adc_temp0=0;
		for(adc_j=0;adc_j<10;adc_j++)
		{
			ADCON0=0x00;
		    ADON=1;
		    while(adc_del--);
		    ADCON0 =0x05;                
			while(ADCON0!=0X01);
		    adc_hbit=ADRESH;
		    adc_lbit=ADRESL;
			adc_temp = adc_lbit + (256*adc_hbit);
			adc_temp0=adc_temp0+adc_temp;
		}
	}
	else if(val==1)
	{
		adc_temp0=0;
		for(adc_j=0;adc_j<10;adc_j++)
		{
			ADCON0=0x08;
		    ADON=1;
		    while(adc_del--);
		    ADCON0 =0x0d;                
			while(ADCON0!=0X09);
		    adc_hbit=ADRESH;
		    adc_lbit=ADRESL;
			adc_temp = adc_lbit + (256*adc_hbit);
			adc_temp0=adc_temp0+adc_temp;	
		}
	}
	else if(val==2)
	{
		adc_temp0=0;
		for(adc_j=0;adc_j<10;adc_j++)
		{
			ADCON0=0x10;
		    ADON=1;
		    while(adc_del--);
		    ADCON0 =0x15;               
			while(ADCON0!=0x11);
		    adc_hbit=ADRESH;
		    adc_lbit=ADRESL;
			adc_temp = adc_lbit + (256*adc_hbit);
			adc_temp0=adc_temp0+adc_temp;	
		}
	}
	else if(val==3)
	{
		adc_temp0=0;
		for(adc_j=0;adc_j<10;adc_j++)
		{
			ADCON0=0x18;
		    ADON=1;
		    while(adc_del--);
		    ADCON0 =0x1d;               
			while(ADCON0!=0x19);
		    adc_hbit=ADRESH;
		    adc_lbit=ADRESL;
			adc_temp = adc_lbit + (256*adc_hbit);
			adc_temp0=adc_temp0+adc_temp;	
		}
	}
	else if(val==4)
	{
		adc_temp0=0;
		for(adc_j=0;adc_j<10;adc_j++)
		{
			ADCON0=0x20;
		    ADON=1;
		    while(adc_del--);
		    ADCON0 =0x25;               
			while(ADCON0!=0x21);
		    adc_hbit=ADRESH;
		    adc_lbit=ADRESL;
			adc_temp = adc_lbit + (256*adc_hbit);
			adc_temp0=adc_temp0+adc_temp;	
		}
	}
	else if(val==5)
	{
		adc_temp0=0;
		for(adc_j=0;adc_j<10;adc_j++)
		{
			ADCON0=0x28;
		    ADON=1;
		    while(adc_del--);
		    ADCON0 =0x2d;                
			while(ADCON0!=0x29);
		    adc_hbit=ADRESH;
		    adc_lbit=ADRESL;
			adc_temp = adc_lbit + (256*adc_hbit);
			adc_temp0=adc_temp0+adc_temp;	
		}
	}
	else if(val==6)
	{
		adc_temp0=0;
		for(adc_j=0;adc_j<10;adc_j++)
		{
			ADCON0=0x30;
		    ADON=1;
		    while(adc_del--);
		    ADCON0 =0x35;               
			while(ADCON0!=0x31);
		    adc_hbit=ADRESH;
		    adc_lbit=ADRESL;
			adc_temp = adc_lbit + (256*adc_hbit);
			adc_temp0=adc_temp0+adc_temp;	
		}
	}
	else if(val==7)
	{
		adc_temp0=0;
		for(adc_j=0;adc_j<10;adc_j++)
		{
			ADCON0=0x38;
		    ADON=1;
		    while(adc_del--);
		    ADCON0 =0x3d;                
			while(ADCON0!=0x39);
		    adc_hbit=ADRESH;
		    adc_lbit=ADRESL;
			adc_temp = adc_lbit + (256*adc_hbit);
			adc_temp0=adc_temp0+adc_temp;	
		}
	}

	adc_val1=adc_temp0/10;
	return adc_val1;
}