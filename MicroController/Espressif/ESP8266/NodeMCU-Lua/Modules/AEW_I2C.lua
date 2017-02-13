-- http://nodemcu.readthedocs.io/en/master/en/modules/i2c/ 

--[[
http://esp8266iot.blogspot.in/
http://aruneworld.blogspot.com/
https://github.com/adalurarun/Embedded_System/MicroController/Espressif/ESP8266
Copyright Arun 2016-2017
MIT License

If you like this project, please add a star!
]]--

	-----------------------------------------------------------------------------------------------------------------------------------
	-----------------------------------------------	I2C Module	-------------------------------------------------------------------
	-----------------------------------------------------------------------------------------------------------------------------------
local I2C = ...			-- Obtain a sample value from somewhere
local I2C_Module =  {}	-- conI2C an empty table and assign it to variable "Table_name" (ex: local Arun =  {})
_G[I2C] = I2C_Module	--	A global variable (not a function) that holds the global environment

function I2C_Module
--[[	i2c.address()	-	Setup I²C address and read/write mode for the next transfer.
	Syntax		-	i2c.address(id, device_addr, direction)
	Parameters	-	id always 0
					device_addr device address
					direction i2c.TRANSMITTER for writing mode , i2c. RECEIVER for reading mode
	Returns		-	true if ack received, false if no ack received.
]]--
end

function I2C_Module
--[[	i2c.read()	-	Read data for variable number of bytes.
	Syntax		-	i2c.read(id, len)
	Parameters	-	id always 0
					len number of data bytes
	Returns		-	string of received data
	Example
			id  = 0
			sda = 1
			scl = 2

			-- initialize i2c, set pin1 as sda, set pin2 as scl
			i2c.setup(id, sda, scl, i2c.SLOW)

			-- user defined function: read from reg_addr content of dev_addr
			function read_reg(dev_addr, reg_addr)
				i2c.start(id)
				i2c.address(id, dev_addr, i2c.TRANSMITTER)
				i2c.write(id, reg_addr)
				i2c.stop(id)
				i2c.start(id)
				i2c.address(id, dev_addr, i2c.RECEIVER)
				c = i2c.read(id, 1)
				i2c.stop(id)
				return c
			end

			-- get content of register 0xAA of device 0x77
			reg = read_reg(0x77, 0xAA)
			print(string.byte(reg))
]]--
end

function I2C_Module
--[[	i2c.setup()	-	Initialize the I²C module.
	Syntax		-	i2c.setup(id, pinSDA, pinSCL, speed)
	Parameters	-	id always 0
					pinSDA 1~12, IO index
					pinSCL 1~12, IO index
					speed only i2c.SLOW supported
	Returns		-	speed the selected speed
]]--
end

function I2C_Module
--[[	i2c.start()	-	Send an I²C start condition.
	Syntax		-	i2c.start(id)
	Parameters	-	id always 0
	Returns		-	nil
]]--
end

function I2C_Module
--[[	i2c.stop()	-	Send an I²C stop condition.
	Syntax		-	i2c.stop(id)
	Parameters	-	id always 0
	Returns		-	nil
]]--
end
function I2C_Module
--[[	i2c.write()	-	Write data to I²C bus. Data items can be multiple numbers, strings or lua tables.
	Syntax		-	i2c.write(id, data1(, data2(, ..., datan)))	
	Parameters	-	id always 0
					data data can be numbers, string or lua table.
	Returns		-	number number of bytes written
	Example
		i2c.write(0, "hello", "world")
]]--
end

return I2C_Module