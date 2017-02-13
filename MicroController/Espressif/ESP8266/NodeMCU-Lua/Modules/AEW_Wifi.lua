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
local WiFi = ...			-- Obtain a sample value from somewhere
local WiFi_Module =  {}	-- construct an empty table and assign it to variable "Table_name" (ex: local Arun =  {})
_G[WiFi] = WiFi_Module	--	A global variable (not a function) that holds the global environment 

function WiFi_Module.getchannel()
--[[	wifi.getchannel()	-	Gets the current WiFi channel.
	Syntax 		:	wifi.getchannel()
	Parameters	:	nil
	Returns		:	current WiFi channel
]]--
	print("Gets the current WiFi channel	= "..wifi.getchannel())
end

function WiFi_Module.getdefaultmode()
--[[	wifi.getdefaultmode()	-	Gets default WiFi operation mode.
	Syntax		:	wifi.getdefaultmode()
	Parameters	:	nil
	Returns		:	The WiFi mode, as one of the wifi.STATION, wifi.SOFTAP, wifi.STATIONAP or wifi.NULLMODE constants.
]]--	
	print("Gets default WiFi operation mode. : "..wifi.getdefaultmode())
end

function WiFi_Module.getmode()
--[[		wifi.getmode()	-	Gets WiFi operation mode.
	Syntax		:	wifi.getmode()
	Parameters	:	nil
	Returns		:	The WiFi mode, as one of the wifi.STATION, wifi.SOFTAP, wifi.STATIONAP, wifi.NULLMODE constants.
					0	:	wifi.NULLMODE 
					1	:	wifi.STATION
					2	:	wifi.SOFTAP
					3	:	wifi.STATIONAP
]]--
	print("Gets WiFi operation mode		= "..wifi.getmode().." | 0 : wifi.NULLMODE, 1 : wifi.STATION, 2 : wifi.SOFTAP, 3 : wifi.STATIONAP")
end
function WiFi_Module.getphymode()
--[[		wifi.getphymode()	-	Gets WiFi physical mode.
	Syntax		:	wifi.getphymode()
	Parameters	:	none
	Returns		:	The current physical mode as one of wifi.PHYMODE_B, wifi.PHYMODE_G or wifi.PHYMODE_N.
					1	:	wifi.PHYMODE_B
					2	:	wifi.PHYMODE_G
					3	:	wifi.PHYMODE_N
]]--
	print("Gets WiFi physical mode 		= "..wifi.getphymode().. " | 1	: wifi.PHYMODE_B, 2 :	wifi.PHYMODE_G, 3 : wifi.PHYMODE_N")
end
function WiFi_Module..setmode(mode)
--[[		wifi.setmode()	-	Configures the WiFi mode to use. NodeMCU can run in one of four WiFi modes:

    1. Station mode, where the NodeMCU device joins an existing network
    2. Access point (AP) mode, where it creates its own network that others can join
    3. Station + AP mode, where it both creates its own network while at the same time being joined to another existing network
    4. WiFi off

	When using the combined Station + AP mode, the same channel will be used for both networks as the radio can only listen on a single channel.

	NOTE: WiFi Mode configuration will be retained until changed even if device is turned off.
	
	Syntax 		: wifi.setmode(mode)
	Parameters	: mode value should be one of

		wifi.STATION for when the device is connected to a WiFi router. This is often done to give the device access to the Internet.
		wifi.SOFTAP for when the device is acting only as an access point. This will allow you to see the device in the list of WiFi networks (unless you hide the SSID, of course). In this mode your computer can connect to the device, creating a local area network. Unless you change the value, the NodeMCU device will be given a local IP address of 192.168.4.1 and assign your computer the next available IP address, such as 192.168.4.2.
		wifi.STATIONAP is the combination of wifi.STATION and wifi.SOFTAP. It allows you to create a local WiFi connection and connect to another WiFi router.
		wifi.NULLMODE to switch off WiFi

	Returns		: current mode after setup
]]--
	wifi.setmode(mode)			-- 1. wifi.STATION, 2. wifi.SOFTAP, 3. wifi.STATIONAP, 4. wifi.NULLMODE
	print("after Gets WiFi operation mode	= "..wifi.getmode()..		" | 0 : wifi.NULLMODE,	1 : wifi.STATION,	2 : wifi.SOFTAP, 	3 : wifi.STATIONAP")
