local moduleName = ... 
local M = {}
_G[moduleName] = M 


-- i2c setup
id		=	0						--	always 0
pinSDA	=	2						--	1~12, IO index
pinSCL	=	1						--	1~12, IO index
speed	=	i2c.SLOW				--	only i2c.SLOW supported
INT_pin = 5		--gpio
gpio.mode(INT_pin,gpio.INT)

-- CONSTANTS
local MCP23017_ADDRESS = 0x20
-- MCP23017 registers (everything except direction defaults to 0)

IODIRA   = 0x00   -- I/O DIRECTION REGISTE  (0 = output, 1 = input (Default))
IODIRB   = 0x01

IPOLA   = 0x02   -- INPUT POLARITY REGISTER   (0 = normal, 1 = inverse)
IPOLB   = 0x03

--GPINTEN – INTERRUPT-ON-CHANGE PINS
GPINTENA = 0x04   -- Interrupt on change (0 = disable, 1 = enable)
GPINTENB = 0x05

DEFVALA  = 0x06   -- Default comparison for interrupt on change (interrupts on opposite)
DEFVALB  = 0x07

INTCONA  = 0x08   -- Interrupt control (0 = interrupt on change from previous, 1 = interrupt on change from DEFVAL)
INTCONB  = 0x09

IOCON    = 0x0A   -- IO Configuration: bank/mirror/seqop/disslw/haen/odr/intpol/notimp
--IOCON 	 = 0x0B	  -- same as = 0x0A

GPPUA    = 0x0C   -- GPIO PULL-UP RESISTOR REGISTERull-up resistor (0 = disabled, 1 = enabled)
GPPUB    = 0x0D

INFTFA   = 0x0E   -- Interrupt flag (read only) : (0 = no interrupt, 1 = pin caused interrupt)
INFTFB   = 0x0F

INTCAPA  = 0x10   -- Interrupt capture (read only) : value of GPIO at time of last interrupt
INTCAPB  = 0x11

GPIOA    = 0x12   -- Port value. Write to change, read to obtain value
GPIOB    = 0x13

OLLATA   = 0x14   -- Output latch. Write to latch output.
OLLATB   = 0x15

chip1 = 0x20  -- MCP23017 is on I2C address = 0x20
chip2 = 0x21  -- MCP23017 is on I2C address = 0x21


-- user defined function: read from reg_addr content of dev_addr
function M.read_reg(reg_addr)
    i2c.start(id)
    i2c.address(id, MCP23017_ADDRESS, i2c.TRANSMITTER)
    i2c.write(id, reg_addr)
    i2c.stop(id)
    i2c.start(id)
    i2c.address(id, MCP23017_ADDRESS, i2c.RECEIVER)

--    c =string.byte(i2c.read(id, 1))
	c =string.byte(i2c.read(id, 1))
    i2c.stop(id)
--	print("Readed 0x"..reg_addr.." Value  is : "..c)
    return c
end

function M.write_reg(reg_addr, reg_val)
	i2c.start(id)
    i2c.address(id, MCP23017_ADDRESS, i2c.TRANSMITTER)
    i2c.write(id, reg_addr)
	i2c.write(id, reg_val)
    i2c.stop(id)
end


--i2c Initialize
function M.init()
	local i2c_Speed = i2c.setup(id, pinSDA, pinSCL, speed) --	Initialize the I²C module. 

	PortA_PortB_Interrupt()
	PortA_PortB_Input()
	PortA_PortB_Output()
	return i2c_Speed
end

function PortA_PortB_Interrupt()
	M.write_reg(IOCON, 0x60) --  BANK=0, MIRROR=1, SEQOP=1, DISSLW=0, HAEN=0, ODR=0, INTPO=0, bit0=nil
	M.write_reg(GPPUA, 0xFF) -- port A pullup enabled
	M.write_reg(GPPUB, 0xFF) -- port B pullup enabled
	M.write_reg(IPOLA, 0xFF) -- port A pullup enabled
	M.write_reg(IPOLB, 0xFF) -- port B pullup enabled
	M.write_reg(GPINTENA, 0xFF) -- port A interrupt enabled
	M.write_reg(GPINTENB, 0xFF) -- port B interrupt enabled
end

function PortA_PortB_Input()
	M.write_reg(IODIRA, 0x00) -- Port A as i/p
	M.write_reg(IODIRB, 0x00) -- Port B as i/p
--	M.write_reg(GPIOA, 0xFF) -- make port A high when Port A is o/p
--	M.write_reg(GPIOB, 0xFF) -- make port B high when Port B is o/p
end

function PortA_PortB_Output()
	M.write_reg(IODIRA, 0xFF) -- Port A as o/p
	M.write_reg(IODIRB, 0xFF) -- Port B as o/p
	M.write_reg(GPIOA, 0xFF) -- make port A high when Port A is o/p
	M.write_reg(GPIOB, 0xFF) -- make port B high when Port B is o/p
end

function Read_PortA_PortB_Reg()
	--read from interrupt capture ports to clear them
	local Port_A_Status = M.read_reg(INTCAPA)
	local Port_B_Status = M.read_reg(INTCAPB)
		return Port_A_Status, Port_B_Status
end 

function pin1cb(level)	
	 Port_A_Status, Port_B_Status = Read_PortA_PortB_Reg()
	print(Port_A_Status)
	print(Port_B_Status)
--	print("Aport"..numberstring(Port_A_Status,2))
--	print("B Port"..numberstring(Port_B_Status,2))
	--Pin_Finder(Port_A_Status, Port_B_Status)	
end

gpio.trig(INT_pin, "low", pin1cb)

return M 