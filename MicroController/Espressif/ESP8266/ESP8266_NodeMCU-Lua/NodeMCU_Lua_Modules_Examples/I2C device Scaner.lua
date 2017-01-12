-- http://esp8266iot.blogspot.in/
-- http://aruneworld.blogspot.com/
-- I2C device Scaner
-- Arun

-- setup
id		=	0											--	always 0
pinSDA	=	2											--	1~12, IO index
pinSCL	=	1											--	1~12, IO index
speed	=	i2c.SLOW									--	only i2c.SLOW supported

--Initialize
i2c.setup(id, pinSDA, pinSCL, speed)					--	Initialize the I²C module.

print("Scanning Started....")
for count = 0,127 do
  i2c.start(id)											--	Send an I²C start condition.
  Status = i2c.address(id, count, i2c.TRANSMITTER)		--	Setup I²C address and read/write mode for the next transfer.
  i2c.stop(id)											--	Send an I²C stop condition.
	if Status == true then
		print("Addrss - "..count.." Detected device address is  0x" .. string.format("%02x", count) .. " (" .. count ..")") 
	elseif Status == false then
		print("Addrss - "..count.." nil") 
	end
end
print("Scanning End")