end
function WiFi_Module.setphymode(mode)
--[[		wifi.setphymode()		-	Sets WiFi physical mode.

    wifi.PHYMODE_B 802.11b, more range, low Transfer rate, more current draw
    wifi.PHYMODE_G 802.11g, medium range, medium transfer rate, medium current draw
    wifi.PHYMODE_N 802.11n, least range, fast transfer rate, least current draw (STATION ONLY) Information from the Espressif datasheet v4.3

	Parameters 							Typical Power Usage
	Tx 802.11b, CCK 11Mbps, P OUT=+17dBm 	170 mA
	Tx 802.11g, OFDM 54Mbps, P OUT =+15dBm 	140 mA
	Tx 802.11n, MCS7 65Mbps, P OUT =+13dBm 	120 mA
	Rx 802.11b, 1024 bytes packet length, -80dBm 	50 mA
	Rx 802.11g, 1024 bytes packet length, -70dBm 	56 mA
	Rx 802.11n, 1024 bytes packet length, -65dBm 	56 mA
	
	Syntax		:	wifi.setphymode(mode)
	Parameters	:	mode one of the following
		
		wifi.PHYMODE_B
		wifi.PHYMODE_G
		wifi.PHYMODE_N

	Returns	:		physical mode after setup
]]--
	--wifi.setphymode(wifi.PHYMODE_N)		--	 1. wifi.PHYMODE_B, 2. wifi.PHYMODE_G, 3. wifi.PHYMODE_N
	print("After Gets WiFi physical mode 	= "..wifi.getphymode()..	" | 1 : wifi.PHYMODE_B, 2 :	wifi.PHYMODE_G, 3 : wifi.PHYMODE_N")
end

function WiFi_Module.nullmodesleep([enable])
--[[
	wifi.nullmodesleep()	Configures whether or not WiFi automatically goes to sleep in NULL_MODE. Enabled by default.
	!!! note	-	This function **does not** store it's setting in flash, if auto sleep in NULL_MODE is not desired, `wifi.nullmodesleep(false)` must be called after powerup, restart, or wake from deep sleep.
	
	Syntax		wifi.nullmodesleep([enable])
	Parameters  enable
				true Enable WiFi auto sleep in NULL_MODE. (Default setting)
				false Disable WiFi auto sleep in NULL_MODE.

	Returns		sleep_enabled Current/New NULL_MODE sleep setting
				If wifi.nullmodesleep() is called with no arguments, current setting is returned.
				If wifi.nullmodesleep() is called with enable argument, confirmation of new setting is returned.
]]--
	wifi.nullmodesleep([enable])
end

function WiFi_Module.startsmart(type, callback)
--[[		wifi.startsmart()	-	Starts to auto configuration, if success set up SSID and password automatically. Intended for use with SmartConfig apps, such as Espressif's Android & iOS app. Only usable in wifi.STATION mode.
	
	Important 	:	SmartConfig is disabled by default and can be enabled by setting WIFI_SMART_ENABLE in user_config.h before you build the firmware.

	Syntax 		:	wifi.startsmart(type, callback)
	Parameters	:	type 0 for ESP_TOUCH, or 1 for AIR_KISS.
					callback a callback function of the form function(ssid, password) end which gets called after configuration.
	Returns		:	nil
	
	Example :	
		wifi.setmode(wifi.STATION)
		wifi.startsmart(0,
			function(ssid, password)
				print(string.format("Success. SSID:%s ; PASSWORD:%s", ssid, password))
			end
		)
]]--
	wifi.startsmart(type, callback)
end

function WiFi_Module.stopsmart()
--[[	wifi.stopsmart()	-	Stops the smart configuring process.
	Syntax		:	wifi.stopsmart()
	Parameters	:	none
	Returns		:	nil
]]--
	wifi.stopsmart()
end

	-----------------------------------------------------------------------------------------------------------------------------------
	----------------------------------------              WIFI STATION Module          ------------------------------------------------
	-----------------------------------------------------------------------------------------------------------------------------------
function WiFi_Module.sta.autoconnect(auto)
--[[	wifi.sta.autoconnect()	-	Auto connects to AP in station mode.
	Syntax		:	wifi.sta.autoconnect(auto)
	Parameters	:	auto 0 to disable auto connecting, 1 to enable auto connecting
	Returns		:	nil
	Example		:	wifi.sta.autoconnect(1)
]]--
	wifi.sta.autoconnect(auto)				-- auto 0 to disable auto connecting, 1 to enable auto connecting
end

function WiFi_Module.sta.changeap(ap_index)
--[[	wifi.sta.changeap() - Select Access Point from list returned by wifi.sta.getapinfo()
	Syntax		:	wifi.sta.changeap(ap_index)
	Parameters	:	ap_index Index of Access Point you would like to change to. (Range:1-5) - Corresponds to index used by wifi.sta.getapinfo() and wifi.sta.getapindex()
	Returns		:	true Success
					false Failure
	Example		:	wifi.sta.changeap(4)
	]]--
		wifi.sta.changeap(ap_index)
