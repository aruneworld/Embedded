/*
	http://esp8266iot.blogspot.in/
	http://aruneworld.blogspot.com/
	Tested By 	: Arun(20170219)
	Example Name : AEW_ESP32_HelloWorld_UARTSerialCommunication.ino
*/

void setup() {
 Serial.begin(115200); // You can Change the Baudrate 
}
 
void loop() {
 Serial.println("ArunEworld");
 Serial.println("ESP32 Tutorials : Hello World");
 Serial.println("[********************************]");
 delay(2000); //2 sec delay
 
}
