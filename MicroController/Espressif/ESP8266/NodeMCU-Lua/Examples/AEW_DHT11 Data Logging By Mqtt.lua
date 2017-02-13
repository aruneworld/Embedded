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
-- Example Name : AEW_DHT11 Data Logging By Mqtt.lua


--Initializing DHT11_SENSOR Pins 
S1 = 1

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

--Function DHT11
function DHT11()
	status, temp, humi, temp_dec, humi_dec = dht.read(pin) --Read Data from the Sensor_1
	Sd = nil	--Send Date

	if status == dht.OK then
		-- Integer firmware using this example
		print(string.format("DHT_1 Temperature:%d.%03d;Humidity:%d.%03d\r\n", math.floor(temp),temp_dec,math.floor(humi),humi_dec))
		-- Float firmware using this example
		print("DHT_1 Temperature:"..temp..";".."Humidity:"..humi)
		Sd = "DHT_1 Temperature:"..temp..";".."Humidity:"..humi"
		m:publish(PUBLISH_TOPIC,Sd, 1, 0, function(conn)	end)	
	elseif status == dht.ERROR_CHECKSUM then
		print( "DHT_1 Checksum error." )
	elseif status == dht.ERROR_TIMEOUT then
		print( "DHT_1 timed out." )
	end
end


m:on("message", function(client, topic, data) 
	if data ~= nil then
		print(data)
	end
collectgarbage("collect")
end)

tmr.alarm(0,5000,1,DHT11)