end

function WiFi_Module.sta.config(station_config)
--[[	wifi.sta.config()	-	Sets the WiFi station configuration.
	Syntax		:	wifi.sta.config(station_config)
	Parameters	:	station_config 	-	table containing configuration data for station
					ssid 			-	string which is less than 32 bytes.
					pwd 			-	string which is 8-64 or 0 bytes. Empty string indicates an open WiFi access point.
					auto 			-	defaults to true
						true 	-	to enable auto connect and connect to access point, hence with auto=true there's no need to call wifi.sta.connect()
						false 	-	to disable auto connect and remain disconnected from access point
					bssid			-	string that contains the MAC address of the access point (optional)
						You can set BSSID if you have multiple access points with the same SSID.
						Note: if you set BSSID for a specific SSID and would like to configure station to connect to the same SSID only without the BSSID requirement, you MUST first configure to station to a different SSID first, then connect to the desired SSID
						The following formats are valid:
							"DE:C1:A5:51:F1:ED"
							"AC-1D-1C-B1-0B-22"
							"DE AD BE EF 7A C0"
					save 			-	Save station configuration to flash.
					true			-	configuration will be retained through power cycle.
					false 			-	configuration will not be retained through power cycle. (Default)
	Returns		:	true 	-	Success
					false 	-	Failure
	See also	:	wifi.sta.connect()
					wifi.sta.disconnect()
					wifi.sta.apinfo()
]]--
	--configure station 
	station_cfg={}
	station_cfg.ssid="NODE-AABBCC"
	station_cfg.pwd="password"
	station_cfg.auto= true
	station_cfg.bssid="AA:BB:CC:DD:EE:FF"
	station_cfg.save=true
	wifi.sta.config(station_cfg)
end

function WiFi_Module.sta.connect()
--[[	wifi.sta.connect()	-	Connects to the configured AP in station mode. You only ever need to call this if auto-connect was disabled in wifi.sta.config().
		Syntax		:	wifi.sta.connect()
		Parameters	:	none
		Returns		:	nil
		See also	:	wifi.sta.disconnect()
						wifi.sta.config()
]]--
	wifi.sta.connect()
end

function WiFi_Module.sta.disconnect()
--[[	wifi.sta.disconnect()	-	Disconnects from AP in station mode.
		Syntax		:	wifi.sta.disconnect()
		Parameters	:	none
		Returns		:	nil
		See also	:	
			wifi.sta.config()
			wifi.sta.connect()
]]--
wifi.sta.disconnect()
end

function WiFi_Module.sta.eventMonReg()
--[[	wifi.sta.eventMonReg()	-	Registers callbacks for WiFi station status events.
		Syntax		:	wifi.sta.eventMonReg(wifi_status[, function([previous_state])])
		Parameters	:	wifi_status WiFi status you would like to set a callback for:
							wifi.STA_IDLE
							wifi.STA_CONNECTING
							wifi.STA_WRONGPWD
							wifi.STA_APNOTFOUND
							wifi.STA_FAIL
							wifi.STA_GOTIP
						function callback function to perform when event occurs
							Note: leaving field blank unregisters callback.
						previous_state previous wifi_state(0 - 5)

		Returns		:	nil
				
]]--
--register callback
wifi.sta.eventMonReg(wifi.STA_IDLE, function() print("STATION_IDLE") end)
wifi.sta.eventMonReg(wifi.STA_CONNECTING, function() print("STATION_CONNECTING") end)
wifi.sta.eventMonReg(wifi.STA_WRONGPWD, function() print("STATION_WRONG_PASSWORD") end)
wifi.sta.eventMonReg(wifi.STA_APNOTFOUND, function() print("STATION_NO_AP_FOUND") end)
wifi.sta.eventMonReg(wifi.STA_FAIL, function() print("STATION_CONNECT_FAIL") end)
wifi.sta.eventMonReg(wifi.STA_GOTIP, function() print("STATION_GOT_IP") end)

--register callback: use previous state
wifi.sta.eventMonReg(wifi.STA_CONNECTING, function(previous_State)
    if(previous_State==wifi.STA_GOTIP) then 
        print("Station lost connection with access point\n\tAttempting to reconnect...")
    else
        print("STATION_CONNECTING")
    end
	end)

	--unregister callback
--	wifi.sta.eventMonReg(wifi.STA_IDLE)
end


