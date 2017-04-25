--[[
	NodeMCU custom build by frightanic.com
	branch: master
	SSL: false
	modules: bit,enduser_setup,file,gpio,http,i2c,mdns,mqtt,net,node,ow,pwm,rtcfifo,rtcmem,rtctime,sntp,tmr,uart,wifi
 	powered by Lua 5.1.4 on SDK 1.5.4.1(39cb9a32)

-- http://esp8266iot.blogspot.in/
-- http://aruneworld.blogspot.com/
-- Tested By 	: Arun(20170112)
-- Example Name : AEW_AEW_LED-Blink.lua

]]--

--[[
Required NodeMCU Modules
	Timer Module
	GPIO Module
Required Hardware and Software Tools
	ESP8266 with Programmer
	LED_Blink_Time
	ESPLorer IDE.
]]--

LED_Pin = 1 -- GPIO-5
LED_Blink_Time = 1000 -- ms
gpio.mode(LED_Pin, gpio.OUTPUT)
local function Blink()
	if ( 0 == gpio.read(LED_Pin)) then 
		gpio.write(LED_Pin, gpio.HIGH)
	elseif( 1 == gpio.read(LED_Pin)) then 
		gpio.write(LED_Pin, gpio.LOW)
	end 
end

tmr.alarm(0,LED_Blink_Time,1,function() Blink() end)
