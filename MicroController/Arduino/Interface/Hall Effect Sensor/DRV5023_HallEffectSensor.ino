/*
*	www.ArunEworld.com
*	Hall Sensor state read Arduino sketch.
*	Please connect up the Arduino circuit as in the Hall Sensor product page.
*	Move a magnet toward and away from the sensor, and you will notice the Serial console digital value change.
*	When the demo is running, the Serial console will print the following values:
*	No Magnet = 1
*	With Magnet = 0
*/

const int HallSensorPin =  13;      // the pin number the Hall Sensor is connected to
int HallSensorState = 0;            // variable for reading the Hall Sensor State


// the setup function runs once when you press reset or power the board
void setup() {

  pinMode(HallSensorPin, INPUT);    // initialize digital pin 13 input
  Serial.begin(9600);               // initialize serial communication at 9600 bits per second:
  
}

// loop the function forever
void loop() {
 HallSensorState = digitalRead(HallSensorPin);   // read the value of the hall sensor connected to pin 13.
 Serial.println(HallSensorState);                // print the sensor value which is either 0 or 1.
}