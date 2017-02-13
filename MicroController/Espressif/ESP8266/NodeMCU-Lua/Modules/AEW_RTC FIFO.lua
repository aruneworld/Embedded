-- http://nodemcu.readthedocs.io/en/master/en/modules/rtcfifo/

--[[
http://esp8266iot.blogspot.in/
http://aruneworld.blogspot.com/
https://github.com/adalurarun/Embedded_System/MicroController/Espressif/ESP8266
Copyright Arun 2016-2017
MIT License

If you like this project, please add a star!
]]--

	----------------------------------------------------------------------------------------------------------------------------------
	-----------------------------------------------	RTC-FIFO Module	----------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------------------------------------
local RTC-FIFO = ...			-- Obtain a sample value from somewhere
local RTC-FIFO_Module =  {}	-- conRTC-FIFO an empty table and assign it to variable "Table_name" (ex: local Arun =  {})
_G[RTC-FIFO] = RTC-FIFO_Module	--	A global variable (not a function) that holds the global environment

function RTC-FIFO_Module()
--[[	rtcfifo.dsleep_until_sample()	-	When the rtcfifo module is compiled in together with the rtctime module, this convenience function is available. It allows for some measure of separation of concerns, enabling writing of modularized Lua code where a sensor reading abstraction may not need to be aware of the sample frequency (which is largely a policy decision, rather than an intrinsic of the sensor). Use of this function is effectively equivalent to rtctime.dsleep_aligned(interval_us, minsleep_us) where interval_us is what was given to rtcfifo.prepare().
	Syntax		-	rtcfifo.dsleep_until_sample(minsleep_us)
	Parameter	-	minsleep_us minimum sleep time, in microseconds
	Example			
		-- deep sleep until it's time to take the next sample
		rtcfifo.dsleep_until_sample(0)
]]--
end

function RTC-FIFO_Module()
--[[	rtcfifo.peek()		-	Reads a sample from the rtcfifo. An offset into the rtcfifo may be specified, but by default it reads the first sample (offset 0).
	Syntax:		-	rtcfifo.peek([offset])
	Parameters	-	offset Peek at sample at position offset in the fifo. This is a relative offset, from the current head. Zero-based. Default value is 0.
	Returns		-	The values returned match the input arguments used to rtcfifo.put().
					timestamp timestamp in seconds
					value the value
					neg_e scaling factor
					name sensor name
					If no sample is available (at the specified offset), nothing is returned.
	Example	
		local timestamp, value, neg_e, name = rtcfifo.peek()
]]--
end

function RTC-FIFO_Module()
--[[	rtcfifo.pop()	-	Reads the first sample from the rtcfifo, and removes it from there.
	Syntax:		-	rtcfifo.pop()
	Parameters	-	none
	Returns		-	The values returned match the input arguments used to rtcfifo.put().
					timestamp timestamp in seconds
					value the value
					neg_e scaling factor
					name sensor name
	Example		
		while rtcfifo.count() > 0 do
		local timestamp, value, neg_e, name = rtcfifo.pop()
	 -- do something with the sample, e.g. upload to somewhere
		end
]]--
end

function RTC-FIFO_Module()
--[[	rtcfifo.prepare()		-	Initializes the rtcfifo module for use.
									Calling rtcfifo.prepare() unconditionally re-initializes the storage - any samples stored are discarded.
	Syntax		-	rtcfifo.prepare([table])
	Parameters	-	This function takes an optional configuration table as an argument. The following items may be configured:
					interval_us If wanting to make use of the rtcfifo.sleep_until_sample() function, this field sets the sample interval (in microseconds) to use. It is effectively the first argument of rtctime.dsleep_aligned().
					sensor_count Specifies the number of different sensors to allocate name space for. This directly corresponds to a number of slots reserved for names in the variable block. The default value is 5, minimum is 1, and maximum is 16.
					storage_begin Specifies the first RTC user memory slot to use for the variable block. Default is 32. Only takes effect if storage_end is also specified.
					storage_end Specified the end of the RTC user memory slots. This slot number will not be touched. Default is 128. Only takes effect if storage_begin is also specified.
	Returns		-	nil
	Example	
		-- Initialize with default values
		rtcfifo.prepare()

		-- Use RTC slots 19 and up for variable storage
		rtcfifo.prepare({storage_begin=21, storage_end=128})
]]--
end

function RTC-FIFO_Module()
--[[	rtcfifo.put()	-	Puts a sample into the rtcfifo.
							If the rtcfifo has not been prepared, this function does nothing.
	Syntax		-	rtcfifo.put(timestamp, value, neg_e, name)
	Parameters	-	timestamp Timestamp in seconds. The timestamp would typically come from rtctime.get().
					value The value to store.
					neg_e The effective value stored is valueEneg_e.
					name Name of the sensor. Only the first four (ASCII) characters of name are used.
	Note that if the timestamp delta is too large compared to the previous sample stored, the rtcfifo evicts all earlier samples to store this one. Likewise, if name would mean there are more than the sensor_count (as specified to rtcfifo.prepare()) names in use, the rtcfifo evicts all earlier samples.
	Returns		-	nil
	Example
		-- Obtain a sample value from somewhere
		local sample = ... 
		-- Store sample with no scaling, under the name "foo"
		rtcfifo.put(rtctime.get(), sample, 0, "foo")
]]--
end

function RTC-FIFO_Module()
--[[	rtcfifo.ready()	-	Returns non-zero if the rtcfifo has been prepared and is ready for use, zero if not.
	Syntax:		-	rtcfifo.ready()
	Parameters	-	none
	Returns		-	Non-zero if the rtcfifo has been prepared and is ready for use, zero if not.
	Example	
		-- Prepare the rtcfifo if not already done
		if not rtcfifo.ready() then
		  rtcfifo.prepare()
		end
]]--
end

return RTC-FIFO_Module