-- http://nodemcu.readthedocs.io/en/master/en/modules/pcm/

--[[
http://esp8266iot.blogspot.in/
http://aruneworld.blogspot.com/
https://github.com/adalurarun/Embedded_System/MicroController/Espressif/ESP8266
Copyright Arun 2016-2017
MIT License

If you like this project, please add a star!
]]--

	----------------------------------------------------------------------------------------------------------------------------------
	-----------------------------------------------	PCM Module	----------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------------------------------------
local PCM = ...			-- Obtain a sample value from somewhere
local PCM_Module =  {}	-- conPCM an empty table and assign it to variable "Table_name" (ex: local Arun =  {})
_G[PCM] = PCM_Module	--	A global variable (not a function) that holds the global environment

function PCM_Module()
--[[	pcm.new()	-	Initializes the audio driver.
	Sigma-Delta driver	
	Syntax		-	pcm.new(pcm.SD, pin)
	Parameters	-	pcm.SD use sigma-delta hardware - pin 1~10, IO index
	Returns		-	Audio driver object.
]]--
end
	---------------------------------------------	Audio driver sub-module		------------------------------------

function PCM_Module()
--[[	pcm.drv:close()		-	Stops playback and releases the audio hardware.
	Syntax		-	drv:close()
	Parameters	-	none
	Returns		-	nil
]]--
end

function PCM_Module()
--[[	pcm.drv:on()	-	Register callback functions for events.
	Syntax		-	drv:on(event(, cb_fn(, freq)))
	Parameters	-	event identifier, one of:
						data callback function is supposed to return a string containing the next chunk of data.
						drained playback was stopped due to lack of data. The last 2 invocations of the data callback didn't provide new chunks in time (intentionally or unintentionally) and the internal buffers were fully consumed.
						paused playback was paused by pcm.drv:pause().
						stopped playback was stopped by pcm.drv:stop().
						vu new peak data, cb_fn is triggered freq times per second (1 to 200 Hz).
					cb_fn callback function for the specified event. Unregisters previous function if omitted. First parameter is drv, followed by peak data for vu callback.
	Returns		-	nil
]]--
end

function PCM_Module()
--[[	pcm.drv:play()	-	Starts playback.
	Syntax		-	drv:play(rate)
	Parameters	-	rate sample rate. Supported are pcm.RATE_1K, pcm.RATE_2K, pcm.RATE_4K, pcm.RATE_5K, pcm.RATE_8K, pcm.RATE_10K, pcm.RATE_12K, pcm.RATE_16K and defaults to RATE_8K if omitted.
	Returns		-	nil
]]--
end

function PCM_Module()
--[[	pcm.drv:pause()	-	Pauses playback. A call to drv:play() will resume from the last position.
	Syntax		-	drv:pause()
	Parameters	-	none
	Returns		-	nil
]]--
end

function PCM_Module()
--[[	pcm.drv:stop()	-	Stops playback and releases buffered chunks.
	Syntax		-	drv:stop()
	Parameters	-	none
	Returns		-	nil
]]--
end

return PCM_Module