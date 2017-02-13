-- http://nodemcu.readthedocs.io/en/master/en/modules/bmp085/

--[[
http://esp8266iot.blogspot.in/
http://aruneworld.blogspot.com/
https://github.com/adalurarun/Embedded_System/MicroController/Espressif/ESP8266
Copyright Arun 2016-2017
MIT License

If you like this project, please add a star!
]]--

	-----------------------------------------------------------------------------------------------------------------------------------
	------------------------------------------                  BMP085 Module ------------------------------------------------------------
	-----------------------------------------------------------------------------------------------------------------------------------
local BMP085 = ...			-- Obtain a sample value from somewhere
local BMP085_Module =  {}	-- construct an empty table and assign it to variable "Table_name" (ex: local Arun =  {})
_G[BMP085] = BMP085_Module	--	A global variable (not a function) that holds the global environment 

function BMP085_Module.init()
--[[	bmp085.init()	-	Initializes the module and sets the pin configuration.
	Syntax		-	bmp085.init(sda, scl)
	Parameters	-	sda data pin
					scl clock pin
	Returns		-	nil
]]--

end

function BMP085_Module
--[[	bmp085.temperature()	-	Samples the sensor and returns the temperature in celsius as an integer multiplied with 10.
	Syntax		-	bmp085.temperature()
	Returns		-	temperature multiplied with 10 (integer)
	Example	
		bmp085.init(1, 2)
		local t = bmp085.temperature()
		print(string.format("Temperature: %s.%s degrees C", t / 10, t % 10))
]]--
end

function BMP085_Module
--[[	bmp085.pressure()	-	Samples the sensor and returns the pressure in pascal as an integer.
		The optional oversampling_setting parameter determines for how long time the sensor samples data. The default is 3 which is the longest sampling setting. Possible values are 0, 1, 2, 3. See the data sheet for more information.
	Syntax		-	bmp085.pressure(oversampling_setting)
	Parameters	-	oversampling_setting integer that can be 0, 1, 2 or 3
	Returns		-	pressure in pascals (integer)
	Example		
		bmp085.init(1, 2)
		local p = bmp085.pressure()
		print(string.format("Pressure: %s.%s mbar", p / 100, p % 100))

]]--
end

function BMP085_Module
--[[	bmp085.pressure_raw()	-	Samples the sensor and returns the raw pressure in internal units. Might be useful if you need higher precision.
	Syntax		-	bmp085.pressure_raw(oversampling_setting)
	Parameters	-	oversampling_setting integer that can be 0, 1, 2 or 3
	Returns		-	raw pressure sampling value (integer)
]]--
end

return BMP085_Module