-- http://nodemcu.readthedocs.io/en/master/en/modules/crypto/

--[[
http://esp8266iot.blogspot.in/
http://aruneworld.blogspot.com/
https://github.com/adalurarun/Embedded_System/MicroController/Espressif/ESP8266
Copyright Arun 2016-2017
MIT License

If you like this project, please add a star!
]]--

	-----------------------------------------------------------------------------------------------------------------------------------
	--------------------------------------                    CoAP Module ------------------------------------------------------------
	-----------------------------------------------------------------------------------------------------------------------------------
local CoAP = ...			-- Obtain a sample value from somewhere
local CoAP_Module =  {}	-- conCoAP an empty table and assign it to variable "Table_name" (ex: local Arun =  {})
_G[CoAP] = CoAP_Module	--	A global variable (not a function) that holds the global environmentfunction CoAP_Module

function Crypto_Module
--[[	crypto.encrypt()	-	Encrypts Lua strings.
	Syntax		-	crypto.encrypt(algo, key, plain [, iv])
	Parameters	-	algo the name of a supported encryption algorithm to use
					key the encryption key as a string; for AES encryption this MUST be 16 bytes long
					plain the string to encrypt; it will be automatically zero-padded to a 16-byte boundary if necessary
					iv the initilization vector, if using AES-CBC; defaults to all-zero if not given
	Returns		-	The encrypted data as a binary string. For AES this is always a multiple of 16 bytes in length.
	--Example		
		print(crypto.toHex(crypto.encrypt("AES-ECB", "1234567890abcdef", "Hi, I'm secret!")))
]]--
end

function Crypto_Module
--[[	crypto.decrypt()	-	Decrypts previously encrypted data.
		Syntax		-	crypto.decrypt(algo, key, cipher [, iv])
		Parameters	-	algo the name of a supported encryption algorithm to use
						key the encryption key as a string; for AES encryption this MUST be 16 bytes long
						cipher the cipher text to decrypt (as obtained from crypto.encrypt())
						iv the initilization vector, if using AES-CBC; defaults to all-zero if not given
		Returns		-	The decrypted string.
		Note that the decrypted string may contain extra zero-bytes of padding at the end. One way of stripping such padding is to use :match("(.-)%z*$") on the decrypted string. Additional care needs to be taken if working on binary data, in which case the real length likely needs to be encoded with the data, and at which point :sub(1, n) can be used to strip the padding.
--		Example
			key = "1234567890abcdef"
			cipher = crypto.encrypt("AES-ECB", key, "Hi, I'm secret!")
			print(crypto.toHex(cipher))
			print(crypto.decrypt("AES-ECB", key, cipher))
]]--
end

function Crypto_Module
--[[	crypto.fhash()		-	Compute a cryptographic hash of a a file.
		Syntax		-	hash = crypto.fhash(algo, filename)
		Parameters	-	algo the hash algorithm to use, case insensitive string
						filename the path to the file to hash
		Returns		-	A binary string containing the message digest. To obtain the textual version (ASCII hex characters), please use crypto.toHex().
		Example	
				print(crypto.toHex(crypto.fhash("sha1","myfile.lua")))
]]--
end

function Crypto_Module
--[[	crypto.hash()		-	Compute a cryptographic hash of a Lua string.
		Syntax		-	hash = crypto.hash(algo, str)
		Parameters	-	algo the hash algorithm to use, case insensitive string str string to hash contents of
		Returns		-	A binary string containing the message digest. To obtain the textual version (ASCII hex characters), please use crypto.toHex().
		--Example
			print(crypto.toHex(crypto.hash("sha1","abc")))
]]--
end

function Crypto_Module
--[[	crypto.new_hash()	-	Create a digest/hash object that can have any number of strings added to it. Object has update and finalize functions.
		Syntax		-	hashobj = crypto.new_hash(algo)
		Parameters	-	algo the hash algorithm to use, case insensitive string
		Returns		-	Userdata object with update and finalize functions available.
--		Example
			hashobj = crypto.new_hash("SHA1")
			hashobj:update("FirstString"))
			hashobj:update("SecondString"))
			digest = hashobj:finalize()
			print(crypto.toHex(digest))
]]--
end

function Crypto_Module
--[[	crypto.hmac()	-	Compute a HMAC (Hashed Message Authentication Code) signature for a Lua string.
		Syntax		-	signature = crypto.hmac(algo, str, key)
		Parameters	-	algo hash algorithm to use, case insensitive string
						str data to calculate the hash for
						key key to use for signing, may be a binary string
		Returns		-	A binary string containing the HMAC signature. Use crypto.toHex() to obtain the textual version.
--		Example
			print(crypto.toHex(crypto.hmac("sha1","abc","mysecret")))
]]--
end

function Crypto_Module
--[[	crypto.new_hmac()		-	Create a hmac object that can have any number of strings added to it. Object has update and finalize functions.
		Syntax		-	hmacobj = crypto.new_hmac(algo, key)
		Parameters	-	algo the hash algorithm to use, case insensitive string
						key the key to use (may be a binary string)
		Returns		-	Userdata object with update and finalize functions available.
--		Example		
			hmacobj = crypto.new_hmac("SHA1", "s3kr3t")
			hmacobj:update("FirstString"))
			hmacobj:update("SecondString"))
			digest = hmacobj:finalize()
			print(crypto.toHex(digest))
]]--
end

function Crypto_Module
--[[	crypto.mask()	-	Applies an XOR mask to a Lua string. Note that this is not a proper cryptographic mechanism, but some protocols may use it nevertheless.
	Syntax		-	crypto.mask(message, mask)
	Parameters	-	message message to mask
					mask the mask to apply, repeated if shorter than the message
	Returns		-	The masked message, as a binary string. Use crypto.toHex() to get a textual representation of it.
--	Example	
		print(crypto.toHex(crypto.mask("some message to obscure","X0Y7")))
]]--
end

function Crypto_Module
--[[	crypto.toBase64()	-Provides a Base64 representation of a (binary) Lua string.
	Syntax		-	b64 = crypto.toBase64(binary)
	Parameters	-	binary input string to Base64 encode
	Return		-	A Base64 encoded string.
	Example
		print(crypto.toBase64(crypto.hash("sha1","abc")))
]]--
end

function Crypto_Module
--[[	crypto.toHex()	-	Provides an ASCII hex representation of a (binary) Lua string. Each byte in the input string is represented as two hex characters in the output.
	Syntax		-	hexstr = crypto.toHex(binary)
	Parameters	-	binary input string to get hex representation for
	Returns		-	An ASCII hex string.
	Example	
		print(crypto.toHex(crypto.hash("sha1","abc")))
]]--
end

return Crypto_Module
