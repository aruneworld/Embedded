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
-- Example Name : AEW_MCP23017_LEDs.lua
------------------------------------------------------------------------------------------
-- i2c setup
local id		=	0						--	always 0
local pinSDA	=	2						--	1~12, IO index 
local pinSCL	=	1						--	1~12, IO index
local speed	=	i2c.SLOW				--	only i2c.SLOW supported

--Rotate LEDs
Shift_1 = {1,2,4,8,16,32,64,128}
Shift_2 = {128,64,32,16,8,4,2,1}


-- CONSTANTS
local MCP23017_ADDRESS = 0x21	-- you can chage this id, i used ox21

-- MCP23017 registers (everything except direction defaults to 0)

local IODIRA   = 0x00   -- I/O DIRECTION REGISTE  (0 = output, 1 = input (Default))
local IODIRB   = 0x01

local IPOLA   = 0x02   -- INPUT POLARITY REGISTER   (0 = normal, 1 = inverse)
local IPOLB   = 0x03

--GPINTEN – INTERRUPT-ON-CHANGE PINS
local GPINTENA = 0x04   -- Interrupt on change (0 = disable, 1 = enable)
local GPINTENB = 0x05

local DEFVALA  = 0x06   -- Default comparison for interrupt on change (interrupts on opposite)
local DEFVALB  = 0x07

local INTCONA  = 0x08   -- Interrupt control (0 = interrupt on change from previous, 1 = interrupt on change from DEFVAL)
local INTCONB  = 0x09

local IOCON    = 0x0A   -- IO Configuration: bank/mirror/seqop/disslw/haen/odr/intpol/notimp
--IOCON 	 = 0x0B	  -- same as = 0x0A

local GPPUA    = 0x0C   -- GPIO PULL-UP RESISTOR REGISTERull-up resistor (0 = disabled, 1 = enabled)
local GPPUB    = 0x0D

local INFTFA   = 0x0E   -- Interrupt flag (read only) : (0 = no interrupt, 1 = pin caused interrupt)
local INFTFB   = 0x0F

local INTCAPA  = 0x10   -- Interrupt capture (read only) : value of GPIO at time of last interrupt
local INTCAPB  = 0x11

local GPIOA    = 0x12   -- Port value. Write to change, read to obtain value
local GPIOB    = 0x13

local OLLATA   = 0x14   -- Output latch. Write to latch output.
local OLLATB   = 0x15

local chip1 = 0x20  -- MCP23017 is on I2C address = 0x20
local chip2 = 0x21  -- MCP23017 is on I2C address = 0x21


-- user defined function: read from reg_addr content of dev_addr	--write MCP23017 start
function read_reg(MCP23017_ADDRESS, reg_addr)
    i2c.start(id)
    i2c.address(id, MCP23017_ADDRESS, i2c.TRANSMITTER)
    i2c.write(id, reg_addr)
    i2c.stop(id)
    i2c.start(id)
    i2c.address(id, MCP23017_ADDRESS, i2c.RECEIVER)
	c =string.byte(i2c.read(id, 1))
    i2c.stop(id)
    return c
end --read MCP23017 end

--write MCP23017 start
function write_reg(MCP23017_ADDRESS, reg_addr, reg_val)
	i2c.start(id)
    i2c.address(id, MCP23017_ADDRESS, i2c.TRANSMITTER)
    i2c.write(id, reg_addr)
	i2c.write(id, reg_val)
    i2c.stop(id)
end --write MCP23017 end

--MCP Initialize start
function init(MCP23017_ADDRESS)
	write_reg(MCP23017_ADDRESS, IOCON, 0x60) --  BANK=0, MIRROR=1, SEQOP=1, DISSLW=0, HAEN=0, ODR=0, INTPO=0, bit0=nil
	write_reg(MCP23017_ADDRESS, IODIRA, 0x00) -- Port A as Output
	write_reg(MCP23017_ADDRESS,GPIOA, 0xFF) -- Set All port A pins High

end --MCP Initialize end

-----------Main Program start------------------

i2c_speed = i2c.setup(id, pinSDA, pinSCL, speed) --	Initialize the I²C module. 
if i2c_speed ~= nil then
	print("i2c Speed : "..i2c_speed)
	print("i2c init done") 
else 
	print("i2c init not done!!")
end
--init MCP23017
init(MCP23017_ADDRESS)

--Blink all LEDs Once
function blink()
write_reg(0x21,GPIOA, 0xFF)
tmr.delay(1000000)
write_reg(0x21,GPIOA, 0x00)
end

--Loop
function Shift()
	for i = 1, #Shift_1 do
	write_reg(0x21,GPIOA, Shift_1[i])
	tmr.delay(100000)
	end
	blink()
	for j = 1, #Shift_2 do
	write_reg(0x21,GPIOA, Shift_2[j])
	tmr.delay(100000)
	end
	blink()
	tmr.delay(100000)
	Shift()
end

tmr.alarm(0, 500,0, Shift)