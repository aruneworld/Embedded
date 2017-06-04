#ifndef PIC16F877A_UART_h

#define PIC16F877A_UART_h

	void UART_Init(unsigned long int);
	void UART_Send_Character(unsigned char);
	void UART_Send_String(const unsigned char *,unsigned char);
	void UART_Baudrate(unsigned long int);
	void UART_Receive(unsigned char);

#endif