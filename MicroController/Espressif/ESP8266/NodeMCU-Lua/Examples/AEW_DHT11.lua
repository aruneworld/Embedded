--[[Tested On Firmware and Details Below
	NodeMCU custom build by frightanic.com
	branch: master
	SSL: false
	modules: dht,file,gpio,mqtt,net,node,tmr,uart,wifi
 	powered by Lua 5.1.4 on SDK 1.5.4.1(39cb9a32)
]]--
-- http://esp8266iot.blogspot.in/
-- http://aruneworld.blogspot.com/
-- Tested By 	: Arun(20160812)
-- Example Name : AEW_DHT11.lua (this code is from NodeMCU DHT Module example
---------------------------------------------------------------------------
--Initializing DHT11_SENSOR Pins 
pin = 1 --GPIO-05
status, temp, humi, temp_dec, humi_dec = dht.read(pin)
if status == dht.OK then
    -- Integer firmware using this example
    print(string.format("DHT11 Temperature:%d.%03d;Humidity:%d.%03d\r\n",
          math.floor(temp),
          temp_dec,
          math.floor(humi),
          humi_dec
    ))

    -- Float firmware using this example
    print("DHT11 Temperature:"..temp..";".."Humidity:"..humi)

elseif status == dht.ERROR_CHECKSUM then
    print( "DHT11 Checksum error." )
elseif status == dht.ERROR_TIMEOUT then
    print( "DHT11 timed out." )
end
