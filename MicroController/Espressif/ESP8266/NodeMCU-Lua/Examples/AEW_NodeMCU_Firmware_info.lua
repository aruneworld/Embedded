-- this program will help if ESPlorer is shows 
--'Can't autodetect firmware, because proper answer
-- not received (may be unknown firmware).  
--Please, reset module or continue.'

--[[		Tested On Firmware and Details Below
	NodeMCU custom build by frightanic.com
	branch: master
	SSL: false
	modules: bit,enduser_setup,file,gpio,http,i2c,mdns,mqtt,net,node,ow,pwm,rtcfifo,rtcmem,rtctime,sntp,tmr,uart,wifi
 	powered by Lua 5.1.4 on SDK 1.5.4.1(39cb9a32)
]]--
-- http://esp8266iot.blogspot.in/
-- http://aruneworld.blogspot.com/
-- Tested By 	: Arun(20170219)
-- Example Name : AEW_NodeMCU_Firmware_info.lua

-----------------------------------------------------------
-- functions {require}
-- lightfunction{print, dofile}
-- table {package}
--Please update all modules name in below two tables- > Module_Names , Modules

Module_Names ={	'adc','adxl345','am2320','apa102','bit','bme280','bmp085','cjsom','coap','collectgarbage','cron','crypto','dht','dofile','encoder','enduser_setup',
				'file','gdbstub','gpio','hmc5883l','http','hx711','i2c','loadfile','l3g4200d','mdns','mqtt','net','node','ow','package','pcm','pref','print', 'pwm',
				'rc','require','rfswitch','rotary','rtcfifo','rtcmem','rtctime','sigma_delta','sntp','somfy','spi','struct','switec',
				'tls','tm1829','tmr','tsl2561', 'u8g','uart','ucg','websocket', 'wifi', 'wps', 'ws2801', 'ws2812'}

Modules = {		adc, adxl345, am2320, apa102,bit, bme280, bmp085, cjson, coap,collectgarbage, cron, crypto, dht,dofile, encoder, enduser_setup, file, gdbstub,gpio,
				hmc5883l, http, hx711, i2c,loadfile, l3g4200d, mdns, mqtt, net, node, ow,package,pcm, pref, print, pwm, rc, require,rfswitch, rotary, rtcfifo, rtcmem, rtctime,
				sigma_delta, sntp, somfy, spi, struct, switec, tls, tm1829, tmr, tsl2561, u8g, uart, ucg, websocket, wifi, wps, ws2801, ws2812}

print("total Modules : "..#Module_Names)
--_version
print("Firmware conatains Modlues are ")
total_modules = 0
for count = 1,#Module_Names do
	if nil ~= (Modules[count]) then
		total_modules = total_modules + 1
		print("Modulue- "..count.." : "..Module_Names[count],Modules[count])
	end
end
print("Firmware conatains Total Modlues are : "..total_modules)
