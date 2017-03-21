// Wave drive Mode
#include<reg51.h>
void msdelay(unsigned int time)
    {
        unsigned i,j ;
        for(i=0;i<time;i++)    
        for(j=0;j<1275;j++);
    }

void main()
{
    while(1)
    {
        P2=0x01;            // 0001 P2_0=1,P2_1=0,P2_2=0,P2_3=0
        msdelay(1);
        P2=0x02;           //0010
        msdelay(1);
        P2=0x04;           //0100
        msdelay(1);
        P2=0x08;           //1000
        msdelay(1);
    }
}

/*
// Full drive Mode
#include<reg51.h>
void msdelay(unsigned int time)
    {
    unsigned i,j ;
    for(i=0;i<time;i++)    
    for(j=0;j<1275;j++);
    }

void main()
{
    while(1)
    {
         P2 = 0x03;     //0011     P2_0=1,P2_1=1,P2_2=0,P2_3=0
        msdelay(1);
        P2 = 0x06;         //0110
        msdelay(1);
        P2 = 0x0C;         //1100
        msdelay(1);
        P2 = 0x09;         //1001
        msdelay(1);
    }
}

*/