function WiFi_Module.sta.eventMonStart()
--[[	wifi.sta.eventMonStart()	-	Starts WiFi station event monitor.
		Syntax		:	wifi.sta.eventMonStart(ms)
		Parameters	:	ms interval between checks in milliseconds, defaults to 150ms if not provided.
		Returns		:	nil
		Example		:
						--start WiFi event monitor with default interval
						wifi.sta.eventMonStart()

						--start WiFi event monitor with 100ms interval
						wifi.sta.eventMonStart(100)
]]--
	wifi.sta.eventMonStart()
end


function WiFi_Module.sta.eventMonStop([unregister_all])
--[[	wifi.sta.eventMonStop()	-	Stops WiFi station event monitor.
		Syntax		:	wifi.sta.eventMonStop([unregister_all])
		Parameters	:	unregister_all enter 1 to unregister all previously registered functions.
						Note: leave blank to leave callbacks registered
		Returns		:	nil
		Example		:	
				--stop WiFi event monitor
				wifi.sta.eventMonStop()

				--stop WiFi event monitor and unregister all callbacks
				wifi.sta.eventMonStop(1)
]]--
wifi.sta.eventMonStop()

end

function WiFi_Module. wifi.sta.getap()
--[[	wifi.sta.getap()	-		Scans AP list as a Lua table into callback function.
		Syntax		:	wifi.sta.getap(((cfg), format,) callback(table))
		Parameters	:	cfg table that contains scan configuration
							ssid SSID == nil, don't filter SSID
							bssid BSSID == nil, don't filter BSSID
							channel channel == 0, scan all channels, otherwise scan set channel (default is 0)
							show_hidden show_hidden == 1, get info for router with hidden SSID (default is 0)
						format select output table format, defaults to 0
								0: old format (SSID : Authmode, RSSI, BSSID, Channel), any duplicate SSIDs will be discarded
								1: new format (BSSID : SSID, RSSI, auth mode, Channel)
						callback(table) a callback function to receive the AP table when the scan is done. This function receives a table, the key is the BSSID, the value is other info in format: SSID, RSSID, auth mode, channel.

		Returns		:	nil
]]--
	wifi.sta.getap(aplist)
function aplist(t)    for k,v in pairs(t) do        print(k.." : "..v)end end
end

function WiFi_Module.wifi.sta.getapindex()
--[[	wifi.sta.getapindex()	-	Get index of current Access Point stored in AP cache.
	Syntax			:	wifi.sta.getapindex()
	Parameters		:	none
	Returns			:	current_index index of currently selected Access Point. (Range:1-5)
]]--
	print("the index of the currently selected AP is: "..wifi.sta.getapindex())
end

function	WiFi_Modulesta.getapinfo()
--[[	wifi.sta.getapinfo()	-	Get information of APs cached by ESP8266 station.
	Note	:	Any Access Points configured with save disabled wifi.sta.config({save=false}) will populate this list (appearing to overwrite APs stored in flash) until restart.
	Syntax		:	wifi.sta.getapinfo()
	Parameters	:	nil
	Returns		:	ap_info
					qty quantity of APs returned
					1-5 index of AP. (the index corresponds to index used by wifi.sta.changeap() and wifi.sta.getapindex())
					ssid ssid of Access Point
					pwd Password for Access Point
					If no password was configured, the pwd field will be nil
					bssid MAC address of Access Point
					If no MAC address was configured, the bssid field will be nil
]]--
	wifi.sta.getapinfo()
end

function WiFi_Module.sta.getbroadcast()
--[[	wifi.sta.getbroadcast()		-	Gets the broadcast address in station mode.
	Syntax		:	wifi.sta.getbroadcast()
	Parameters	:	nil
	Returns		:	broadcast address as string, for example "192.168.0.255", returns nil if IP address = "0.0.0.0".
]]--
	wifi.sta.getbroadcast()
end

function WiFi_Module.wifi.sta.getconfig()
--[[	wifi.sta.getconfig()	-	Gets the WiFi station configuration.
	Syntax		-	wifi.sta.getconfig()
	Parameters	-	return_table
					true returns data in a table
					false returns data in the old format (default)
	Returns		-	If return_table is true: - config_table - ssid ssid of Access Point. - pwd password to Access Point. - If no password was configured, the pwd field will be nil - bssid MAC address of Access Point - If no MAC address was configured, the bssid field will be nil
					If return_table is false: - ssid, password, bssid_set, bssid
	- Note: If bssid_set is equal to 0 then bssid is irrelevant,
]]--
--Example

--Get current Station configuration (NEW FORMAT)
do
local def_sta_config=wifi.sta.getconfig(true)
print(string.format("\tDefault station config\n\tssid:\"%s\"\tpassword:\"%s\"%s", def_sta_config.ssid, def_sta_config.pwd, (type(def_sta_config.bssid)=="string" and "\tbssid:\""..def_sta_config.bssid.."\"" or "")))
end

