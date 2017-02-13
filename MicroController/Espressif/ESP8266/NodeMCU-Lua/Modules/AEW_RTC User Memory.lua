-- http://nodemcu.readthedocs.io/en/master/en/modules/rtcmem/

--[[
http://esp8266iot.blogspot.in/
http://aruneworld.blogspot.com/
https://github.com/adalurarun/Embedded_System/MicroController/Espressif/ESP8266
Copyright Arun 2016-2017
MIT License

If you like this project, please add a star!
]]--

	----------------------------------------------------------------------------------------------------------------------------------
	-----------------------------------------------	RTC-UserMemory Module	----------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------------------------------------
local RTC-UserMemory = ...			-- Obtain a sample value from somewhere
local RTC-UserMemory_Module =  {}	-- conRTC-UserMemory an empty table and assign it to variable "Table_name" (ex: local Arun =  {})
_G[RTC-UserMemory] = RTC-UserMemory_Module	--	A global variable (not a function) that holds the global environment 

function RTC-UserMemory_Module()
--[[	rtcmem.read32()		-	Reads one or more 32bit values from RTC user memory.
		Syntax		-	rtcmem.read32(idx [, num])
		Parameters	-	idx zero-based index to start reading from
						num number of slots to read (default 1)
		Returns		-	The value(s) read from RTC user memory.
						If idx is outside the valid range [0,127] this function returns nothing.
						If num results in overstepping the end of available memory, the function only returns the data from the valid slots.
	Example
		val = rtcmem.read32(0) -- Read the value in slot 0
		val1, val2 = rtcmem.read32(42, 2) -- Read the values in slots 42 and 43
]]--
end

function RTC-UserMemory_Module()
--[[	rtcmem.write32()	-	Writes one or more values to RTC user memory, starting at index idx.
								Writing to indices outside the valid range [0,127] has no effect.
	Syntax		-	rtcmem.write32(idx, val [, val2, ...])
	Parameters	-	 idx zero-based index to start writing to. Auto-increments if multiple values are given.
					val value to store (32bit)
					val2... additional values to store (optional)
	Returns		-	nil
	Example		
		rtcmem.write32(0, 53) -- Store the value 53 in slot 0
		rtcmem.write32(42, 2, 5, 7) -- Store the values 2, 5 and 7 into slots 42, 43 and 44, respe
]]--
end

return RTC-UserMemory_Module