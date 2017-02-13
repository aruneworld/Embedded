-- http://nodemcu.readthedocs.io/en/master/en/modules/mdns/

--[[
http://esp8266iot.blogspot.in/
http://aruneworld.blogspot.com/
https://github.com/adalurarun/Embedded_System/MicroController/Espressif/ESP8266
Copyright Arun 2016-2017
MIT License

If you like this project, please add a star!
]]--

	-----------------------------------------------------------------------------------------------------------------------------------
	-----------------------------------------------	mDNS Module	-------------------------------------------------------------------
	-----------------------------------------------------------------------------------------------------------------------------------
local mDNS = ...			-- Obtain a sample value from somewhere
local mDNS_Module =  {}	-- conmDNS an empty table and assign it to variable "Table_name" (ex: local Arun =  {})
_G[mDNS] = mDNS_Module	--	A global variable (not a function) that holds the global environment


--[[	mDNS Module
	Since 	Origin / Contributor 	Maintainer 	Source
	2016-02-24 	Philip Gladstone 	Philip Gladstone 	mdns.c

	Multicast DNS is used as part of Bonjour / Zeroconf. This allows system to identify themselves and the services that they provide on a local area network. Clients are then able to discover these systems and connect to them.
	mdns.register()	Register a hostname and start the mDNS service.
	mdns.close()	Shut down the mDNS service.

]]--

function mDNS_Module
--[[	mdns.register()		-	Register a hostname and start the mDNS service. If the service is already running, then it will be restarted with the new parameters.
	Syntax		-	mdns.register(hostname [, attributes])
	Parameters	-	hostname The hostname for this device. Alphanumeric characters are best.
					attributes A optional table of options. The keys must all be strings.
						The attributes contains two sorts of attributes -- those with specific names, and those that are service specific. RFC 6763 defines how extra, service specific, attributes are encoded into the DNS. One example is that if the device supports printing, then the queue name can be specified as an additional attribute. This module supports up to 10 such attributes.
						The specific names are:
							port The port number for the service. Default value is 80.
							service The name of the service. Default value is 'http'.
							dscription A short phrase (under 63 characters) describing the service. Default is the hostname.
	Returns		-	nil
	Errors		-	Various errors can be generated during argument validation. The NodeMCU must have an IP address at the time of the call, otherwise an error is thrown.
	Example		
		mdns.register("fishtank", {hardware='NodeMCU'})
		Using dns-sd on OS X, you can see fishtank.local as providing the _http._tcp service. You can also browse directly to fishtank.local. In Safari you can get all the mDNS web pages as part of your bookmarks menu.
		mdns.register("fishtank", { description="Top Fishtank", service="http", port=80, location='
]]--
end

function mDNS_Module
--[[	mdns.close()	-	Shut down the mDNS service. This is not normally needed.
	Syntax		-	mdns.close()
	Parameters	-	none
	Returns		-	nil
]]--
end

return mDNS_Module