--Get current Station configuration (OLD FORMAT)
ssid, password, bssid_set, bssid=wifi.sta.getconfig()
print("\nCurrent Station configuration:\nSSID : "..ssid
.."\nPassword  : "..password
.."\nBSSID_set  : "..bssid_set
.."\nBSSID: "..bssid.."\n")
ssid, password, bssid_set, bssid=nil, nil, nil, nil

end

function 	WiFi_Module.sta.getdefaultconfig(return_table)
--[[	wifi.sta.getdefaultconfig()	-	Gets the default WiFi station configuration stored in flash.
	Syntax		:	wifi.sta.getdefaultconfig(return_table)
	Parameters	:	return_table
					true returns data in a table
					false returns data in the old format (default)
	Returns		:	If return_table is true: - config_table - ssid ssid of Access Point. - pwd password to Access Point. - If no password was configured, the pwd field will be nil - bssid MAC address of Access Point - If no MAC address was configured, the bssid field will be nil
					If return_table is false: - ssid, password, bssid_set, bssid
	- Note: If bssid_set is equal to 0 then bssid is irrelevant,
	]]--
	wifi.sta.getdefaultconfig(return_table)
end

function WiFi_Module.wifi.sta.gethostname()
--[[	wifi.sta.gethostname()	-	Gets current station hostname.
	Syntax		:	wifi.sta.gethostname()
	Parameters	:	none
	Returns		:	currently configured hostname
]]--
	--Example
	print("Current hostname is: \""..wifi.sta.gethostname().."\"")
end

function WiFi_Module.sta.getip()
--[[	wifi.sta.getip()	-	Gets IP address, netmask, and gateway address in station mode.
	Syntax		:		wifi.sta.getip()
	Parameters	:		none
	Returns		:		IP address, netmask, gateway address as string, for example "192.168.0.111". Returns nil if IP = "0.0.0.0".
]]--
	wifi.sta.getip()
end

function WiFi_Module.sta.getmac()
--[[	wifi.sta.getmac()	-	Gets MAC address in station mode.
	Syntax		;	wifi.sta.getmac()
	Parameters	:	none
	Returns		:	MAC address as string e.g. "18:fe:34:a2:d7:34"
]]--
	wifi.sta.getmac()
end

function WiFi_Module.sta.getrssi()
--[[	wifi.sta.getrssi()		-	Get RSSI(Received Signal Strength Indicator) of the Access Point which ESP8266 station connected to.
	Syntax		:	wifi.sta.getrssi()
	Parameters	:	none
	Returns		:	If station is connected to an access point, rssi is returned.
					If station is not connected to an access point, nil is returned.
]]--
	wifi.sta.getrssi()
end

function WiFi_Module.sta.setaplimit(qty)
--[[	wifi.sta.setaplimit()	-	Set Maximum number of Access Points to store in flash. - This value is written to flash
	Attention	:	If 5 Access Points are stored and AP limit is set to 4, the AP at index 5 will remain until node.restore() is called or AP limit is set to 5 and AP is overwritten.
	Syntax		:	wifi.sta.setaplimit(qty)
	Parameters	:	qty Quantity of Access Points to store in flash. Range: 1-5 (Default: 5)
	Returns		:	true Success
					false Failure
]]-
	wifi.sta.setaplimit(qty)
end

function WiFi_Module.sta.sethostname(hostname)
--[[	wifi.sta.sethostname()	-	Sets station hostname.
	Syntax		:	wifi.sta.sethostname(hostname)
	Parameters	:	hostname must only contain letters, numbers and hyphens('-') and be 32 characters or less with first and last character being alphanumeric
	Returns		:	nil
]]--
	wifi.sta.sethostname(hostname)
end

function WiFi_Module.sta.setip(cfg)
--[[	wifi.sta.setip()	-	Sets IP address, netmask, gateway address in station mode.
	Syntax		:	wifi.sta.setip(cfg)
	Parameters	:	cfg table contain IP address, netmask, and gateway
					{
					  ip = "192.168.0.111",
					  netmask = "255.255.255.0",
					  gateway = "192.168.0.1"
					}
	Returns		:	true if success, false otherwise
]]--
	wifi.sta.setip(cfg)
end

function WiFi_Module.sta.setmac(mac)
--[[	wifi.sta.setmac()	-	Sets MAC address in station mode.
	Syntax		:	wifi.sta.setmac(mac)
	Parameters	:	MAC address in string e.g. "DE:AD:BE:EF:7A:C0"
	Returns		:	true if success, false otherwise
]]--
	wifi.sta.setmac(mac)
