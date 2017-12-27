//www.ArunEworld.com

#define uart_ch1 0
#define uart_ch2 2

sbit tx = P2^0;
sbit rx = P2^1;

void delay()
{
	int i;
	for(i=6;i;i--);
	_nop_();
	_nop_();
}

void delay_ms(int i)
{
	int j;
	for(; i ;i--)
	for(j=122;j;j--);
}

void tx_data(char data_ , char val)
{
	char i;
	P2 |= 0x03;
	tx = 0; // send start bit
	P2 &= ~(1<<val);
	delay();

	for(i = 0;i < 8 ; i++)
	{
		if(((data_>>i)&(0x01)) == 0x01)		{	P2 |=(1 << val);	}
		else	{	P2 &= ~(1<<val);	}
		delay();
	}

	P2 |= (1 << val);
	delay();

	// delay_ms(1);
}

void init_uart()
{
	tx = 1;
}

void str(char *ch , char uart0_tx)
{
	while(*ch)
	{
		tx_data(*ch++ , uart0_tx);
	}
}

void init()
{
	SCON=0x50;
	TMOD=0x20;
	TH1=TL1=253;
	TR1=1;
}

void tx1(char ch)
{
	SBUF = ch;
	while(!TI);
	TI=0;
}
void str1(char *ch)
{
	while(*ch)
	{
		tx1(*ch++);
	}
}

void main()
{
	init_uart(); 
	init();
	while(1)
	{
		str(".........P2^0 IO PIN UART....\n\r", uart_ch1);
		str(".........P2^1 IO PIN UART.....\n\r", uart_ch2);
		str1(".........INBUILT UART ....\n\r");
		str1("......... ArunEworld ....\n\r");
	}
}
