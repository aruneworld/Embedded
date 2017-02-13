-- http://nodemcu.readthedocs.io/en/master/en/modules/

--[[
http://esp8266iot.blogspot.in/
http://aruneworld.blogspot.com/
https://github.com/adalurarun/Embedded_System/MicroController/Espressif/ESP8266
Copyright Arun 2016-2017
MIT License

If you like this project, please add a star!
]]--

	----------------------------------------------------------------------------------------------------------------------------------
	-----------------------------------------------	TSL2561 Module	----------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------------------------------------
local TSL2561 = ...			-- Obtain a sample value from somewhere
local TSL2561_Module =  {}	-- construct an empty table and assign it to variable "Table_name" (ex: local Arun =  {})
_G[TSL2561] = TSL2561_Module	--	A global variable (not a function) that holds the global environment

function TSL2561_Module()
--[[

]]--
end

function TSL2561_Module()
--[[	tsl2561.getlux()	-	Reads sensor values from the device and returns calculated lux value.
	Syntax		-	tsl2561.getlux()
	Parameters	-	none
	Returns		-	lux the calculated illuminance in lux (lx)
					status value indicating success or failure as explained below:
						tsl2561.TSL2561_OK
						tsl2561.TSL2561_ERROR_I2CINIT can't initialize I²C bus
						tsl2561.TSL2561_ERROR_I2CBUSY I²C bus busy
						tsl2561.TSL2561_ERROR_NOINIT initialize I²C bus before calling function
						tsl2561.TSL2561_ERROR_LAST
	Example		-	
				status = tsl2561.init(5, 6, tsl2561.ADDRESS_FLOAT, tsl2561.PACKAGE_T_FN_CL)

				if status == tsl2561.TSL2561_OK then
					lux = tsl2561.getlux()
					print("Illuminance: "..lux.." lx") 
				end
]]--
end

function TSL2561_Module()
--[[	tsl2561.getrawchannels()	-	Reads the device's 2 sensors and returns their values.
	Syntax		-	tsl2561.getrawchannels()
	Parameters	-	none
	Returns		-	ch0 value of the broad spectrum sensor
					ch1 value of the IR sensor
					status value indicating success or failure as explained below:
						tsl2561.TSL2561_OK
						tsl2561.TSL2561_ERROR_I2CINIT can't initialize I²C bus
						tsl2561.TSL2561_ERROR_I2CBUSY I²C bus busy
						tsl2561.TSL2561_ERROR_NOINIT initialize I²C bus before calling function
						tsl2561.TSL2561_ERROR_LAST
	Example		
			status = tsl2561.init(5, 6, tsl2561.ADDRESS_FLOAT, tsl2561.PACKAGE_T_FN_CL)

			if status == tsl2561.TSL2561_OK then
				ch0, ch1 = tsl2561.getrawchannels()
				print("Raw values: "..ch0, ch1)
				lux = tsl2561.getlux()
				print("Illuminance: "..lux.." lx") 
			end
]]--
end

function TSL2561_Module()
--[[	tsl2561.init()		-	Initializes the device on pins sdapin & sclpin. Optionally also configures the devices address and package. Default: address pin floating (0x39) and FN package.
	Syntax		-	tsl2561.init(sdapin, sclpin(, address(, package)))
	Parameters	-	sdapin pin number of the device's I²C sda connection
					sclpin pin number of the device's I²C scl connection
					address optional address of the device on the I²C bus
						tsl2561.ADDRESS_GND
						tsl2561.ADDRESS_FLOAT (default when omitted)
						tsl2561.ADDRESS_VDD
					package optional device's package type (slight difference in lux calculation)
						tsl2561.PACKAGE_CS
						tsl2561.PACKAGE_T_FN_CL (default when omitted)
	Returns		-	status value indicating success or failure as explained below:
						tsl2561.TSL2561_OK
						tsl2561.TSL2561_ERROR_I2CINIT can't initialize I²C bus
						tsl2561.TSL2561_ERROR_I2CBUSY I²C bus busy
						tsl2561.TSL2561_ERROR_NOINIT Initialize I²C bus before calling function
						tsl2561.TSL2561_ERROR_LAST
	Example		-	
			status = tsl2561.init(5, 6, tsl2561.ADDRESS_FLOAT, tsl2561.PACKAGE_T_FN_CL)
			if status == tsl2561.TSL2561_OK then
				lux = tsl2561.getlux()
				print("Illuminance: "..lux.." lx") 
			end
]]--
end

function TSL2561_Module()
--[[	tsl2561.settiming()		-	Sets the integration time and gain settings of the device. When tls2561.init() is called, these values default to 402 ms and no gain.
	Syntax		-	tsl2561.settiming(integration, gain)
	Parameters	-	integration sets the device's integration period. Valid options are:
						tsl2561.INTEGRATIONTIME_13MS
						tsl2561.INTEGRATIONTIME_101MS
						tsl2561.INTEGRATIONTIME_402MS (default when omitted)
					gain sets the device's gain. Valid options are:
						tsl2561.GAIN_1X (default when omitted)
						tsl2561.GAIN_16X
	Returns		-	status value indicating success or failure as explained below:
					tsl2561.TSL2561_OK
					tsl2561.TSL2561_ERROR_I2CINIT can't initialize I²C bus
					tsl2561.TSL2561_ERROR_I2CBUSY I²C bus busy
					tsl2561.TSL2561_ERROR_NOINIT initialize I²C bus before calling function
					tsl2561.TSL2561_ERROR_LAST
	Example		
				status = tsl2561.init(5, 6, tsl2561.ADDRESS_FLOAT, tsl2561.PACKAGE_T_FN_CL)
				if status == tsl2561.TSL2561_OK then
					status = tsl2561.settiming(tsl2561.INTEGRATIONTIME_101MS, tsl2561.GAIN_16X)
				end
				if status == tsl2561.TSL2561_OK then
					lux = tsl2561.getlux()
					print("Illuminance: "..lux.." lx") 
				end
]]--
end

return TSL2561_Module