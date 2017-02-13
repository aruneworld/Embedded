-- http://nodemcu.readthedocs.io/en/master/en/modules/sntp/

--[[
http://esp8266iot.blogspot.in/
http://aruneworld.blogspot.com/
https://github.com/adalurarun/Embedded_System/MicroController/Espressif/ESP8266
Copyright Arun 2016-2017
MIT License

If you like this project, please add a star!
]]--

	----------------------------------------------------------------------------------------------------------------------------------
	-----------------------------------------------	SNTP Module	----------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------------------------------------
local SNTP = ...			-- Obtain a sample value from somewhere
local SNTP_Module =  {}	-- conSNTP an empty table and assign it to variable "Table_name" (ex: local Arun =  {})
_G[SNTP] = SNTP_Module	--	A global variable (not a function) that holds the global environment 

function SNTP_Module.sync([server_ip], [callback], [errcallback])
--[[	sntp.sync()		-	Attempts to obtain time synchronization.
							For best results you may want to to call this periodically in order to compensate for internal clock drift. As stated in the rtctime module documentation it's advisable to sync time after deep sleep and it's necessary to sync after module reset (add it to init.lua after WiFi initialization).
	Syntax		-	sntp.sync([server_ip], [callback], [errcallback])
	Parameters	-	server_ip if non-nil, that server is used. If nil, then the last contacted server is used. This ties in with the NTP anycast mode, where the first responding server is remembered for future synchronization requests. The easiest way to use anycast is to always pass nil for the server argument.
					callback if provided it will be invoked on a successful synchronization, with three parameters: seconds, microseconds, and server. Note that when the rtctime module is available, there is no need to explicitly call rtctime.set() - this module takes care of doing so internally automatically, for best accuracy.
					errcallback failure callback with a single integer parameter describing the type of error. The module automatically performs a number of retries before giving up and reporting the error. Error codes:
					1: DNS lookup failed
					2: Memory allocation failure
					3: UDP send failed
					4: Timeout, no NTP response received
	Returns		-	nil
	Example
		-- Best effort, use the last known NTP server (or the NTP "anycast" address 224.0.1.1 initially)
		sntp.sync()

		-- Sync time with 192.168.0.1 and print the result, or that it failed
		sntp.sync('192.168.0.1',
		  function(sec,usec,server)
			print('sync', sec, usec, server)
		  end,
		  function()
		   print('failed!')
		  end
		)
]]--
end

return SNTP_Module

--[[		-- Example Code
	
function syncTime()		--sntp.sync([server_ip], [callback], [errcallback])
	sntp.sync('0.in.pool.ntp.org',			--	server_ip
	function(sec,usec,server)				-- callback
--		print('sync', sec, usec, server)				-- printing the syc time from the net
	end,
   function()								--	errcallback
		do return end 
		print('failed!')
   end)
end

function tm()
	tm = rtctime.epoch2cal(rtctime.get())
--	print(string.format("%02d/%02d/%02d %02d:%02d:%02d:%02d", tm["year"], tm["mon"], tm["day"], tm["hour"], tm["min"], tm["sec"], tm["wday"]))
	
	--year=string.format("%02d",tm["year"])
	year	= tonumber(tm["year"])
--	year	= string.sub(year,2)
	month	= tonumber(tm["mon"])
	days	= tonumber(tm["day"])
	day_name 	= tonumber(tm["wday"])
		if 		day_name == 1 then day_print = "Sunday"
		elseif day_name == 2 then day_print = "Monday"
		elseif day_name == 3 then day_print = "Tuesday"
		elseif day_name == 4 then day_print = "Wenesday"
		elseif day_name == 5 then day_print = "thursday"
		elseif day_name == 6 then day_print = "Friday"
		elseif day_name == 7 then day_print = "Saturday"
		end
	hour 	= tonumber(tm["hour"])
	minute 	= tonumber(tm["min"])
	second 	= tonumber (tm["sec"])
	print("Synced ineternet time is "..year.."/"..month.."/"..days.." "..day_print.."|"..hour..":"..minute..":"..second)
end

tmr.alarm(0,3000,0,syncTime)
tmr.alarm(5,5000,1,tm)

]]--


