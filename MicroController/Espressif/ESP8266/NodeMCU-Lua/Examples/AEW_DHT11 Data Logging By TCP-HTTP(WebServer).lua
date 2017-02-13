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
-- Example Name : AEW_DHT11 Data Logging By TCP-HTTP(WebServer).lua

--Initializing DHT11_SENSOR Pins 
pin = 1


Sd = nil	--Send Data
ServerIP = 192.168.4.5 -- Set Host server IP
Log_Name = "Arun_DHT11_Server"

--Function DHT11
function DHT11()
	status, temp, humi, temp_dec, humi_dec = dht.read(pin) --Read Data from the Sensor
	if status == dht.OK then
		-- Integer firmware using this example
		print(string.format("DHT_1 Temperature:%d.%03d;Humidity:%d.%03d\r\n", math.floor(temp),temp_dec,math.floor(humi),humi_dec))
		-- Float firmware using this example
		print("DHT_1 Temperature:"..temp..";".."Humidity:"..humi)
		Sd = "DHT_1 Temperature:"..temp..";".."Humidity:"..humi"
	elseif status == dht.ERROR_CHECKSUM then
		print( "DHT_1 Checksum error." )
	elseif status == dht.ERROR_TIMEOUT then
		print( "DHT_1 timed out." )
	end
end

srv=net.createServer(net.TCP)
srv:listen(port,
    function(conn)
        conn:send("HTTP/1.1 200 OK\nContent-Type: text/html\nRefresh: 5\n\n" ..
            "<!DOCTYPE HTML>" ..
            "<html><body>" ..
            "<b>ESP8266</b></br>" ..
            "Time and Date: " ..Sd.. "<br>" ..
            "Node ChipID : " .. node.chipid() .. "<br>" ..
            "Node MAC : " .. wifi.sta.getmac() .. "<br>" ..
            "Node Heap : " .. node.heap() .. "<br>" ..
            "Timer Ticks : " .. tmr.now() .. "<br>" ..
            "</html></body>")
        conn:on("sent",function(conn) conn:close() end)
    end
)

tmr.alarm(0,5000,1,DHT11)
