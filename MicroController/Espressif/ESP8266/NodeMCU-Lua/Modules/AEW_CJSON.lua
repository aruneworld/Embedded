-- http://nodemcu.readthedocs.io/en/master/en/modules/cjson/

--[[
http://esp8266iot.blogspot.in/
http://aruneworld.blogspot.com/
https://github.com/adalurarun/Embedded_System/MicroController/Espressif/ESP8266
Copyright Arun 2016-2017
MIT License

If you like this project, please add a star!
]]--
	-----------------------------------------------------------------------------------------------------------------------------------
	--------------------------------------                    CJSON Module ------------------------------------------------------------
	-----------------------------------------------------------------------------------------------------------------------------------
local CJSON = ...			-- Obtain a sample value from somewhere
local CJSON_Module =  {}	-- construct an empty table and assign it to variable "Table_name" (ex: local Arun =  {})
_G[CJSON] = CJSON_Module	--	A global variable (not a function) that holds the global environment 

function CJSON_Module.encode(table)
--[[	cjson.encode()	-	Encode a Lua table to a JSON string. For details see the documentation of the original Lua library.
	Syntax		-	cjson.encode(table)
	Parameters	-	table data to encode	(While it also is possible to encode plain strings and numbers rather than a table, it is not particularly useful to do so.)
	Returns		-	JSON string
]]--

--	Example
	ok, json = pcall(cjson.encode, {key="value"})
	if ok then
	  print(json)
	else
	  print("failed to encode!")
	end
end

function CJSON_Module.decode(str)
--[[	cjson.decode()	-	Decode a JSON string to a Lua table. For details see the documentation of the original Lua library.
Syntax		-	cjson.decode(str)
Parameters	-	str JSON string to decode
Returns		-	Lua table representation of the JSON data
]]--
	--Example

	t = cjson.decode('{"key":"value"}')
	for k,v in pairs(t) do print(k,v) end

end

return CJSON