--www.ArunEworld.com/embedded/esp8266/esp8266-nodemcu/

--Required NodeMCU Firmware Modules
require("tmr")
require("wifi")

--WiFi Credentials Set
SSID		=	"ArunEwold"
PASSWORD	=	"8300026060"

--Timer parameters Set
TIMER_ID = 0
TIMER_DELAY_DURATION = 1000		--1second
TIMER_MODE = 1		--Repeatably

--WiFi Configuration
wifi.sta.config(SSID, PASSWORD)

--Local WiFi IP Address Monitor User Defined Function with No Arguments
local function WiFi_IP_ADDRESS_STATUS_MONITOR()
	--Check the IP address i if loop using Wifi.sta.getip() function
	if wifi.sta.getip()==nil then
      print("connecting to "..SSID.." :- AP...") 
   else
      print("Connected to "..SSID.." ip : "..wifi.sta.getip())
      tmr.stop(0)						-- Stop the timer
   end

end

--timer alarm function 
tmr.alarm(TIMER_ID, TIMER_DELAY_DURATION, TIMER_MODE, function() WiFi_IP_ADDRESS_STATUS_MONITOR()	end)
