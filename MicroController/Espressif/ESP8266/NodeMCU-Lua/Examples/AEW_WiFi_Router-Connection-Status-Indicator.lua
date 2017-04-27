--[[
	Firmware : NodeMCU custom build by frightanic.com
	modules: bit,enduser_setup,file,gpio,http,i2c,mdns,mqtt,net,node,ow,pwm,rtcfifo,rtcmem,rtctime,sntp,tmr,uart,wifi
	required NodeMCu Modules : GPIO, WiFi, Node.
	http://esp8266iot.blogspot.in/
	http://aruneworld.blogspot.com/
	Tested By 	: Arun(20170219)
	Example Name : AEW_WiFi_Router-Connection-Status-Indicator.lua
]]--

--LED init
LED = 1 --GPIO-5 as connect to LED
gpio.mode(LED, gpio.OUTPUT)
gpio.write(LED, gpio.LOW)

--buzzer
Buzzer = 2 --GPIO-04 as connect to Buzzer
gpio.mode(Buzzer, gpio.OUTPUT)
gpio.write(Buzzer, gpio.LOW)

--wifi init
station_cfg={}
station_cfg.ssid= "Arun" station_cfg.pwd= "ArunEworld" -- Change your SSID and Password

wifi.setmode(wifi.STATION)
wifi.sta.config(station_cfg)
wifi.sta.connect()

--Wifi Event Monitoring
wifi.eventmon.register(wifi.eventmon.STA_CONNECTED, function(T)
	print("\n\tSTA - CONNECTED".."\n\tSSID: "..T.SSID.."\n\tBSSID: "..T.BSSID.."\n\tChannel: "..T.channel)
	Wifi_Router_Status = 1
end)

wifi.eventmon.register(wifi.eventmon.STA_DISCONNECTED, function(T)
	print("\n\tSTA - DISCONNECTED".."\n\tSSID: "..T.SSID.."\n\tBSSID: "..T.BSSID.."\n\treason: "..T.reason)
	Wifi_Router_Status = 0
end)

wifi.eventmon.register(wifi.eventmon.STA_GOT_IP, function(T)
	print("\n\tSTA - GOT IP".."\n\tStation IP: "..T.IP.."\n\tSubnet mask: "..T.netmask.."\n\tGateway IP: "..T.gateway)
	sta_ip = T.IP
end)

--Blink LED function
function Blink_Led()
	if ( 0 == gpio.read(LED)) then 
		gpio.write(LED, gpio.HIGH)
	elseif( 1 == gpio.read(LED)) then 
		gpio.write(LED, gpio.LOW)
	end 
	tmr.wdclr()
end

function Buzzer_Alarm()
	if ( 0 == gpio.read(Buzzer)) then 
		gpio.write(Buzzer, gpio.HIGH)
	elseif( 1 == gpio.read(Buzzer)) then 
		gpio.write(Buzzer, gpio.LOW)
	end 
	tmr.delay(100000)
	tmr.wdclr()
end

tmr.alarm(0,500,1,function()
	if( 1 == Wifi_Router_Status) then
		Blink_Led()
		gpio.write(Buzzer, gpio.LOW)
	elseif (0 == Wifi_Router_Status) then
		Buzzer_Alarm()
		gpio.write(LED, gpio.LOW)
		
	end
 end) --every second twice
