--[[		Tested On Firmware and Details Below
	NodeMCU custom build by frightanic.com
	branch: master
	SSL: false
	modules: bit,enduser_setup,file,gpio,http,i2c,mdns,mqtt,net,node,ow,pwm,rtcfifo,rtcmem,rtctime,sntp,tmr,uart,wifi
 	powered by Lua 5.1.4 on SDK 1.5.4.1(39cb9a32)
]]--
-- http://esp8266iot.blogspot.in/
-- http://aruneworld.blogspot.com/
-- Tested By 	: Arun(20170112)
-- Example Name : AEW_Relay Control By Mqtt.lua

--Initializing GPIO Pins
pin		=	1

-- Init GPIO setup
gpio.mode(pin, gpio.OUTPUT)

--Initializing Mqtt
DEVICE_NAME 	=	node.chipid()
PUBLISH_TOPIC 	= 	"ArunEworld/"..DEVICE_NAME.."-Result"
SUBSCRIBE_TOPIC = 	"ArunEworld/"..DEVICE_NAME
CLIENT_ID 		= 	node.chipid()
USERNAME 		= 	"username"				--	please change your username
PASSWORD 		= 	"Password"				--	please change your Password
HOSTNAME 		= 	"hostname.com"			--  Please change your port
PORT 			= 	"Port_Number"			--	Please change your port number

-- Mqtt Setup
m = mqtt.Client(CLIENT_ID, 120, USERNAME, PASSWORD, 0)
	m:connect(HOSTNAME, PORT, 0, function(conn) 
	m:publish(PUBLISH_TOPIC,DEVICE_NAME.." is Online", 1, 0, function(conn)	end)
	m:subscribe(SUBSCRIBE_TOPIC, 1, function(conn)	end)
end)

m:on("message", function(client, topic, payload) 		
		if payload == "ON" then	
			gpio.write(pin, gpio.HIGH)
		elseif payload == "OFF" then
			gpio.write(pin, gpio.LOW)
		else
			print(payload)
		end
	collectgarbage("collect")
end)
