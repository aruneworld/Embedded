-- Tested On Firmware and Details Below
--[[
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
-- Example Name : AEW_RGB LED Control By UDP.lua

 --SetUp Pins
redPin		=	1
greenPin	=	2
bluePin		=	5
port		=	88

-- PWM frequency
pwmFreq = 900

-- set up PWM pins
pwm.setup(redPin, pwmFreq, 0)
pwm.setup(greenPin, pwmFreq, 0)
pwm.setup(bluePin, pwmFreq, 0)

-- start PWM
pwm.start(redPin)
pwm.start(greenPin)
pwm.start(bluePin)

-- create UDP server
srv = net.createServer(net.UDP)
srv:on("receive",function(cu,payload)
	-- we expect the packet in "R,G,B" format
	-- thus use the split function from our functions file (similar to php explode, returning an array)
	print(payload)	--payload String formate is rgb(0,255,0)
		 
	if nil ~= string.find(payload, "rgb") then		
		_,	_,	red, green,	blue = string.find(payload, "(%d+),(%d+),(%d+)") 		--which we store in the dummy variable " _,"
		pwm.setduty(redPin, red*4)
		pwm.setduty(greenPin, green*4)
		pwm.setduty(bluePin, blue*4)
	end
end)
srv:listen(port)	-- listen for our color changes