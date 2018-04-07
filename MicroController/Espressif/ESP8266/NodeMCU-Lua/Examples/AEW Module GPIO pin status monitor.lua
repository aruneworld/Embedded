--www.aruneworld.com/embedded/esp8266/esp8266-nodecmu

button_pin=3 --GPIO-0
gpio.mode(button_pin, gpio.INPUT)

while true do
	print("GPIO Read PIN Status : "..gpio.read(button_pin))
	tmr.delay(1000000)
 end 
