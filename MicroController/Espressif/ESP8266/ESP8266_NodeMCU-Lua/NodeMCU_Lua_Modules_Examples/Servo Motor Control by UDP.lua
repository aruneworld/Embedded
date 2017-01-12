--[[	Tested On Firmware details 
	NodeMCU custom build by frightanic.com
	branch: master
	commit: 81ec3665cb5fe68eb8596612485cc206b65659c9
	SSL: false
	modules: bit,enduser_setup,file,gpio,http,i2c,mdns,mqtt,net,node,ow,pwm,rtcfifo,rtcmem,rtctime,sntp,tmr,uart,wifi
 	build 	built on: 2016-12-22 09:22
 	powered by Lua 5.1.4 on SDK 1.5.4.1(39cb9a32)
]]--
-- http://esp8266iot.blogspot.in/
-- http://aruneworld.blogspot.com/
-- Tested By 	: Arun

-- Example 	: Servo Motor Control by UDP. (for this example you should need "NET Module" NodeMCU  Firmware	, and it is a simple program uing servo)
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
