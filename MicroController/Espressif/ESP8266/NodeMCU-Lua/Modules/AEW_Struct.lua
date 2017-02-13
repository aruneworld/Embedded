-- http://nodemcu.readthedocs.io/en/master/en/modules/struct/

--[[
http://esp8266iot.blogspot.in/
http://aruneworld.blogspot.com/
https://github.com/adalurarun/Embedded_System/MicroController/Espressif/ESP8266
Copyright Arun 2016-2017
MIT License

If you like this project, please add a star!
]]--

	----------------------------------------------------------------------------------------------------------------------------------
	-----------------------------------------------	Struct Module	----------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------------------------------------
local Struct = ...			-- Obtain a sample value from somewhere
local Struct_Module =  {}	-- construct an empty table and assign it to variable "Table_name" (ex: local Arun =  {})
_G[Struct] = Struct_Module	--	A global variable (not a function) that holds the global environment 

function Struct_Module()
--[[	struct.pack()	-	Returns a string containing the values d1, d2, etc. packed according to the format string fmt.
	Syntax		-	struct.pack (fmt, d1, d2, ...)
	Parameters	-	fmt The format string in the format above
					d1 The first data item to be packed
					d2 The second data item to be packed etc.
	Returns		-	The packed string.
	Example		
			s = struct.pack("I", 0x41424344)
			print(s)
]]--
end

function Struct_Module()
--[[	struct.unpack()		-	Returns the values packed in string s according to the format string fmt. An optional i marks where in s to start reading (default is 1). After the read values, this function also returns the index in s where it stopped reading, which is also where you should start to read the rest of the string.
	Syntax		-	struct.unpack (fmt, s[, offset])
	Parameters	-	fmt The format string in the format above
					s The string holding the data to be unpacked
					offset The position to start in the string (default is 1)
	Returns		-	All the unpacked data.
	Example

		Suppose we have to decode a string s with an unknown number of doubles; the end is marked by a zero value. We can use the following code:

			local a = {}
			local i = 1         -- index where to read
			while true do
			  local d
			  d, i = struct.unpack("d", s, i)
			  if d == 0 then break end
			  a[#a + 1] = d
			end
]]--
end

function Struct_Module(	)
--[[	struct.size()	-	Returns the size of a string formatted according to the format string fmt. The format string should contain neither the option s nor the option c0.
	Syntax		-	struct.size (fmt)
	Parameters	-	fmt The format string in the format above	
	Returns		-	The size of the string that would be output in a pack operation with this format string.
	Example		
			print(struct.size("i"))
			This prints the size of the native integer type.
			License
			This package is distributed under the MIT license. See copyright notice at the end of file struct.c.
]]--
end

return Struct_Module