end

function WiFi_Module.sleeptype(type_wanted)
--[[		wifi.sleeptype()	-	Configures the WiFi modem sleep type to be used while station is connected to an Access Point.
	!!! note	-	Does not apply to `wifi.SOFTAP`, `wifi.STATIONAP` or `wifi.NULLMODE`.
	Syntax		:	wifi.sleeptype(type_wanted)
	Parameters	:	type_wanted one of the following:
		
		wifi.NONE_SLEEP to keep the modem on at all times
		wifi.LIGHT_SLEEP to allow the modem to power down under some circumstances
		wifi.MODEM_SLEEP to power down the modem as much as possible

	Returns :	The actual sleep mode set, as one of wifi.NONE_SLEEP, wifi.LIGHT_SLEEP or wifi.MODEM_SLEEP
]]--
	wifi.sleeptype(type_wanted)					--	1. wifi.NONE_SLEEP, 2.wifi.LIGHT_SLEEP 3. wifi.MODEM_SLEEP
end

function WiFi_Module.sta.status()
--[[	wifi.sta.status()	-	Gets the current status in station mode.
	Syntax		:	wifi.sta.status()
	Parameters	:	nil
	Returns		:	number： 0~5
					0: STA_IDLE,
					1: STA_CONNECTING,
					2: STA_WRONGPWD,
					3: STA_APNOTFOUND,
					4: STA_FAIL,
					5: STA_GOTIP.
]]--
	wifi.sta.status()
end

	-----------------------------------------------------------------------------------------------------------------------------------
	-------------------------------------                    WIFI AP Module            ------------------------------------------------
	-----------------------------------------------------------------------------------------------------------------------------------

function WiFi_Module.ap.config(cfg)
--[[	wifi.ap.config()	-	Sets SSID and password in AP mode. Be sure to make the password at least 8 characters long! If you don't it will default to no password and not set the SSID! It will still work as an access point but use a default SSID like e.g. NODE-9997C3.
	Syntax		:	wifi.ap.config(cfg)
	Parameters	:	cfg table to hold configuration
					ssid SSID chars 1-32
					pwd password chars 8-64
					auth authentication method, one of wifi.OPEN (default), wifi.WPA_PSK, wifi.WPA2_PSK, wifi.WPA_WPA2_PSK
					channel channel number 1-14 default = 6
					hidden false = not hidden, true = hidden, default = false
					max maximum number of connections 1-4 default=4
					beacon beacon interval time in range 100-60000, default = 100
					save save configuration to flash.
					true configuration will be retained through power cycle. (Default)
					false configuration will not be retained through power cycle.

	Returns		:	true Success
					false Failure
]]--
	wifi.ap.config(cfg)
end

function WiFi_Module.ap.deauth()
--[[	wifi.ap.deauth()

Deauths (forcibly removes) a client from the ESP access point by sending a corresponding IEEE802.11 management packet (first) and removing the client from it's data structures (afterwards).

The IEEE802.11 reason code used is 2 for "Previous authentication no longer valid"(AUTH_EXPIRE).
Syntax

wifi.ap.deauth([MAC])
Parameters

    MAC address of station to be deauthed.
        Note: if this field is left blank, all currently connected stations will get deauthed.

Returns

Returns true unless called while the ESP is in the STATION opmode
Example

allowed_mac_list={"18:fe:34:00:00:00", "18:fe:34:00:00:01"}

wifi.eventmon.register(wifi.eventmon.AP_STACONNECTED, function(T)
  print("\n\tAP - STATION CONNECTED".."\n\tMAC: "..T.MAC.."\n\tAID: "..T.AID)
  if(allowed_mac_list~=nil) then
    for _, v in pairs(allowed_mac_list) do
      if(v == T.MAC) then return end
    end
  end
  wifi.ap.deauth(T.MAC)
  print("\tStation DeAuthed!")
end)



]]--
end

function WiFi_Module.ap.getbroadcast()
--[[	wifi.ap.getbroadcast()	-	Gets broadcast address in AP mode.
	Syntax		:	wifi.ap.getbroadcast()
	Parameters	:	none
	Returns		:	broadcast address in string, for example "192.168.0.255", returns nil if IP address = "0.0.0.0".
]]--
	wifi.ap.getbroadcast()
end

function WiFi_Module.ap.getclient()
--[[	wifi.ap.getclient()	-	Gets table of clients connected to device in AP mode.
	Syntax		:	wifi.ap.getclient()
	Parameters	:	none
	Returns		:	table of connected clients
	Example		:	table={}
					table=wifi.ap.getclient()
					for mac,ip in pairs(table) do
						print(mac,ip)
					end

]]--
	-- or shorter
	for mac,ip in pairs(wifi.ap.getclient()) do
	print(mac,ip)
	end
