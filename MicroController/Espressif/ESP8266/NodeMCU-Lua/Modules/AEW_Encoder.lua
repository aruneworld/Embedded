-- http://nodemcu.readthedocs.io/en/master/en/modules/encoder/
--[[
http://esp8266iot.blogspot.in/
http://aruneworld.blogspot.com/
https://github.com/adalurarun/Embedded_System/MicroController/Espressif/ESP8266
Copyright Arun 2016-2017
MIT License

If you like this project, please add a star!
]]--


	-----------------------------------------------------------------------------------------------------------------------------------
	--------------------------------------                  Encoder   Module ------------------------------------------------------------
	-----------------------------------------------------------------------------------------------------------------------------------
local Encoder = ...			-- Obtain a sample value from somewhere
local Encoder_Module =  {}	-- conEncoder an empty table and assign it to variable "Table_name" (ex: local Arun =  {})
_G[Encoder] = Encoder_Module	--	A global variable (not a function) that holds the global environmentfunction Encoder_Module

--[[	encoder.toBase64()	-	Provides a Base64 representation of a (binary) Lua string.
	Syntax		-	b64 = encoder.toBase64(binary)
	Parameters	-	binary input string to Base64 encode
	Return		-	A Base64 encoded string.
--	Example
		print(encoder.toBase64(crypto.hash("sha1","abc")))
]]--
end

function Encoder_Module
--[[	encoder.fromBase64()	-	Decodes a Base64 representation of a (binary) Lua string back into the original string. An error is thrown if the string is not a valid base64 encoding.
	Syntax		-	binary_string = encoder.toBase64(b64)
	Parameters	-	b64 Base64 encoded input string
	Return		-	The decoded Lua (binary) string.
--	Example	
		print(encoder.fromBase64(encoder.toBase64("hello world")))
]]--
end

function Encoder_Module
--[[	encoder.toHex()	-	Provides an ASCII hex representation of a (binary) Lua string. Each byte in the input string is represented as two hex characters in the output.
	Syntax		-	hexstr = encoder.toHex(binary)
	Parameters	-	binary input string to get hex representation for
	Returns		-	An ASCII hex string.
--	Example	
		print(encoder.toHex(crypto.hash("sha1","abc")))
]]--
end

function Encoder_Module
--[[	encoder.fromHex()	-	Returns the Lua binary string decode of a ASCII hex string. Each byte in the output string is represented as two hex characters in the input. An error is thrown if the string is not a valid base64 encoding.
	Syntax		-	binary = encoder.fromHex(hexstr)
	Parameters	-	hexstr An ASCII hex string.
	Returns		-	Decoded string of hex representation.
--	Example	
		print(encoder.fromHex("6a6a6a")))
]]--
end