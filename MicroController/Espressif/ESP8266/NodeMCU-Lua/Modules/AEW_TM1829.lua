-- http://nodemcu.readthedocs.io/en/master/en/modules/

--[[
http://esp8266iot.blogspot.in/
http://aruneworld.blogspot.com/
https://github.com/adalurarun/Embedded_System/MicroController/Espressif/ESP8266
Copyright Arun 2016-2017
MIT License

If you like this project, please add a star!
]]--

	----------------------------------------------------------------------------------------------------------------------------------
	-----------------------------------------------	TM1829 Module	----------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------------------------------------
local TM1829 = ...			-- Obtain a sample value from somewhere
local TM1829_Module =  {}	-- construct an empty table and assign it to variable "Table_name" (ex: local Arun =  {})
_G[TM1829] = TM1829_Module	--	A global variable (not a function) that holds the global environment

function TM1829_Module()
--[[	tm1829.write()		-	Send data to a led strip using native chip format.
	Syntax		-	tm1829.write(string)
	Parameters	-	string payload to be sent to one or more TM1829 leds.
	Returns		-	nil
	Example		-	tm1829.write(5, string.char(255,0,0,255,0,0)) -- turn the two first RGB leds to blue using 
]]--
end

return TM1829_Module