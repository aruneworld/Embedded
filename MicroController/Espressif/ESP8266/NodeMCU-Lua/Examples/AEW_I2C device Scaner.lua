--[[	Tested On Firmware and Details Below
	NodeMCU custom build by frightanic.com
	branch: master
	modules: bit,enduser_setup,file,gpio,http,i2c,mdns,mqtt,net,node,ow,pwm,rtcfifo,rtcmem,rtctime,sntp,tmr,uart,wifi
 	powered by Lua 5.1.4 on SDK 1.5.4.1(39cb9a32)
]]--
-- http://esp8266iot.blogspot.in/
-- http://aruneworld.blogspot.com/
-- Tested By 	: Arun(20170112)
-- Example Name : I2C device Scaner


-- setup
id	=	0						--	always 0
pinSDA	=	2						--	1~12, IO index
pinSCL	=	1						--	1~12, IO index
speed	=	i2c.SLOW					--	only i2c.SLOW supported

--Initialize
i2c.setup(id, pinSDA, pinSCL, speed)				--	Initialize the I²C module.

print("Scanning Started....")
for count = 0,127 do
  i2c.start(id)							--	Send an I²C start condition.
  Status = i2c.address(id, count, i2c.TRANSMITTER)		--	Setup I²C address and read/write mode for the next transfer.
  i2c.stop(id)							--	Send an I²C stop condition.
	if Status == true then
		print("Addrss - "..count.." Detected device address is  0x" .. string.format("%02x", count) .. " (" .. count ..")") 
	elseif Status == false then
		print("Addrss - "..count.." nil") 
	end
end
print("Scanning End")