end

function WiFi_Module.ap.getconfig(return_table)
--[[	wifi.ap.getconfig()		-	Gets the current SoftAP configuration.
	Syntax		:	wifi.ap.getconfig(return_table)
	Parameters	:	return_table
					true returns data in a table
					false returns data in the old format (default)
	Returns		:	If return_table is true: - config_table - ssid Network name - pwd Password - If no password was configured, the pwd field will be nil - auth Authentication Method (wifi.OPEN, wifi.WPA_PSK, wifi.WPA2_PSK or wifi.WPA_WPA2_PSK) - channel Channel number - hidden false = not hidden, true = hidden - max Maximum number of client connections - beacon Beacon interval
					If return_table is false: ssid, password
	Note: If bssid_set is equal to 0 then bssid is irrelevant
]]--
	Example

	--Get SoftAP configuration table (NEW FORMAT)
	do
	  print("\n  Current SoftAP configuration:")
	  for k,v in pairs(wifi.ap.getconfig(true)) do
		  print("   "..k.." :",v)
	  end
	end

	--Get current SoftAP configuration (OLD FORMAT)
	do
	  local ssid, password=wifi.ap.getconfig()
	  print("\n  Current SoftAP configuration:\n   SSID : "..ssid..
		"\n   Password  :",password)
	  ssid, password=nil, nil
	end
end

function WiFi_Module.ap.getdefaultconfig()
--[[	wifi.ap.getdefaultconfig()	-	Gets the default SoftAP configuration stored in flash.
	Syntax		:	wifi.ap.getdefaultconfig(return_table)
	Parameters	:	return_table
					true returns data in a table
					false returns data in the old format (default)
	Returns		:	If return_table is true: - config_table - ssid Network name - pwd Password - If no password was configured, the pwd field will be nil - auth Authentication Method (wifi.OPEN, wifi.WPA_PSK, wifi.WPA2_PSK or wifi.WPA_WPA2_PSK) - channel Channel number - hidden false = not hidden, true = hidden - max Maximum number of client connections - beacon Beacon interval
					If return_table is false: ssid, password
	Note	: If bssid_set is equal to 0 then bssid is irrelevant
]]--
	--Example
	--Get default SoftAP configuration table (NEW FORMAT)
	do
	  print("\n  Default SoftAP configuration:")
	  for k,v in pairs(wifi.ap.getdefaultconfig(true)) do
		  print("   "..k.." :",v)
	  end
	end

	--Get default SoftAP configuration (OLD FORMAT)
	do
	  local ssid, password=wifi.ap.getdefaultconfig()
	  print("\n  Default SoftAP configuration:\n   SSID : "..ssid..
		"\n   Password  :",password)
	  ssid, password=nil, nil
	end
end

function WiFi_Module.ap.getip()
--[[	wifi.ap.getip()		-	Gets IP address, netmask and gateway in AP mode.
	Syntax		-	wifi.ap.getip()
	Parameters	-	none
	Returns		-	IP address, netmask, gateway address as string, for example "192.168.0.111", returns nil if IP address = "0.0.0.0".
]]--
	return wifi.ap.getip()
end

function WiFi_Module.ap.getmac()
--[[	wifi.ap.getmac()	-	Gets MAC address in AP mode.
	Syntax		-	wifi.ap.getmac()
	Parameters	-	none
	Returns		-	MAC address as string, for example "1A-33-44-FE-55-BB"

]]--
	return wifi.ap.getmac()
end

function WiFi_Module.ap.setip(cfg)
--[[	wifi.ap.setip()		-	Sets IP address, netmask and gateway address in AP mode.
	Syntax		-	wifi.ap.setip(cfg)
	Parameters	-	cfg table contain IP address, netmask, and gateway
	Returns		-	true if successful, false otherwise
]]--
	Example
	cfg =
	{
		ip="192.168.1.1",
		netmask="255.255.255.0",
		gateway="192.168.1.1"
	}
	wifi.ap.setip(cfg)
end

function WiFi_Module.ap.setmac(mac)
--[[	wifi.ap.setmac()	-	Sets MAC address in AP mode.
	Syntax		-	wifi.ap.setmac(mac)
	Parameters	-	MAC address in byte string, for example "AC-1D-1C-B1-0B-22"
	Returns		-	true if success, false otherwise
]]--
	--mac = "AC-1D-1C-B1-0B-22"
	return wifi.ap.setmac(mac)
