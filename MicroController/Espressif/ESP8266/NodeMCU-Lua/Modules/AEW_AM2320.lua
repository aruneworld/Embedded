--http://nodemcu.readthedocs.io/en/master/en/modules/am2320/

--[[
http://esp8266iot.blogspot.in/
http://aruneworld.blogspot.com/
https://github.com/adalurarun/Embedded_System/MicroController/Espressif/ESP8266
Copyright Arun 2016-2017
MIT License

If you like this project, please add a star!
]]--

	-----------------------------------------------------------------------------------------------------------------------------------
	------------------------------------------                  AM2320 Module ------------------------------------------------------------
	-----------------------------------------------------------------------------------------------------------------------------------
local AM2320 = ...			-- Obtain a sample value from somewhere
local AM2320_Module =  {}	-- construct an empty table and assign it to variable "Table_name" (ex: local Arun =  {})
_G[AM2320] = AM2320_Module	--	A global variable (not a function) that holds the global environment 

--[[	
AM2320 Module
Since 	Origin / Contributor 	Maintainer 	Source
2016-02-14 	Henk Vergonet 	Henk Vergonet 	am2320.c

This module provides access to the AM2320 humidity and temperature sensor, using the i2c interface.
am2320.init()	Initializes the module and sets the pin configuration.
am2320.read()	Samples the sensor and returns the relative humidity in % and temperature in celsius, as an integer multiplied with 10.
]]--

function AM2320_Module.init(sda, scl)
--[[	am2320.init()	-	Initializes the module and sets the pin configuration. Returns model, version, serial but is seams these where all zero on my model.
	Syntax		-	model, version, serial = am2320.init(sda, scl)
	Parameters	-	sda data pin
					scl clock pin
	Returns		-	model 16 bits number of model
					version 8 bits version number
					serial 32 bits serial number
	Note: I have only observed values of 0 for all of these, maybe other sensors return more sensible readings.
]]--
end

function AM2320_Module.read()
--[[	am2320.read()	-	Samples the sensor and returns the relative humidity in % and temperature in celsius, as an integer multiplied with 10.
	Syntax		-	am2320.read()
	Returns		-	relative humidity percentage multiplied with 10 (integer)
					temperature in celcius multiplied with 10 (integer)
--	Example
	am2320.init(1, 2)
	rh, t = am2320.read()
	print(string.format("RH: %s%%", rh / 10))
	print(string.format("Temperature: %s degrees C", t / 10))
]]--
end

return AM2320_Module