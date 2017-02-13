-- http://nodemcu.readthedocs.io/en/master/en/modules/enduser-setup/

--[[
http://esp8266iot.blogspot.in/
http://aruneworld.blogspot.com/
https://github.com/adalurarun/Embedded_System/MicroController/Espressif/ESP8266
Copyright Arun 2016-2017
MIT License

If you like this project, please add a star!
]]--

	-----------------------------------------------------------------------------------------------------------------------------------
	--------------------------------------                  EndUser Setup  Module ------------------------------------------------------------
	-----------------------------------------------------------------------------------------------------------------------------------
local EndUserSetUp = ...			-- Obtain a sample value from somewhere
local EndUserSetUp_Module =  {}	-- conEndUserSetUp an empty table and assign it to variable "Table_name" (ex: local Arun =  {})
_G[EndUserSetUp] = EndUserSetUp_Module	--	A global variable (not a function) that holds the global environment


--[[		enduser setup Module	-		This module provides a simple way of configuring ESP8266 chips without using a serial interface or pre-programming WiFi credentials onto the chip.
		After running enduser_setup.start() a portal like the above can be accessed through a wireless network called SetupGadget_XXXXXX. The portal is used to submit the credentials for the WiFi of the enduser. After an IP address has been successfully obtained this module will stop as if enduser_setup.stop() had been called.
		Alternative HTML can be served by placing a file called enduser_setup.html in the filesystem. This file will be kept in RAM, so keep it as small as possible.
		enduser_setup.manual()	Controls whether manual AP configuration is used.
		enduser_setup.start()	Starts the captive portal.
		enduser_setup.stop()	Stops the captive portal.
]]--
function EndUserSetUp_Module..manual()
--[[	enduser_setup.manual()		-	Controls whether manual AP configuration is used.	By default the enduser_setup module automatically configures an open access point when starting, and stops it when the device has been successfully joined to a WiFi network. If manual mode has been enabled, neither of this is done. The device must be manually configured for wifi.SOFTAP mode prior to calling enduser_setup.start(). Additionally, the portal is not stopped after the device has successfully joined to a WiFi network.
		Syntax		:	enduser_setup.manual([on_off])
		Parameters	:	on_off a boolean value indicating whether to use manual mode; if not given, the function only returns the current setting.
		Returns		:	The current setting, true if manual mode is enabled, false if it is not.
		Example		:	wifi.setmode(wifi.STATIONAP)
						wifi.ap.config({ssid="ArunEworld", auth=wifi.OPEN})
						enduser_setup.manual(true)
						enduser_setup.start(
						  function()
							print("Connected to wifi as:" .. wifi.sta.getip())
						  end,
						  function(err, str)
							print("enduser_setup: Err #" .. err .. ": " .. str)
						  end
						);
]]--
end
	
function EndUserSetUp_Module.start()	
--[[		enduser_setup.start()		-		Starts the captive portal.
		Syntax		:	enduser_setup.start([onConnected()], [onError(err_num, string)], [onDebug(string)])
		Parameters	:	onConnected() callback will be fired when an IP-address has been obtained, just before the enduser_setup module will terminate itself
						onError() callback will be fired if an error is encountered. err_num is a number describing the error, and string contains a description of the error.
						onDebug() callback is disabled by default. It is intended to be used to find internal issues in the module. string contains a description of what is going on.
		Returns		:	nil
		Example		:	
						enduser_setup.start(
						  function()
							print("Connected to wifi as:" .. wifi.sta.getip())
						  end,
						  function(err, str)
							print("enduser_setup: Err #" .. err .. ": " .. str)
						  end
						);
]]--
end
						
function EndUserSetUp_Module.stop()
--[[		enduser_setup.stop()	-	Stops the captive portal.
		Syntax		:	enduser_setup.stop()
		Parameters	:	none
		Returns		:	nil
]]--
	enduser_setup.stop()
end

return EndUserSetUp_Module