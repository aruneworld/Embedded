-- http://nodemcu.readthedocs.io/en/master/en/modules/
--[[
http://esp8266iot.blogspot.in/
http://aruneworld.blogspot.com/
https://github.com/adalurarun/Embedded_System/MicroController/Espressif/ESP8266
Copyright Arun 2016-2017
MIT License

If you like this project, please add a star!
]]--

	-----------------------------------------------------------------------------------------------------------------------------------
	------------------------------------------                  ADXL345 Module ------------------------------------------------------------
	-----------------------------------------------------------------------------------------------------------------------------------
local ADXL345 = ...			-- Obtain a sample value from somewhere
local ADXL345_Module =  {}	-- construct an empty table and assign it to variable "Table_name" (ex: local Arun =  {})
_G[ADXL345] = ADXL345_Module	--	A global variable (not a function) that holds the global environment 

--[[	This module provides access to the ADXL345 triple axis accelerometer.
		adxl345.read()	Samples the sensor and returns X,Y and Z data from the accelerometer.
		adxl345.init()	Initializes the module and sets the pin configuration.
		
]]--

function ADXL345_Module.read()
--[[	adxl345.read()	-	Samples the sensor and returns X,Y and Z data from the accelerometer.
		Syntax	:	adxl345.read()
		Returns	:	X,Y,Z data (integers)
		Example	:	adxl345.init(1, 2)
					local x,y,z = adxl345.read()
					print(string.format("X = %d, Y = %d, Z = %d", x, y, z))
]]--
	return adxl345.read()
end

function ADXL345_Module.init()		
--[[	adxl345.init()	-	Initializes the module and sets the pin configuration.
		Syntax		:	adxl345.init(sda, scl)
		Parameters	:	sda data pin
						scl clock pin
		Returns		:	nil
]]--
	adxl345.init(sda, scl)
end

return ADXL345_Module