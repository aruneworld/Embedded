--	http://nodemcu.readthedocs.io/en/master/en/modules/bit/

--[[
http://esp8266iot.blogspot.in/
http://aruneworld.blogspot.com/
https://github.com/adalurarun/Embedded_System/MicroController/Espressif/ESP8266
Copyright Arun 2016-2017
MIT License

If you like this project, please add a star!
]]--

	-----------------------------------------------------------------------------------------------------------------------------------
	------------------------------------------                  Bit Module ------------------------------------------------------------
	-----------------------------------------------------------------------------------------------------------------------------------
local Bit = ...			-- Obtain a sample value from somewhere
local Bit_Module =  {}	-- construct an empty table and assign it to variable "Table_name" (ex: local Arun =  {})
_G[Bit] = Bit_Module	--	A global variable (not a function) that holds the global environment 

function Bit_Module
--[[	bit.arshift()	-	Arithmetic right shift a number equivalent to value >> shift in C.
	Syntax		-	bit.arshift(value, shift)
	Parameters	-	value the value to shift
					shift positions to shift
	Returns		-	the number shifted right (arithmetically)
]]--
end

function Bit_Module
--[[	bit.band()	-	Bitwise AND, equivalent to val1 & val2 & ... & valn in C.
	Syntax		-	bit.band(val1, val2 [, ... valn])
	Parameters	-	val1 first AND argument
					val2 second AND argument
					...valn ...nth AND argument
	Returns		-	the bitwise AND of all the arguments (number)
]]--
end

function Bit_Module
--[[	bit.bit()	-	Generate a number with a 1 bit (used for mask generation). Equivalent to 1 << position in C.
	Syntax		-	bit.bit(position)
	Parameters	-	position position of the bit that will be set to 1
	Returns		-	a number with only one 1 bit at position (the rest are set to 0)
]]--
end

function Bit_Module
--[[	bit.bnot()	-	Bitwise negation, equivalent to `~value in C.
	Syntax		-	bit.bnot(value)
	Parameters	-	value the number to negate
	Returns		-	the bitwise negated value of the number
]]--
end

function Bit_Module
--[[	bit.bor()	-	Bitwise OR, equivalent to val1 | val2 | ... | valn in C.
	Syntax		-	bit.bor(val1, val2 [, ... valn])
	Parameters	-	val1 first OR argument.
					val2 second OR argument.
					...valn ...nth OR argument
	Returns		-	the bitwise OR of all the arguments (number)
]]--
end


function Bit_Module
--[[	bit.bxor()		-	Bitwise XOR, equivalent to val1 ^ val2 ^ ... ^ valn in C.
	Syntax		-	bit.bxor(val1, val2 [, ... valn])
	Parameters	-	val1 first XOR argument
					val2 second XOR argument
					...valn ...nth XOR argument
	Returns		-	the bitwise XOR of all the arguments (number)
]]--
end

function Bit_Module
--[[	bit.clear()		-	clear bits in a number.
	Syntax		-	bit.clear(value, pos1 [, ... posn])
	Parameters	-	value the base number
					pos1 position of the first bit to clear
					...posn position of thet nth bit to clear
	Returns		-	the number with the bit(s) cleared in the given position(s)
]]--
end

function Bit_Module
--[[	bit.isclear()	-	Test if a given bit is cleared.
	Syntax		-	bit.isclear(value, position)
	Parameters	-	value the value to test
					position bit position to test
	Returns		-	true if the bit at the given position is 0, false othewise
]]--
end

function Bit_Module
--[[	bit.isset()		-	Test if a given bit is set.
		Syntax		-	bit.isset(value, position)
		Parameters	-	value the value to test
						position bit position to test
		Returns		-	true if the bit at the given position is 1, false otherwise
]]--
end

function Bit_Module
--[[	bit.lshift()	-	Left-shift a number, equivalent to value << shift in C.
	Syntax		-	bit.lshift(value, shift)
	Parameters	-	value the value to shift
					shift positions to shift
	Returns		-	the number shifted left
]]--
end


function Bit_Module
--[[	bit.rshift()	-	Logical right shift a number, equivalent to ( unsigned )value >> shift in C.
	Syntax		-	bit.rshift(value, shift)
	Parameters	-	value the value to shift.
					shift positions to shift.
	Returns		-	the number shifted right (logically)
]]--
end

function Bit_Module
--[[	bit.set()	-	Set bits in a number.
	Syntax		-	bit.set(value, pos1 [, ... posn ])
	Parameters	-	value the base number.
					pos1 position of the first bit to set.
					...posn position of the nth bit to set.
	Returns		-	the number with the bit(s) set in the given position(s)
]]--
end

return Bit_Module