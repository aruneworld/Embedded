//https://www.hackster.io/brzi/simple-capacitance-meter-2b8bdf?utm_source=hackster&utm_medium=email&utm_campaign=new_projects
#define analogPin      A1 //Our pin for measuring
#define chargePin      3 //Pin for charging the cap
#define dischargePin   7 //Pin for discharging the cap
#define button 5 //Our button read pin
#define resistorValue  220.0F //Our charge resistor value. The f is there to tell the compiler it's a float

unsigned long startTime; //Used for
unsigned long elapsedTime; //measuring cap charge time
float microFarads; //Here we store the meausred value
float nanoFarads; //If it's small we convert it to nF
void setup(){
  pinMode(chargePin, OUTPUT);/*
  This sets the internal impendence of the chargePin to low. What this means
  is that the current will come to less resistance when passing trough the
  pin, wich will enable us to source(charge the cap) or sink(discharge the 
  cap) with current up to 40mA. If we set the pinMode to input, we enable
  high impendence mode and the current will be bearly able to pass trough 
  the pin, we use it to "open" the ciruit (alltough the current will still
  flow trough the pins, the equivalent wouldnt be an open circut, reather
  a very big value resistor).
  */
  digitalWrite(chargePin, LOW); //In LOW state it doesnt discharge the cap
  pinMode(button, INPUT_PULLUP); /*We use INPUT_PULLUP when we have a button connected to the
  pin, but without a external pullup resistor. We must have a either pull-up or pull-down
  resistor to keep the pins from "floating", a state where pins will catch surrounding ele-
  ctromagnetic fields, or get parasitic capactinance from sorrounding pins. MCU's have allready
  built in pull up resostors we only need to connect the switch between the pin and ground.
  */
  Serial.begin(9600); //Start the serial communication
  Serial.println("Arun\n");
}

void loop(){
  if(!digitalRead(button)){ //When we press the button
  digitalWrite(chargePin, HIGH); //This charges the capacitor
  startTime = millis(); //The time when the cap starts to charge
  while( analogRead(analogPin) < 648)
  { Serial.print("analogRead :"); Serial.println(analogRead(analogPin)); } //Do dothing until the cap reached 63% charge
  elapsedTime= millis() - startTime; // Calculate the time needed to charge the cap
  microFarads = ((float)elapsedTime / resistorValue) * 1000; //This is the formula for measuring capactiance
  if (microFarads > 1){ //If the value is in uF
    Serial.print((long)microFarads); //Print the stored value
    Serial.println(" microFarads");
  }
  else{ //If smaller, we convert it to mF
    nanoFarads = microFarads * 1000.0;
    Serial.print((long)nanoFarads);
    Serial.println(" nanoFarads");
  }
  digitalWrite(chargePin, LOW);//We do not charge the cap anymore
  pinMode(dischargePin, OUTPUT); //Now we use 
  digitalWrite(dischargePin, LOW); //this pin for discharging
  while(analogRead(analogPin) > 0); //Do nothing until the cap is discharged
  pinMode(dischargePin, INPUT); //This "blocks" the discharge pin, as it is no longer needed
 delay(150); //Delay so there is enough time to lift the finger from the button
 }
}
