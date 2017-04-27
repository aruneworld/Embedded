--[[	Tested On Firmware and Details Below
	NodeMCU custom build by frightanic.com
	branch: master
	modules: bit,enduser_setup,file,gpio,http,i2c,mdns,mqtt,net,node,ow,pwm,rtcfifo,rtcmem,rtctime,sntp,tmr,uart,wifi
 	powered by Lua 5.1.4 on SDK 1.5.4.1(39cb9a32)
]]--
-- http://esp8266iot.blogspot.in/
-- http://aruneworld.blogspot.com/
-- Tested By 	: Arun(20170112)
-- Example Name : AEW_I2C_DeviceScaner.lua
----------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------   Method-1  -----------------------------------------------


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

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------    Method-2  ------------------------- 

-- Based on work by sancho and zeroday among many other open source authors
-- This code is public domain, attribution to gareth@l0l.org.uk appreciated.

id=0  -- need this to identify (software) IC2 bus?
gpio_pin= {5,4,0,2,14,12,13} -- this array maps internal IO references to GPIO numbers

-- user defined function: see if device responds with ACK to i2c start
function find_dev(i2c_id, dev_addr)
     i2c.start(i2c_id)
     c=i2c.address(i2c_id, dev_addr ,i2c.TRANSMITTER)
     i2c.stop(i2c_id)
     return c
end

print("Scanning all pins for I2C Bus device")
for scl=1,7 do
     for sda=1,7 do
          tmr.wdclr() -- call this to pat the (watch)dog!
          if sda~=scl then -- if the pins are the same then skip this round
               i2c.setup(id,sda,scl,i2c.SLOW) -- initialize i2c with our id and current pins in slow mode :-)
               for i=0,127 do -- TODO - skip invalid addresses 
                    if find_dev(id, i)==true then
                    print("Device found at address 0x"..string.format("%02X",i))
                    print("Device is wired: SDA to GPIO"..gpio_pin[sda].." - IO index "..sda)
                    print("Device is wired: SCL to GPIO"..gpio_pin[scl].." - IO index "..scl)
                    end
               end
          end
     end
end
