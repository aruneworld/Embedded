-- http://nodemcu.readthedocs.io/en/master/en/modules/l3g4200d/

--[[
http://esp8266iot.blogspot.in/
http://aruneworld.blogspot.com/
https://github.com/adalurarun/Embedded_System/MicroController/Espressif/ESP8266
Copyright Arun 2016-2017
MIT License

If you like this project, please add a star!
]]--

	-----------------------------------------------------------------------------------------------------------------------------------
	-----------------------------------------------	L3G4200D Module	-------------------------------------------------------------------
	-----------------------------------------------------------------------------------------------------------------------------------
local L3G4200D = ...			-- Obtain a sample value from somewhere
local L3G4200D_Module =  {}	-- conL3G4200D an empty table and assign it to variable "Table_name" (ex: local Arun =  {})
_G[L3G4200D] = L3G4200D_Module	--	A global variable (not a function) that holds the global environment

--[[	L3G4200D Module
	Since 	Origin / Contributor 	Maintainer 	Source
	2015-04-09 	Jason Schmidlapp 	Jason Schmidlapp 	l3g4200d.c

	This module provides access to the L3G4200D three axis digital gyroscope.
	l3g4200d.read()	Samples the sensor and returns the gyroscope output.
	l3g4200d.init()	Initializes the module and sets the pin configuration.
]]--

function L3G4200D_Module()
--[[	l3g4200d.read()		-	Samples the sensor and returns the gyroscope output.
	Syntax		-	l3g4200d.read()
	Returns		-	X,Y,Z gyroscope output
	Example		-	l3g4200d.init(1, 2)
					local x,y,z = l3g4200d.read()
					print(string.format("X = %d, Y = %d, Z = %d", x, y, z)
]]--
end


function L3G4200D_Module()
--[[	l3g4200d.init()		-	Initializes the module and sets the pin configuration.
		Syntax		-	l3g4200d.init(sda, scl)
		Parameters	-	sda data pin
						scl clock pin
]]--
end

return L3G4200D_Module