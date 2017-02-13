--http://nodemcu.readthedocs.io/en/master/en/modules/switec/

--[[
http://esp8266iot.blogspot.in/
http://aruneworld.blogspot.com/
https://github.com/adalurarun/Embedded_System/MicroController/Espressif/ESP8266
Copyright Arun 2016-2017
MIT License

If you like this project, please add a star!
]]--

	----------------------------------------------------------------------------------------------------------------------------------
	-----------------------------------------------	Switec Module	----------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------------------------------------
local Switec = ...			-- Obtain a sample value from somewhere
local Switec_Module =  {}	-- construct an empty table and assign it to variable "Table_name" (ex: local Arun =  {})
_G[Switec] = Switec_Module	--	A global variable (not a function) that holds the global environment 

function Switec_Module()
--[[	switec.setup()	-	Initialize the nodemcu to talk to a switec X.27 or compatible instrument stepper motor. The default slew rate is set so that it should work for most motors. Some motors can run at 600 degress per second.
	Syntax		-	switec.setup(channel, pin1, pin2, pin3, pin4 [, maxDegPerSec])
	Parameters	-	channel The switec module supports three stepper motors. The channel is either 0, 1 or 2.
					pin1 This is a GPIO number and connects to pin 1 on the stepper.
					pin2 This is a GPIO number and connects to pin 2 on the stepper.
					pin3 This is a GPIO number and connects to pin 3 on the stepper.
					pin4 This is a GPIO number and connects to pin 4 on the stepper.
					maxDegPerSec (optional) This can set to limit the maximum slew rate. The default is 400 degrees per second.
	Returns		-	Nothing. If the arguments are in error, or the operation cannot be completed, then an error is thrown.
	Note	Once a channel is setup, it cannot be re-setup until the needle has stopped moving.
	Example
		switec.setup(0, 5, 6, 7, 8)
]]--
end

function Switec_Module()
--[[	switec.moveto()	-	Starts the needle moving to the specified position. If the needle is already moving, then the current motion is cancelled, and the needle will move to the new position. It is possible to get a callback when the needle stops moving. This is not normally required as multiple moveto operations can be issued in quick succession. During the initial calibration, it is important. Note that the callback is not guaranteed to be called -- it is possible that the needle never stops at the target location before another moveto operation is triggered.
	Syntax		-	switec.moveto(channel, position(, stoppedCallback)
	Parameters	-	channel The switec module supports three stepper motors. The channel is either 0, 1 or 2.
					position The position (number of steps clockwise) to move the needle. Typically in the range 0 to around 1000.
					stoppedCallback (optional) callback to be invoked when the needle stops moving.
	Errors		-	The channel must have been setup, otherwise an error is thrown.
	Example		
		switec.moveto(0, 1000, function ()
		switec.moveto(0, 0)
		end)
]]--
end


function Switec_Module()
--[[	switec.reset()	-	This sets the current position of the needle as being zero. The needle must be stationary.
	Syntax		-	switec.reset(channel)
	Parameters	-	channel The switec module supports three stepper motors. The channel is either 0, 1 or 2.
	Errors		-	The channel must have been setup and the needle must not be moving, otherwise an error is thrown.
]]--
end

function Switec_Module()
--[[	switec.getpos()		-	Gets the current position of the needle and whether it is moving.
	Syntax		-	switec.getpos(channel)
	Parameters	-	channel The switec module supports three stepper motors. The channel is either 0, 1 or 2.
	Returns		-	position the current position of the needle
					moving 0 if the needle is stationary. 1 for clockwise, -1 for anti-clockwise.
]]--
end

function Switec_Module()
--[[	switec.close()		-	Releases the resources associated with the stepper.
	Syntax		-	switec.close(channel)
	Parameters	-	channel The switec module supports three stepper motors. The channel is either 0, 1 or 2.
	Errors		-	The needle must not be moving, otherwise an error is thrown.
	Calibration	-	In order to set the zero point correctly, the needle should be driven anti-clockwise until it runs into the end stop. Then the zero point can be set. The value of -1000 is used as that is larger than the range of the motor -- i.e. it drives anti-clockwise through the entire range and onto the end stop.

		switec.setup(0, 5,6,7,8)
		calibration = true
		switec.moveto(0, -1000, function() 
		  switec.reset(0)
		  calibration = false
		end)

	Other moveto operations should not be performed while calibration is set.
]]--
end

return Switec_Module