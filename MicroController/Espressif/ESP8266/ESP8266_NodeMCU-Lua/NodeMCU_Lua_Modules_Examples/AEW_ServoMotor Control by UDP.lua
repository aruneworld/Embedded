--[[	Tested On Firmware details 
	NodeMCU custom build by frightanic.com
	branch: master
	SSL: false
	modules: bit,enduser_setup,file,gpio,http,i2c,mdns,mqtt,net,node,ow,pwm,rtcfifo,rtcmem,rtctime,sntp,tmr,uart,wifi
 	powered by Lua 5.1.4 on SDK 1.5.4.1(39cb9a32)
]]--
-- http://esp8266iot.blogspot.in/
-- http://aruneworld.blogspot.com/
-- Tested By 	: Arun (20170112)

-- Example 	: AEW_ServoMotor Control by UDP.lua (for this example you should need "NET Module" NodeMCU  Firmware	, and it is a simple program uing servo)
-- Servo Motor	Date Sheet :	http://www.micropik.com/PDF/SG90Servo.pdf


--Setup 
port	=	88
pin		=	1
gpio.mode(pin,gpio.OUTPUT)							-- Initialize pin to GPIO mode, set the pin in/out direction, and optional internal weak pull-up.
server 	= net.createServer(net.UDP)					-- Creates a server.
PayLoad = nil

server:on("receive", function(server, PayLoad)		--	UDP server only: Register callback functions for specific events.
   print("Recevied PayLoad : "..PayLoad)
   ServoMotor(PayLoad)		--	ServoMotor func Call
end)
server:listen(port)									--	Listen on port from IP address.

function ServoMotor(PayLoad)
	tmr.alarm(2,PayLoad,1,function()				-- Timer Alarm	
			gpio.write(pin,gpio.HIGH)				-- Set digital GPIO pin value.
				tmr.delay(PayLoad/2)
			gpio.write(pin,gpio.LOW)
		end)		
end
