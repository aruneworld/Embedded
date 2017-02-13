-- http://nodemcu.readthedocs.io/en/master/en/modules/sigma-delta/

--[[
http://esp8266iot.blogspot.in/
http://aruneworld.blogspot.com/
https://github.com/adalurarun/Embedded_System/MicroController/Espressif/ESP8266
Copyright Arun 2016-2017
MIT License

If you like this project, please add a star!
]]--

	----------------------------------------------------------------------------------------------------------------------------------
	-----------------------------------------------	SigmaDelta Module	----------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------------------------------------
local SigmaDelta = ...			-- Obtain a sample value from somewhere
local SigmaDelta_Module =  {}	-- conSigmaDelta an empty table and assign it to variable "Table_name" (ex: local Arun =  {})
_G[SigmaDelta] = SigmaDelta_Module	--	A global variable (not a function) that holds the global environment 

function SigmaDelta_Module()
--[[	sigma_delta.close()		-	Stops signal generation and reenables GPIO functionality at the specified pin.
	Syntax		-	sigma_delta.close(pin)
	Parameters	-	pin 1~12, IO index
	Returns		-	nil
]]--
end

function SigmaDelta_Module()
--[[	sigma_delta.setprescale()	-	Sets the prescale value.
	Syntax		-	sigma_delta.setprescale(value)
	Parameters	-	value prescale 1 to 255
	Returns		-	nil
]]--
end

function SigmaDelta_Module()
--[[	sigma_delta.setpwmduty()	-	Operate the sigma-delta module in PWM-like mode with fixed base frequency.
	Syntax		-	sigma_delta.setpwmduty(ratio)
	Parameters	-	ratio 0...255 for duty cycle 0...100%, 0 stops the signal at low
	Returns		-	nil
		Example
		-- attach generator to pin 2
		sigma_delta.setup(2)
		-- set 50% duty cycle ratio (and implicitly start signal)
		sigma_delta.setpwmduty(128)
		-- stop
		sigma_delta.setpwmduty(0)
		-- resume with ~99.6% ratio
		sigma_delta.setpwmduty(255)
		-- stop and detach generator from pin 2
		sigma_delta.close(2)
]]--
end

function SigmaDelta_Module()
--[[	sigma_delta.settarget()	-	Sets the target value.
	Syntax		-	sigma_delta.settarget(value)
	Parameters	-	value target 0 to 255
	Returns		-	nil
]]--
end

function SigmaDelta_Module()
--[[	sigma_delta.setup()	-	Stops the signal generator and routes it to the specified pin.
	Syntax		-	sigma_delta.setup(pin)
	Parameters	-	pin 1~12, IO index
	Returns		-	nil
]]--
end

return SigmaDelta_Module