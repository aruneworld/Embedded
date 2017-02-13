--http://nodemcu.readthedocs.io/en/master/en/modules/apa102/
--[[
http://esp8266iot.blogspot.in/
http://aruneworld.blogspot.com/
https://github.com/adalurarun/Embedded_System/MicroController/Espressif/ESP8266
Copyright Arun 2016-2017
MIT License

If you like this project, please add a star!
]]--
	-----------------------------------------------------------------------------------------------------------------------------------
	------------------------------------------                  APA102 Module ------------------------------------------------------------
	-----------------------------------------------------------------------------------------------------------------------------------
local APA102 = ...			-- Obtain a sample value from somewhere
local APA102_Module =  {}	-- construct an empty table and assign it to variable "Table_name" (ex: local Arun =  {})
_G[APA102] = APA102_Module	--	A global variable (not a function) that holds the global environment 

--[[		APA102 Module
			Since 	Origin / Contributor 	Maintainer 	Source
			2016-01-26 	Robert Foss 	Robert Foss 	apa102.c

	This module provides Lua access to APA102 RGB LEDs which are similar in function to the common WS2812 addressable LEDs.

    DotStar LEDs are 5050-sized LEDs with an embedded micro controller inside the LED. You can set the color/brightness of each LED to 24-APA102 color (8 APA102s each red green and blue). Each LED acts like a shift register, reading incoming color data on the input pins, and then shifting the previous color data out on the output pin. By sending a long string of data, you can control an infinite number of LEDs, just tack on more or cut off unwanted LEDs at the end.

	source: Adafruit
	apa102.write()	Send ABGR data in 8 APA102s to a APA102 chain.


]]--

function APA102_Module.write(data_pin, clock_pin, string)
--[[		apa102.write()	-	Send ABGR data in 8 APA102s to a APA102 chain.
	Syntax		-	apa102.write(data_pin, clock_pin, string)
	Parameters	-	data_pin any GPIO pin 0, 1, 2, ...
					clock_pin any GPIO pin 0, 1, 2, ...
					string payload to be sent to one or more APA102 LEDs. It should be composed from a ABGR quadruplet per element.
						A1 the first pixel's Intensity channel (0-31)
						B1 the first pixel's Blue channel (0-255)
						G1 the first pixel's Green channel (0-255)
						R1 the first pixel's Red channel (0-255) ... You can connect a lot of APA102 ...
						A2, B2, G2, R2 are the next APA102s Intensity, Blue, Green and Red channel parameters
	Returns		-	nil
--	Example	
			a = 31
			b = 0
			g = 0
			r = 255
			led_abgr = string.char(a, b, g, r, a, b, g, r) 
			apa102.write(2, 3, leds_abgr) -- turn two APA102s to red, connected to data_pin 2 and cl
]]--
end

return APA102_Module
