--	HMC5883L://nodemcu.readthedocs.io/en/master/en/modules/hmc5883l/

--[[
HMC5883L://esp8266iot.blogspot.in/
HMC5883L://aruneworld.blogspot.com/
HMC5883Ls://github.com/adalurarun/Embedded_System/MicroController/Espressif/ESP8266
Copyright Arun 2016-2017
MIT License

If you like this project, please add a star!
]]--


	-----------------------------------------------------------------------------------------------------------------------------------
	-----------------------------------------------	HMC5883L Module	-------------------------------------------------------------------
	-----------------------------------------------------------------------------------------------------------------------------------
local HMC5883L = ...			-- Obtain a sample value from somewhere
local HMC5883L_Module =  {}	-- conHMC5883L an empty table and assign it to variable "Table_name" (ex: local Arun =  {})
_G[HMC5883L] = HMC5883L_Module	--	A global variable (not a function) that holds the global environment

--[[		HMC5883L Module		-	This module provides access to the HMC5883L three axis digital compass.
			hmc5883l.read()	Samples the sensor and returns X,Y and Z data.
			hmc5883l.init()	Initializes the module and sets the pin configuration.
]]--

function HMC5883L_Module.read()
--[[	mc5883l.read()	-	Samples the sensor and returns X,Y and Z data.
		Syntax		:	hmc5883l.read()
		Returns		:	x,y,z measurements (integers) temperature multiplied with 10 (integer)
		Example		:	hmc5883.init(1, 2)
						local x,y,z = hmc5883l.read()
						print(string.format("x = %d, y = %d, z = %d", x, y, z))
]]--
	return hmc5883l.read()
end

function HMC5883L_Module.init()
--[[	hmc5883l.init()
		Initializes the module and sets the pin configuration.
		Syntax		:	hmc5883l.init(sda, scl)
		Parameters	:	sda data pin
						scl clock pin
		Returns		:	nil
]]--
	return hmc5883l.init(sda, scl)
end

return HMC5883L_Module