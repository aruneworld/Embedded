// http://esp8266iot.blogspot.in/
// http://aruneworld.blogspot.com/
// Tested By 	: Arun(20170227)
// Example Name : AEW_Blink_LED.lua

// Program to blink an LED at Port pin P1.0 (physical pin 1 of IC)

#include<reg52.h>  // special function register declarations for 89s52                

#include<stdio.h>  // prototype declarations for I/O functions

sbit LED = P1^1;    // defining pin P1^0 as LED

void delay(void) ;  //delay function prototype declaration

void main (void)
   
{
    LED = 0 ;              // Make LED pin as Output
    while(1)                //indefinite loop
    {
       LED = 0;           // LED Off
       delay();
       LED = 1;          // LED ON 
       delay();
    }
}

void delay(void)
{
    int j;
    int i;
    for(i=0;i<10;i++)
    {
        for(j=0;j<10000;j++)
        {
        }
    }
}