end
	-----------------------------------------------------------------------------------------------------------------------------------
	-------------------------------------                    WIFI AP DHCP  Module Module            -----------------------------------
	-----------------------------------------------------------------------------------------------------------------------------------
function WiFi_Module.ap.dhcp.config(dhcp_config)
--[[	wifi.ap.dhcp.config()	-	Configure the dhcp service. Currently only supports setting the start address of the dhcp address pool.
	Syntax		-	wifi.ap.dhcp.config(dhcp_config)
	Parameters	-	dhcp_config table containing the start-IP of the DHCP address pool, eg. "192.168.1.100"
	Returns		-	pool_startip, pool_endip
]]--
	return wifi.ap.dhcp.config(dhcp_config)
end

function WiFi_Module.ap.dhcp.start()
--[[	wifi.ap.dhcp.start()	-	Starts the DHCP service.
	Syntax		-	wifi.ap.dhcp.start()
	Parameters	-	none	
	Returns		-	boolean indicating success
]]--
	return wifi.ap.dhcp.start()
end

function WiFi_Module.ap.dhcp.stop()
--[[	wifi.ap.dhcp.stop()		-	Stops the DHCP service.
		Syntax		-	wifi.ap.dhcp.stop()
		Parameters	-	none
		Returns		-	boolean indicating success
]]--
	return	wifi.ap.dhcp.stop()
end
	-----------------------------------------------------------------------------------------------------------------------------------
	-------------------------------------                    WIFI Event monitoring Module            ----------------------------------
	-----------------------------------------------------------------------------------------------------------------------------------
function WiFi_Module
--[[	wifi.eventmon.register()	-	Register/unregister callbacks for WiFi event monitor.
	Syntax		-	wifi.eventmon.register(Event[, function(T)])
	Parameters	-	Event: WiFi event you would like to set a callback for.
					Valid WiFi events:
						wifi.eventmon.STA_CONNECTED
						wifi.eventmon.STA_DISCONNECTED
						wifi.eventmon.STA_AUTHMODE_CHANGE
						wifi.eventmon.STA_GOT_IP
						wifi.eventmon.STA_DHCP_TIMEOUT
						wifi.eventmon.AP_STACONNECTED
						wifi.eventmon.AP_STADISCONNECTED
						wifi.eventmon.AP_PROBEREQRECVED
	Returns		-	
		Function:	nil

		Callback:	T: Table returned by event.
						wifi.eventmon.STA_CONNECTED Station is connected to access point.
							SSID: SSID of access point.
							BSSID: BSSID of access point.
							channel: The channel the access point is on.
						wifi.eventmon.STA_DISCONNECTED: Station was disconnected from access point.
							SSID: SSID of access point.
							BSSID: BSSID of access point.
							REASON: See wifi.eventmon.reason below.
						wifi.eventmon.STA_AUTHMODE_CHANGE: Access point has changed authorization mode.
							old_auth_mode: Old wifi authorization mode.
							new_auth_mode: New wifi authorization mode.
						wifi.eventmon.STA_GOT_IP: Station got an IP address.
							IP: The IP address assigned to the station.
							netmask: Subnet mask.
							gateway: The IP address of the access point the station is connected to.
						wifi.eventmon.STA_DHCP_TIMEOUT: Station DHCP request has timed out.
							Blank table is returned.
						wifi.eventmon.AP_STACONNECTED: A new client has connected to the access point.
							MAC: MAC address of client that has connected.
							AID: SDK provides no details concerning this return value.
						wifi.eventmon.AP_STADISCONNECTED: A client has disconnected from the access point.
							MAC: MAC address of client that has disconnected.
							AID: SDK provides no details concerning this return value.
						wifi.eventmon.AP_PROBEREQRECVED: A probe request was received.
							MAC: MAC address of the client that is probing the access point.
							RSSI: Received Signal Strength Indicator of client.
]]--

end
function WiFi_Module.eventmon.unregister(Event)
--[[	wifi.eventmon.unregister()	-	Unregister callbacks for WiFi event monitor.
	Syntax		-	wifi.eventmon.unregister(Event)
	Parameters	-	Event: WiFi event you would like to set a callback for.
					Valid WiFi events:
						wifi.eventmon.STA_CONNECTED
						wifi.eventmon.STA_DISCONNECTED
						wifi.eventmon.STA_AUTHMODE_CHANGE
						wifi.eventmon.STA_GOT_IP
						wifi.eventmon.STA_DHCP_TIMEOUT
						wifi.eventmon.AP_STACONNECTED
						wifi.eventmon.AP_STADISCONNECTED
						wifi.eventmon.AP_PROBEREQRECVED
	Returns		-	nil
	
]]--
	wifi.eventmon.unregister(Event)
end


return WiFi_Module