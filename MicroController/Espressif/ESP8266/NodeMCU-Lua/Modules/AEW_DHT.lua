--http://nodemcu.readthedocs.io/en/master/en/modules/dht/

--[[
http://esp8266iot.blogspot.in/
http://aruneworld.blogspot.com/
https://github.com/adalurarun/Embedded_System/MicroController/Espressif/ESP8266
Copyright Arun 2016-2017
MIT License

If you like this project, please add a star!
]]--
	-----------------------------------------------------------------------------------------------------------------------------------------------------------------
	-------------------------------------------------          DHT Module 	----------------------------------------------------------------------------------------
	-----------------------------------------------------------------------------------------------------------------------------------------------------------------
local DHT = ...			-- Obtain a sample value from somewhere
local DHT_Module =  {}	-- conDHT an empty table and assign it to variable "Table_name" (ex: local Arun =  {})
_G[DHT] = DHT_Module	--	A global variable (not a function) that holds the global environmentfunction DHT_Module

--[[	DHT Module	- Constants	Constants for various functions.
	dht.read()		Read all kinds of DHT sensors, including DHT11, 21, 22, 33, 44 humidity temperature combo sensor.
	dht.read11()	Read DHT11 humidity temperature combo sensor.
	dht.readxx()	Read all kinds of DHT sensors, except DHT11.
]]--

--[[	Constants	-	Constants for various functions.
	dht.OK, dht.ERROR_CHECKSUM, dht.ERROR_TIMEOUT represent the potential values for the DHT read status
]]--

--[[	dht.read()	-	Read all kinds of DHT sensors, including DHT11, 21, 22, 33, 44 humidity temperature combo sensor.
	Syntax		:	dht.read(pin)
	Parameters	:	pin pin number of DHT sensor (can't be 0), type is number
	Returns		:	status as defined in Constants
					temp temperature (see note below)
					humi humidity (see note below)
					temp_dec temperature decimal
					humi_dec humidity decimal
	Note		:	If using float firmware then temp and humi are floating point numbers. On an integer firmware, the final values have to be concatenated from temp and temp_dec / humi and hum_dec.
	Example		:	pin = 5
					status, temp, humi, temp_dec, humi_dec = dht.read(pin)
					if status == dht.OK then
						-- Integer firmware using this example
						print(string.format("DHT Temperature:%d.%03d;Humidity:%d.%03d\r\n",
							  math.floor(temp),
							  temp_dec,
							  math.floor(humi),
							  humi_dec
						))

						-- Float firmware using this example
						print("DHT Temperature:"..temp..";".."Humidity:"..humi)

					elseif status == dht.ERROR_CHECKSUM then
						print( "DHT Checksum error." )
					elseif status == dht.ERROR_TIMEOUT then
						print( "DHT timed out." )
					end
]]--
dht.read(pin)

--[[	dht.read11()	-	Read DHT11 humidity temperature combo sensor.
	Syntax		:	dht.read11(pin)
	Parameters	:	pin pin number of DHT11 sensor (can't be 0), type is number
	Returns		:	status as defined in Constants
					temp temperature (see note below)
					humi humidity (see note below)
					temp_dec temperature decimal
					humi_dec humidity decimal

	Note		:	If using float firmware then temp and humi are floating point numbers. On an integer firmware, the final values have to be concatenated from temp and temp_dec / humi and hum_dec.
	See also	:	dht.read()
]]--
dht.read11(pin)

--[[	dht.readxx()	-	Read all kinds of DHT sensors, except DHT11.
		Syntax		:	dht.readxx(pin)
		Parameters	:	pin pin number of DHT sensor (can't be 0), type is number
		Returns		:	status as defined in Constants
						temp temperature (see note below)
						humi humidity (see note below)
						temp_dec temperature decimal
						humi_dec humidity decimal
		Note		:	If using float firmware then temp and humi are floating point numbers. On an integer firmware, the final values have to be concatenated from temp and temp_dec / humi and hum_dec.
		See also	:	dht.read()

]]--
dht.readxx(pin)