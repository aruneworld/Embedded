// http://esp8266iot.blogspot.in/
// http://aruneworld.blogspot.com/
// Tested By 	: Arun(20170227)
// Example Name : AEW_Blink_LED.lua

// Program to 10Hz_Square Wave generator at Port pin P1.0 (physical pin 1 of IC) using timer

#include <reg51.h>              // special function register declarations for 89s51        
#include<stdio.h>  				// prototype declarations for I/O functions
sbit pin = P1^0;				// decleare a variable type sbit for P1.0 
void main(void)
{
	P1 = 0x00;                 	// clear port
    TMOD = 0x09;                // (0x90->0b00001001) initialize timer 0 as 16 bit timer 
loop:	TL0 = 0xAF;             // load valur 15535 = 3CAFh so after 
    TH0 = 0x3C;                 // 50000 counts timer 0 will be overflow
    pin = 1;                    // send high logic to P1.0
	TR0 = 1;                    // start timer
	while(TF0 == 0)  {}     	// wait for first overflow for 50 ms

	TL0 = 0xAF;                 // again reload count
	TH0 = 0x3C;
	pin = 0;                    // now send 0 to P1.0
	while(TF0 == 0)  {}       	// wait for 50 ms again  
goto loop;                         // continue with the loop  
}