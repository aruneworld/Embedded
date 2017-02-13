-- http://nodemcu.readthedocs.io/en/master/en/modules/hx711/

--[[
http://esp8266iot.blogspot.in/
http://aruneworld.blogspot.com/
https://github.com/adalurarun/Embedded_System/MicroController/Espressif/ESP8266
Copyright Arun 2016-2017
MIT License

If you like this project, please add a star!
]]--

	-----------------------------------------------------------------------------------------------------------------------------------
	-----------------------------------------------	HX711 Module	-------------------------------------------------------------------
	-----------------------------------------------------------------------------------------------------------------------------------
local HX711 = ...			-- Obtain a sample value from somewhere
local HX711_Module =  {}	-- conHX711 an empty table and assign it to variable "Table_name" (ex: local Arun =  {})
_G[HX711] = HX711_Module	--	A global variable (not a function) that holds the global environment

--[[	HX711 Module
	Since 	Origin / Contributor 	Maintainer 	Source
	2015-10-09 	Chris Takahashi 	Chris Takahashi 	hx711.c

	This module provides access to an HX711 load cell amplifier/ADC. The HX711 is an inexpensive 24bit ADC with programmable 128x, 64x, and 32x gain. Currently only channel A at 128x gain is supported.

	Note: To save ROM image space, this module is not compiled into the firmware by default.
	hx711.init()	Initialize io pins for hx711 clock and data.
	hx711.read()	Read digital loadcell ADC value.

]]--

function HX711_Module
--[[	hx711.init()	-	Initialize io pins for hx711 clock and data.
		Syntax		-	hx711.init(clk, data)
		Parameters	-	clk pin the hx711 clock signal is connected to
						data pin the hx711 data signal is connected to
		Returns		-	nil
		Example	
		-- Initialize the hx711 with clk on pin 5 and data on pin 6
		hx711.init(5,6)
]]--
end

function HX711_Module
--[[	hx711.read()	-	Read digital loadcell ADC value.
	Syntax		-	hx711.read(mode)
	Parameters	-	mode ADC mode. This parameter is currently ignored and reserved to ensure backward compatability if support for additional modes is added. Currently only channel A @ 128 gain is supported.
					mode 	channel 	gain
					0 	A 	128
	Returns		-	number (24 bit signed ADC value extended to the machine int size)
--	Example	
	-- Read ch A with 128 gain.
	raw_data = hx711.read(0)
]]--
end

return HX711_Module