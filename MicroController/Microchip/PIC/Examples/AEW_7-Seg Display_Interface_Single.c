/*
 * File:   AEW_7-Seg Display_Interface_Single.c
 * Author: Arun
 * http://aruneworld.blogspot.com
 * Created on 27 April, 2017, 1:17 PM
 */

#include <xc.h>

// BEGIN CONFIG
#pragma config FOSC = HS // Oscillator Selection bits (HS oscillator)
#pragma config WDTE = ON // Watchdog Timer Enable bit (WDT enabled)
#pragma config PWRTE = OFF // Power-up Timer Enable bit (PWRT disabled)
#pragma config BOREN = ON // Brown-out Reset Enable bit (BOR enabled)
#pragma config LVP = OFF // Low-Voltage (Single-Supply) In-Circuit Serial Programming Enable bit (RB3 is digital I/O, HV on MCLR must be used for programming)
#pragma config CPD = OFF // Data EEPROM Memory Code Protection bit (Data EEPROM code protection off)
#pragma config WRT = OFF // Flash Program Memory Write Enable bits (Write protection off; all program memory may be written to by EECON control)
#pragma config CP = OFF // Flash Program Memory Code Protection bit (Code protection off)
//END CONFIG

void delay();
void main(void) {
    unsigned char i,j,ar[]={0xC0,0xF9,0xA4,0xB0,0x99,0x92,0x82,0xF8,0x80,0x90};
    TRISB=TRISC=0x00;
    do
    {
        for(i=0;i<10;i++)
        {
            PORTC=ar[i]; // for tens
            for(j=0;j<10;j++)
            {
                PORTB=ar[j];    // for ones
                delay();
            }
        }
    }
    while (1);
 return;
}

void delay() //delay routine
{
    unsigned char i,j;
    for(i=0;i<255;i++)
    for(j=0;j<50;j++);
}
