-- Tested On Firmware and Details Below
--[[
	NodeMCU custom build by frightanic.com
	branch: master
	SSL: false
	modules: bit,enduser_setup,file,gpio,http,i2c,mdns,mqtt,net,node,ow,pwm,rtcfifo,rtcmem,rtctime,sntp,tmr,uart,wifi
 	powered by Lua 5.1.4 on SDK 1.5.4.1(39cb9a32)
]]--
-- http://esp8266iot.blogspot.in/
-- http://aruneworld.blogspot.com/
-- Tested By 	: Arun (20170112)
-- Example Name : AEW_Relay Control By UDP.lua

--Initializing GPIO Pins
pin		=	1

-- Init GPIO setup
gpio.mode(pin, gpio.OUTPUT)

-- create UDP server
srv = net.createServer(net.UDP)
srv:on("receive",function(cu,payload)
	if payload == "ON" then	
			gpio.write(pin, gpio.HIGH)
		elseif payload == "OFF" then
			gpio.write(pin, gpio.LOW)
		else
			print(payload)
		end
end)
srv:listen(port) -- listen for our color changes
