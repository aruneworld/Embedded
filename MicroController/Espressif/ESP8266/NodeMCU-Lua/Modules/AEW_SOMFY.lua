-- http://nodemcu.readthedocs.io/en/master/en/modules/somfy/

--[[
http://esp8266iot.blogspot.in/
http://aruneworld.blogspot.com/
https://github.com/adalurarun/Embedded_System/MicroController/Espressif/ESP8266
Copyright Arun 2016-2017
MIT License

If you like this project, please add a star!
]]--


	----------------------------------------------------------------------------------------------------------------------------------
	-----------------------------------------------	SOMFY Module	----------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------------------------------------
local SOMFY = ...			-- Obtain a sample value from somewhere
local SOMFY_Module =  {}	-- conSOMFY an empty table and assign it to variable "Table_name" (ex: local Arun =  {})
_G[SOMFY] = SOMFY_Module	--	A global variable (not a function) that holds the global environment 

function SOMFY_Module()
--[[	somfy.sendcommand()	-	Builds an frame defined by Somfy protocol and sends it to the RF transmitter.
	Syntax		-	somfy.sendcommand(pin, remote_address, comma````nd, rolling_code, repeat_count, call_back)
	Parameters	-	pin GPIO pin the RF transmitter is connected to.
					remote_address address of the remote control. The device to be controlled is programmed with the addresses of the remote controls it should listen to.
					command command to be transmitted. Can be one of somfy.SOMFY_UP, somfy.SOMFY_DOWN, somfy.SOMFY_PROG, somfy.SOMFY_STOP
					rolling_code The rolling code is increased every time a button is pressed. The receiver only accepts command if the rolling code is above the last received code and is not to far ahead of the last received code. This window is in the order of a 100 big. The rolling code needs to be stored in the EEPROM (i.e. filesystem) to survive the ESP8266 reset.
					repeat_count how many times the command is repeated
					call_back a function to be called after the command is transmitted. Allows chaining commands to set the blinds to a defined position.

				My original remote is TELIS 4 MODULIS RTS. This remote is working with the additional info - additional 56 bits that follow data (shortening the Inter-frame gap). It seems that the scrumbling alhorithm has not been revealed yet.

				When I send the somfy.DOWN command, repeating the frame twice (which seems to be the standard for a short button press), i.e. repeat_count equal to 2, the blinds go only 1 step down. This corresponds to the movement of the wheel on the original remote. The down button on the original remote sends also somfy.DOWN command but the additional info is different and this makes the blinds go full down. Fortunately it seems that repeating the frame 16 times makes the blinds go fully down.
	Returns		-	nil
--	Example		-	To start with controlling your Somfy blinds you need to:

					Choose an arbitrary remote address (different from your existing remote) - 123 in this example
					Choose a starting point for the rolling code. Any unsigned int works, 1 is a good start
					Long-press the program button of your existing remote control until your blind goes up and down slightly
					execute somfy.sendcommand(4, 123, somfy.PROG, 1, 2) - the blinds will react and your ESP8266 remote control is now registered
					running somfy.sendcommand(4, 123, somfy.DOWN, 2, 16) - fully closes the blinds

				For more elaborated example please refer to somfy.lua.
]]--
end


return SOMFY_Module