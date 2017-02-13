--http://nodemcu.readthedocs.io/en/master/en/modules/gpio/

--[[
http://esp8266iot.blogspot.in/
http://aruneworld.blogspot.com/
https://github.com/adalurarun/Embedded_System/MicroController/Espressif/ESP8266
Copyright Arun 2016-2017
MIT License

If you like this project, please add a star!
]]--

	-----------------------------------------------------------------------------------------------------------------------------------
	------------------------------------------------	GPIO Module	---------------------------------------------------------------------
	-----------------------------------------------------------------------------------------------------------------------------------
local GPIO = ...			-- Obtain a sample value from somewhere
local GPIO_Module =  {}	-- conGPIO an empty table and assign it to variable "Table_name" (ex: local Arun =  {})
_G[GPIO] = GPIO_Module	--	A global variable (not a function) that holds the global environment

--[[	This module provides access to the GPIO (General Purpose Input/Output) subsystem.
		All access is based on the I/O index number on the NodeMCU dev kits, not the internal GPIO pin. For example, the D0 pin on the dev kit is mapped to the internal GPIO pin 16.
		If not using a NodeMCU dev kit, please refer to the below GPIO pin maps for the index?gpio mapping.	
		
		IO index 		0*		1		2		3		4		5		6		7		8		9		10		11		12
		ESP8266 pin		GPIO16	GPIO5	GPIO4	GPIO0	GPIO2	GPIO14	GPIO12	GPIO13	GPIO15	GPIO3	GPIO1	GPIO9	GPIO10
		[*] D0(GPIO16) can only be used as gpio read/write. No support for open-drain/interrupt/pwm/i2c/ow. 
		
		gpio.mode()		Initialize pin to GPIO mode, set the pin in/out direction, and optional internal weak pull-up.
		gpio.read()		Read digital GPIO pin value.
		gpio.serout()	Serialize output based on a sequence of delay-times in 탎.
		gpio.trig()		Establish or clear a callback function to run on interrupt for a pin.
		gpio.write()	Set digital GPIO pin value.
]]--

function GPIO_Module.mode(pin, mode [, pullup])
--[[		gpio.mode()		-	Initialize pin to GPIO mode, set the pin in/out direction, and optional internal weak pull-up.
	Syntax		:	gpio.mode(pin, mode [, pullup])
	Parameters	:	pin 	-	pin to configure, IO index
					mode 	-	one of gpio.OUTPUT, gpio.OPENDRAIN, gpio.INPUT, or gpio.INT (interrupt mode)
					pullup 	-	gpio.PULLUP enables the weak pull-up resistor; default is gpio.FLOAT
	Returns		:	nil
	Example		:	gpio.mode(0, gpio.OUTPUT)
]]--
	gpio.mode(pin, mode)			--gpio.mode(pin, mode [, pullup])		|pin 1-12, Note that pin 0 does not support | gpio.OUTPUT, gpio.OPENDRAIN, gpio.INPUT, gpio.INT (interrupt mode) | gpio.PULLUP enables the weak pull-up resistor; default is gpio.FLOAT
end

function GPIO_Module.read(pin)
--[[	gpio.read()		-	Read digital GPIO pin value.
		Syntax		:	gpio.read(pin)
		Parameters	:	pin pin to read, IO index
		Returns		:	a number, 0 = low, 1 = high
		Example		:	gpio.read(0)	-- read value of gpio 0.
		See also	:	gpio.mode()
]]--
gpio.read(pin)	-- read value of gpio 0.
end

