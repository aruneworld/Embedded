-- http://nodemcu.readthedocs.io/en/master/en/modules/spi/

--[[
http://esp8266iot.blogspot.in/
http://aruneworld.blogspot.com/
https://github.com/adalurarun/Embedded_System/MicroController/Espressif/ESP8266
Copyright Arun 2016-2017
MIT License

If you like this project, please add a star!
]]--

	----------------------------------------------------------------------------------------------------------------------------------
	-----------------------------------------------	SPI Module	----------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------------------------------------
local SPI = ...			-- Obtain a sample value from somewhere
local SPI_Module =  {}	-- conSPI an empty table and assign it to variable "Table_name" (ex: local Arun =  {})
_G[SPI] = SPI_Module	--	A global variable (not a function) that holds the global environment 

-------------------------------------------------	High Level Functions	------------------------------------------------------
function SPI_Module()
--[[	spi.recv()	-	Receive data from SPI.
	Syntax		-	spi.recv(id, size[, default_data])
	Parameters	-	id SPI ID number: 0 for SPI, 1 for HSPI
					size number of data items to be read
					default_data default data being sent on MOSI (all-1 if omitted)
	Returns		-	String containing the bytes read from SPI.
]]--
end

function SPI_Module()
--[[	spi.send()	-	Send data via SPI in half-duplex mode. Send & receive data in full-duplex mode.
	Syntax		-	HALFDUPLEX:		wrote = spi.send(id, data1(, data2(, ..., datan)))
					FULLDUPLEX:		wrote(, rdata1[, ..., rdatan)) = spi.send(id, data1(, data2(, ..., datan)))
	Parameters	-	id SPI ID number: 0 for SPI, 1 for HSPI
					data data can be either a string, a table or an integer number.
					Each data item is considered with databits number of bits.
	Returns		-	wrote number of written bytes
					rdata received data when configured with spi.FULLDUPLEX
					Same data type as corresponding data parameter.
	Example	
				=spi.send(1, 0, 255, 255, 255)
				4       255     192     32      0
				x = {spi.send(1, 0, 255, 255, 255)}
				=x[1]
				4
				=x[2]
				255
				=x[3]
				192
				=x[4]
				32
				=x[5]
				0
				=x[6]
				nil
				=#x
				5

				_, _, x = spi.send(1, 0, {255, 255, 255})
				=x[1]
				192
				=x[2]
				32
				=x[3]
				0
]]--
end
end

function SPI_Module()
--[[	spi.setup()		-	Set up the SPI configuration. Refer to Serial Peripheral Interface Bus for details regarding the clock polarity and phase definition.
	Syntax		-	spi.setup(id, mode, cpol, cpha, databits, clock_div[, duplex_mode])
	Parameters	-	id SPI ID number: 0 for SPI, 1 for HSPI
					mode select master or slave mode
						spi.MASTER
						spi.SLAVE - not supported currently
					cpol clock polarity selection
						spi.CPOL_LOW
						spi.CPOL_HIGH
					cpha clock phase selection
						spi.CPHA_LOW
						spi.CPHA_HIGH
					databits number of bits per data item 1 - 32
					clock_div SPI clock divider, f(SPI) = 80 MHz / clock_div, 1 .. n (0 defaults to divider 8)
					duplex_mode duplex mode
						spi.HALFDUPLEX (default when omitted)
						spi.FULLDUPLEX

	Returns		-	Number: 1
]]--
end

----------------------------------------------------------		Low Level Hardware Functions		------------------------------------------------------------

function SPI_Module()
--[[	spi.get_miso()		-	Extract data items from MISO buffer after spi.transaction().
	Syntax		-	data1(, data2(, ..., datan)) = spi.get_miso(id, offset, bitlen, num)
	Parameters	-	id SPI ID number: 0 for SPI, 1 for HSPI
					offset bit offset into MISO buffer for first data item
					bitlen bit length of a single data item
					num number of data items to retrieve

	Returns		-	num data items
]]--
end

function SPI_Module()
--[[	spi.set_mosi()	-	Insert data items into MOSI buffer for spi.transaction().
	Syntax		-	spi.set_mosi(id, offset, bitlen, data1(, data2(, ..., datan))
	Parameters	-	id SPI ID number: 0 for SPI, 1 for HSPI
					offset bit offset into MOSI buffer for inserting data1 and subsequent items
					bitlen bit length of data1, data2, ...
					data data items where bitlen number of bits are considered for the transaction.
	Returns		-	nil
]]--
end

function SPI_Module()
--[[	spi.transaction()	-	Start an SPI transaction, consisting of up to 5 phases:
							Command
							Address
							MOSI
							Dummy
							MISO

	Syntax		-	spi.transaction(id, cmd_bitlen, cmd_data, addr_bitlen, addr_data, mosi_bitlen, dummy_bitlen, miso_bitlen)
	Parameters	-	id SPI ID number: 0 for SPI, 1 for HSPI
					cmd_bitlen bit length of the command phase (0 - 16)
					cmd_data data for command phase
					addr_bitlen bit length for address phase (0 - 32)
					addr_data data for command phase
					mosi_bitlen bit length of the MOSI phase (0 - 512)
					dummy_bitlen bit length of the dummy phase (0 - 256)
					miso_bitlen bit length of the MISO phase (0 - 512) for half-duplex.
					Full-duplex mode is activated with a negative value.
	Returns		-	nil
]]--
end

return SPI_Module