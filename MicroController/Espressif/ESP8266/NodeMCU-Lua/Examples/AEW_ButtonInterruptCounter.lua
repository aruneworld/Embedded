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
-- Example Name : AEW_ButtonInterruptCounter.lua
------------------------------------------------------------------------------------------


-- Count pulses on GPIO2
 
count = 0
delay = 0
gpio.mode(9,gpio.INT,gpio.PULLUP)

function counter(level)
   x = tmr.now()
   if x > delay then
      delay = tmr.now()+250000
      count = count + 1
      print(count)
      end
   end
gpio.trig(9, "down",counter)
