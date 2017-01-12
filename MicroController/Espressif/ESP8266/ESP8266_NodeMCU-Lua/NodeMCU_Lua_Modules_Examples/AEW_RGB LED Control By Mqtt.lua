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
-- Example Name : AEW_RGB LED Control By Mqtt.lua

--Initializing PWM Pins
R_PIN	=	1
G_PIN	=	2
B_PIN	=	5

--init Duty cycle
R_DUTY	=	0
G_DUTY	=	0
B_DUTY	=	0

-- Init PWM setup
pwm.setup(R_PIN, 999, 512)
pwm.setup(G_PIN, 999, 512)
pwm.setup(B_PIN, 999, 512)

--Initializing Mqtt
DEVICE_NAME 	=	node.chipid()
PUBLISH_TOPIC 	= 	"ArunEworld/"..DEVICE_NAME.."-Result"
SUBSCRIBE_TOPIC = 	"ArunEworld/"..DEVICE_NAME
CLIENT_ID 		= 	node.chipid()
USERNAME 		= 	"username"			-- please change your username
PASSWORD 		= 	"Password"			-- please change your Password
HOSTNAME 		= 	"hostname.com"			-- Please change your port
PORT 			= 	"Port_Number"			-- Please change your port number

-- Mqtt Setup
m = mqtt.Client(CLIENT_ID, 120, USERNAME, PASSWORD, 0)
	m:connect(HOSTNAME, PORT, 0, function(conn) 
	m:publish(PUBLISH_TOPIC,DEVICE_NAME.." is Online", 1, 0, function(conn)	end)
	m:subscribe(SUBSCRIBE_TOPIC, 1, function(conn)	end)
end)

m:on("message", function(client, topic, payload) 		--	payload formate "rgb(0,255,0)"
		if nil ~= string.find(payload, "rgb") then	
				_,	_,	R_DUTY,	G_DUTY,	B_DUTY = string.find(payload, "(%d+),(%d+),(%d+)") 		--which we store in the dummy variable _
				PWM_SetColor(R_DUTY, G_DUTY, B_DUTY)
		end
	collectgarbage("collect")
end)

--Light Function
function PWM_SetColor(R_DUTY, G_DUTY, B_DUTY)
	pwm.setduty(R_PIN, R_DUTY)  
	pwm.setduty(G_PIN, G_DUTY) 
	pwm.setduty(B_PIN, B_DUTY)
end
