/*
 * File:   AEW_LED-Blink.c
 * Author: Arun
 * http://aruneworld.blogspot.com/
 * Created on 26 April, 2017, 3:28 PM
 */

#include <xc.h>
#define _XTAL_FREQ 8000000

void main(void) {
    TRISB0 = 0; //RB0 as Output PIN
  while(1)
  {
    RB0 = 1;  // LED ON
    __delay_ms(1000); // 1 Second Delay
    RB0 = 0;  // LED OFF
    __delay_ms(1000); // 1 Second Delay
  } 
    return;
}