function GPIO_Module.serout(pin, start_level, delay_times (, repeat_num(, callback)))
--[[	gpio.serout()	-	Serialize output based on a sequence of delay-times in 탎. After each delay, the pin is toggled. After the last repeat and last delay the pin is not toggled.

			The function works in two modes: synchronous - for sub-50 탎 resolution, restricted to max. overall duration, asynchrounous - synchronous operation with less granularity but virtually unrestricted duration.

			Whether the asynchronous mode is chosen is defined by presence of the callback parameter. If present and is of function type the function goes asynchronous the callback function is invoked when sequence finishes. If the parameter is numeric the function still goes asynchronous but no callback is invoked when done.

			For asynchronous version minimum delay time should not be shorter than 50 탎 and maximum delay time is 0x7fffff 탎 (~8.3 seconds). In this mode the function does not block the stack and returns immediately before the output sequence is finalized. HW timer inf FRC1_SOURCE mode is used to change the states.

			Note that the synchronous variant (no or nil callback parameter) function blocks the stach and as such any use of it must adhere to the SDK guidelines (also explained here). Failure to do so may lead to WiFi issues or outright to crashes/reboots. Shortly it means that sum of all delay times multiplied by the number of repeats should not exceed 15 ms.
			Syntax		:	gpio.serout(pin, start_level, delay_times (, repeat_num(, callback)))
			Parameters	:	pin pin to use, IO index
							start_level level to start on, either gpio.HIGH or gpio.LOW
							delay_times an array of delay times in 탎 between each toggle of the gpio pin.
							repeat_num an optional number of times to run through the sequence.
							callback an optional callback function or number, if present the function ruturns immediately and goes asynchronous.

			Returns		:	nil
			Example		:	gpio.mode(1,gpio.OUTPUT,gpio.PULLUP)
							gpio.serout(1,1,{30,30,60,60,30,30})  -- serial one byte, b10110010
							gpio.serout(1,1,{30,70},8)  -- serial 30% pwm 10k, lasts 8 cycles
							gpio.serout(1,1,{3,7},8)  -- serial 30% pwm 100k, lasts 8 cycles
							gpio.serout(1,1,{0,0},8)  -- serial 50% pwm as fast as possible, lasts 8 cycles
							gpio.serout(1,0,{20,10,10,20,10,10,10,100}) -- sim uart one byte 0x5A at about 100kbps
							gpio.serout(1,1,{8,18},8) -- serial 30% pwm 38k, lasts 8 cycles

							gpio.serout(1,1,{5000,995000},100, function() print("done") end) -- asynchronous 100 flashes 5 ms long every second with a callback function when done
							gpio.serout(1,1,{5000,995000},100, 1) -- asynchronous 100 flashes 5 ms long, no callback
]]--
gpio.mode(1,gpio.OUTPUT,gpio.PULLUP)
gpio.serout(1,1,{30,30,60,60,30,30})  -- serial one byte, b10110010
gpio.serout(1,1,{30,70},8)  -- serial 30% pwm 10k, lasts 8 cycles
gpio.serout(1,1,{3,7},8)  -- serial 30% pwm 100k, lasts 8 cycles
gpio.serout(1,1,{0,0},8)  -- serial 50% pwm as fast as possible, lasts 8 cycles
gpio.serout(1,0,{20,10,10,20,10,10,10,100}) -- sim uart one byte 0x5A at about 100kbps
gpio.serout(1,1,{8,18},8) -- serial 30% pwm 38k, lasts 8 cycles

gpio.serout(1,1,{5000,995000},100, function() print("done") end) -- asynchronous 100 flashes 5 ms long every second with a callback function when done
gpio.serout(1,1,{5000,995000},100, 1) -- asynchronous 100 flashes 5 ms long, no callback
end

function GPIO_Module.trig(pin, (type (, callback_function)))
--[[	gpio.trig()		-	Establish or clear a callback function to run on interrupt for a pin.

		This function is not available if GPIO_INTERRUPT_ENABLE was undefined at compile time.
		Syntax		:	gpio.trig(pin, (type (, callback_function)))
		Parameters	:	pin 1-12, pin to trigger on, IO index. Note that pin 0 does not support interrupts.
						type "up", "down", "both", "low", "high", which represent rising edge, falling edge, both edges, low level, and high level trigger modes respectivey. If the type is "none" or omitted then the callback function is removed and the interrupt is disabled.
						callback_function(level) callback function when trigger occurs. The level of the specified pin at the interrupt passed as the parameter to the callback. The previous callback function will be used if the function is omitted.
		Returns		:	nil
		Example		:	do
						  -- use pin 1 as the input pulse width counter
						  local pin, pulse1, du, now, trig = 1, 0, 0, tmr.now, gpio.trig
						  gpio.mode(pin,gpio.INT)
						  local function pin1cb(level)
							local pulse2 = now()
							print( level, pulse2 - pulse1 )
							pulse1 = pulse2
							trig(pin, level == gpio.HIGH  and "down" or "up")
						  end
						  trig(pin, "down", pin1cb)
						end
		See also	:	gpio.mode()
	
]]--
end

function GPIO_Module.write(pin, level)

--[[	gpio.write()	-	Set digital GPIO pin value.
			Syntax		:	gpio.write(pin, level)
			Parameters	:	pin pin to write, IO index
							level gpio.HIGH or gpio.LOW
			Returns		:	nil
			Example		:	pin=1			-- set pin index 1 to GPIO mode, and set the pin to high.
							gpio.mode(pin, gpio.OUTPUT)
							gpio.write(pin, gpio.HIGH)
			See also	:	gpio.mode()
							gpio.read()
]]--
pin=1			-- set pin index 1 to GPIO mode, and set the pin to high.
gpio.mode(pin, gpio.OUTPUT)
gpio.write(pin, gpio.HIGH)

end

return GPIO_Module