-- http://nodemcu.readthedocs.io/en/master/en/modules/wifi/#wifi-module

--[[
http://esp8266iot.blogspot.in/
http://aruneworld.blogspot.com/
https://github.com/adalurarun/Embedded_System/MicroController/Espressif/ESP8266
Copyright Arun 2016-2017
MIT License

If you like this project, please add a star!
]]--

	-----------------------------------------------------------------------------------------------------------------------------------
	----------------------------------------                    WIFI Module            ------------------------------------------------
	-----------------------------------------------------------------------------------------------------------------------------------
local WIFI = ...			-- Obtain a sample value from somewhere
local WIFI_Module =  {}	-- conWIFI an empty table and assign it to variable "Table_name" (ex: local Arun =  {})
_G[WIFI] = WIFI_Module	--	A global variable (not a function) that holds the global environment 

function RTC_Time_Module.dsleep(microseconds [, option])
--[[	rtctime.dsleep()	-	Puts the ESP8266 into deep sleep mode, like node.dsleep(). It differs from node.dsleep() in the following ways:
	Syntax		-	rtctime.dsleep(microseconds [, option])
	Parameters	-	microseconds number of microseconds to sleep for. Maxmium value is 4294967295us, or ~71 minutes.
					option sleep option, see node.dsleep() for specifics.
	Returns		-	This function does not return.
]]--
--Example
	-- sleep for a minute
--	rtctime.dsleep(60*1000000)
	
	-- sleep for 5 seconds, do not start RF on wakeup
--	rtctime.dsleep(5000000, 4)
	
	rtctime.dsleep(microseconds [, option])
end

function RTC_Time_Module.dsleep_aligned(aligned_us, minsleep_us [, option])
--[[	rtctime.dsleep_aligned()	-	For applications where it is necessary to take samples with high regularity, this function is useful. It provides an easy way to implement a "wake up on the next 5-minute boundary" scheme, without having to explicitly take into account how long the module has been active for etc before going back to sleep.
	Syntax		-	rtctime.dsleep_aligned(aligned_us, minsleep_us [, option])
	Parameters	-	aligned_us boundary interval in microseconds
					minsleep_us minimum time that will be slept, if necessary skipping an interval. This is intended for sensors where a sample reading is started before putting the ESP8266 to sleep, and then fetched upon wake-up. Here minsleep_us should be the minimum time required for the sensor to take the sample.
					option as with dsleep(), the option sets the sleep option, if specified.
]]--
--	Example		-	-- sleep at least 3 seconds, then wake up on the next 5-second boundary
	rtctime.dsleep_aligned(aligned_us, minsleep_us [, option])
	--rtctime.dsleep_aligned(5*1000000, 3*1000000)
end

function RTC_Time_Module.epoch2cal(timestamp)
--[[	rtctime.epoch2cal()	-	Converts a Unix timestamp to calendar format. Neither timezone nor DST correction is performed - the result is UTC time.
	Syntax		-	rtctime.epoch2cal(timestamp)
	Parameters	-	timestamp seconds since Unix epoch
	Returns		-	A table containing the fields:
						year 1970 ~ 2038
						mon month 1 ~ 12 in current year
						day day 1 ~ 31 in current month
						hour
						min
						sec
						yday day 1 ~ 366 in current year
						wday day 1 ~ 7 in current weak (Sunday is 1)
]]--
	--Example
	return tm = rtctime.epoch2cal(rtctime.get())
	print(string.format("%04d/%02d/%02d %02d:%02d:%02d", tm["year"], tm["mon"], tm["day"], tm["hour"], tm["min"], tm["sec"]))
end

function RTC_Time_Module.get()
--[[		rtctime.get()	-	Returns the current time. If current time is not available, zero is returned.
	Syntax		-	rtctime.get()
	Parameters	-	none
	Returns		-	two-value timestamp containing:
					sec seconds since the Unix epoch
					usec the microseconds part
]]--
	--Example
	return sec, usec = rtctime.get()
end

function RTC_Time_Module.set(seconds, microseconds)
--[[	rtctime.set()	-	Sets the rtctime to a given timestamp in the Unix epoch (i.e. seconds from midnight 1970/01/01). If the module is not already keeping time, it starts now. If the module was already keeping time, it uses this time to help adjust its internal calibration values. Care is taken that timestamps returned from rtctime.get() never go backwards. If necessary, time is slewed and gradually allowed to catch up.
	Syntax		-	rtctime.set(seconds, microseconds)
	Parameters	-	seconds the seconds part, counted from the Unix epoch
					microseconds the microseconds part
	Returns		-	nil
]]--
	--Example		
	-- Set time to 2015 July 9, 18:29:49
	--rtctime.set(1436430589, 0)
	rtctime.set(seconds, microseconds)
end

return RTC_Time_Module