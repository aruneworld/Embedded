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
	-----------------------------------------------	WS2801 Module	----------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------------------------------------
local WS2801 = ...			-- Obtain a sample value from somewhere
local WS2801_Module =  {}	-- construct an empty table and assign it to variable "Table_name" (ex: local Arun =  {})
_G[WS2801] = WS2801_Module	--	A global variable (not a function) that holds the global environment 


function WS2801_Module()
--[[	ws2801.init()	-	Initializes the module and sets the pin configuration.
	Syntax		-	ws2801.init(pin_clk, pin_data)
	Parameters	-	pin_clk pin for the clock. Supported are GPIO 0, 2, 4, 5.
					pin_data pin for the data. Supported are GPIO 0, 2, 4, 5.
	Returns		-	nil
]]--
end

function WS2801_Module()
--[[	ws2801.write()	-	Sends a string of RGB Data in 24 bits to WS2801. Don't forget to call ws2801.init() before.
	Syntax		-	ws2801.write(string)
	Parameters	-	string payload to be sent to one or more WS2801. It should be composed from an RGB triplet per element.
					R1 the first pixel's red channel value (0-255)
					G1 the first pixel's green channel value (0-255)
					B1 the first pixel's blue channel value (0-255)
					... You can connect a lot of WS2801...
					R2, G2, B2 are the next WS2801's Red, Green, and Blue channel values
	Returns		-	nil
	Example		-	ws2801.write(string.char(255,0,0, 0,255,0, 0,0,255))
]]--
end


return WS2801_Module