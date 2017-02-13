-- http://nodemcu.readthedocs.io/en/master/en/modules/node/

--[[
http://esp8266iot.blogspot.in/
http://aruneworld.blogspot.com/
https://github.com/adalurarun/Embedded_System/MicroController/Espressif/ESP8266
Copyright Arun 2016-2017
MIT License

If you like this project, please add a star!
]]--

	----------------------------------------------------------------------------------------------------------------------------------
	-----------------------------------------------	NODE Module	----------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------------------------------------
local NODE = ...			-- Obtain a sample value from somewhere
local NODE_Module =  {}	-- conNODE an empty table and assign it to variable "Table_name" (ex: local Arun =  {})
_G[NODE] = NODE_Module	--	A global variable (not a function) that holds the global environment

--[[	node.bootreason()

	Returns the boot reason and extended reset info.

	The first value returned is the raw code, not the new "reset info" code which was introduced in recent SDKs. Values are:

		1, power-on
		2, reset (software?)
		3, hardware reset via reset pin
		4, WDT reset (watchdog timeout)

	The second value returned is the extended reset cause. Values are:

		0, power-on
		1, hardware watchdog reset
		2, exception reset
		3, software watchdog reset
		4, software restart
		5, wake from deep sleep
		6, external reset

	In general, the extended reset cause supercedes the raw code. The raw code is kept for backwards compatibility only. For new applications it is highly recommended to use the extended reset cause instead.

	In case of extended reset cause 3 (exception reset), additional values are returned containing the crash information. These are, in order, EXCCAUSE, EPC1, EPC2, EPC3, EXCVADDR, and DEPC.
	Syntax

	node.bootreason()
	Parameters

	none
	Returns

	rawcode, reason [, exccause, epc1, epc2, epc3, excvaddr, depc ]
	Example

	_, reset_reason = node.bootreason()
	if reset_reason == 0 then print("Power UP!") end

]]--

function NODE_Module.chipid()
--[[	node.chipid()	-	Returns the ESP chip ID.
	Syntax		-	node.chipid()
	Parameters	-	none
	Returns		-	chip ID (number)
]]--
end

function NODE_Module.compile(file_Name)
--[[	node.compile()	-	Compiles a Lua text file into Lua bytecode, and saves it as .lc file.
	Syntax		-	node.compile("file.lua")
	Parameters	-	filename name of Lua text file
	Returns		-	nil
--	Example
		file.open("hello.lua","w+")
		file.writeline([[print("hello nodemcu")]])
		file.writeline([[print(node.heap())]])
		file.close()

		node.compile("hello.lua")
		dofile("hello.lua")
		dofile("hello.lc")
]]--
end

function NODE_Module.dsleep()
--[[	node.dsleep()	-	Enters deep sleep mode, wakes up when timed out.
		The maximum sleep time is 4294967295us, ~71 minutes. This is an SDK limitation. Firmware from before 05 Jan 2016 have a maximum sleeptime of ~35 minutes.
	Caution	:	This function can only be used in the condition that esp8266 PIN32(RST) and PIN8(XPD_DCDC aka GPIO16) are connected together. Using sleep(0) will set no wake up timer, connect a GPIO to pin RST, the chip will wake up by a falling-edge on pin RST.
	Syntax		-	node.dsleep(us, option)
	Parameters	-	us number (integer) or nil, sleep time in micro second. If us == 0, it will sleep forever. If us == nil, will not set sleep time.

		option number (integer) or nil. If nil, it will use last alive setting as default option.
			0, init data byte 108 is valuable
			> 0, init data byte 108 is valueless
			0, RF_CAL or not after deep-sleep wake up, depends on init data byte 108
			1, RF_CAL after deep-sleep wake up, there will be large current
			2, no RF_CAL after deep-sleep wake up, there will only be small current
			4, disable RF after deep-sleep wake up, just like modem sleep, there will be the smallest current

	Returns		-	nil
--	Example
		--do nothing
		node.dsleep()
		--sleep μs
		node.dsleep(1000000)
		--set sleep option, then sleep μs
		node.dsleep(1000000, 4)
		--set sleep option only
		node.dsleep(nil,4)

]]--
end

function NODE_Module
--[[	node.flashid()	-	Returns the flash chip ID.
	Syntax		-	node.flashid()
	Parameters	-	none
	Returns		-	flash ID (number)
]]--
end

function NODE_Module
--[[	node.flashsize()	-	Returns the flash chip size in bytes. On 4MB modules like ESP-12 the return value is 4194304 = 4096KB.
	Syntax		-	node.flashsize()
	Parameters	-	none
	Returns		-	flash size in bytes (integer)
]]--
end

function NODE_Module.heap()
--[[	node.heap()	-	Returns the current available heap size in bytes. Note that due to fragmentation, actual allocations of this size may not be possible.
	Syntax		-	node.heap()
	Parameters	-	none
	Returns		-	system heap size left in bytes (number)
]]--
end

function NODE_Module.info()
--[[	node.info()		-	Returns NodeMCU version, chipid, flashid, flash size, flash mode, flash speed.
	Syntax		-	node.info()
	Parameters	-	none
	Returns		-	majorVer (number)
					minorVer (number)
					devVer (number)
					chipid (number)
					flashid (number)
					flashsize (number)
					flashmode (number)
					flashspeed (number)
--	Example
		majorVer, minorVer, devVer, chipid, flashid, flashsize, flashmode, flashspeed = node.info()
		print("NodeMCU "..majorVer.."."..minorVer.."."..devVer)
]]--
end

function NODE_Module.input(str)
--[[	node.input()	-	Submits a string to the Lua interpreter. Similar to pcall(loadstring(str)), but without the single-line limitation.
	Attention	:	This function only has an effect when invoked from a callback. Using it directly on the console does not work.
	Syntax		-	node.input(str)
	Parameters	-	str Lua chunk
	Returns		-	nil
	Example		-	sk:on("receive", function(conn, payload) node.input(payload) end)
]]--
end

function NODE_Module.output(function(str), serial_debug)
--[[	node.output()	-	Redirects the Lua interpreter output to a callback function. Optionally also prints it to the serial console.

	Caution	-	Do not attempt to print() or otherwise induce the Lua interpreter to produce output from within the callback function. Doing so results in infinite recursion, and leads to a watchdog-triggered restart.
	Syntax		-	node.output(function(str), serial_debug)
	Parameters	-	output_fn(str) a function accept every output as str, and can send the output to a socket (or maybe a file).
					serial_debug 1 output also show in serial. 0: no serial output.
	Returns		-	nil
	Example		-	function tonet(str)
						sk:send(str)
						end
						node.output(tonet, 1)  -- serial also get the lua output.

						-- a simple telnet server
						s=net.createServer(net.TCP)
						s:listen(2323,function(c)
						   con_std = c
						   function s_output(str)
							  if(con_std~=nil)
								 then con_std:send(str)
							  end
						   end
						   node.output(s_output, 0)   -- re-direct output to function s_ouput.
						   c:on("receive",function(c,l)
							  node.input(l)           -- works like pcall(loadstring(l)) but support multiple separate line
						   end)
						   c:on("disconnection",function(c)
							  con_std = nil
							  node.output(nil)        -- un-regist the redirect output function, output goes to serial
						   end)
						end)
]]--
end
end
function NODE_Module.readvdd33()
--[[	node.readvdd33() --deprecated	-	Moved to adc.readvdd33()	]]--
end

function NODE_Module.restart()
--[[	node.restart()	-	Restarts the chip.
	Syntax		-	node.restart()
	Parameters	-	none
	Returns		-	nil
]]--
end

function NODE_Module.restore()
--[[	node.restore()	-	Restores system configuration to defaults using the SDK function system_restore(), which doesn't document precisely what it erases/restores.
	Syntax		-	node.restore()
	Parameters	-	none
	Returns		-	nil
	Example	
		node.restore()
		node.restart() -- ensure the restored settings take effect	
]]--
end

function NODE_Module.setcpufreq(speed)
--[[	node.setcpufreq()	-	Change the working CPU Frequency.
	Syntax		-	node.setcpufreq(speed)
	Parameters	-	speed constant 'node.CPU80MHZ' or 'node.CPU160MHZ'
	Returns		-	target CPU frequency (number)
	Example		-	node.setcpufreq(node.CPU80MHZ)
]]--
end

function NODE_Module.stripdebug((level(, function)))
--[[	node.stripdebug()	-	Controls the amount of debug information kept during node.compile(), and allows removal of debug information from already compiled Lua code.	
								Only recommended for advanced users, the NodeMCU defaults are fine for almost all use cases.
	Syntax		-	node.stripdebug((level(, function)))
	Parameters	-	level
					1, don't discard debug info
					2, discard Local and Upvalue debug info
					3, discard Local, Upvalue and line-number debug info
				function a compiled function to be stripped per setfenv except 0 is not permitted.

			If no arguments are given then the current default setting is returned. If function is omitted, this is the default setting for future compiles. The function argument uses the same rules as for setfenv().
	Returns		-	If invoked without arguments, returns the current level settings. Otherwise, nil is returned.
		Example

			node.stripdebug(3)
			node.compile('bigstuff.lua')
]]--
end
end

function NODE_Module.osprint(enabled)
--[[	node.osprint()		-	Controls whether the debugging output from the Espressif SDK is printed. Note that this is only available if the firmware is build with DEVELOPMENT_TOOLS defined.
	Syntax		-	node.osprint(enabled)
	Parameters	-	enabled This is either true to enable printing, or false to disable it. The default is false.
	Returns		-	Nothing
--	Example
		node.osprint(true)
]]--
end

function NODE_Module
--[[	node.egc module		-	node.egc.setmode()
		Sets the Emergency Garbage Collector mode. The EGC whitepaper provides more detailed information on the EGC.
		Syntax		-	node.egc.setmode(mode, [param])
		Parameters	-	mode
							node.egc.NOT_ACTIVE EGC inactive, no collection cycle will be forced in low memory situations
							node.egc.ON_ALLOC_FAILURE Try to allocate a new block of memory, and run the garbage collector if the allocation fails. If the allocation fails even after running the garbage collector, the allocator will return with error.
							node.egc.ON_MEM_LIMIT Run the garbage collector when the memory used by the Lua script goes beyond an upper limit. If the upper limit can't be satisfied even after running the garbage collector, the allocator will return with error.
							node.egc.ALWAYS Run the garbage collector before each memory allocation. If the allocation fails even after running the garbage collector, the allocator will return with error. This mode is very efficient with regards to memory savings, but it's also the slowest.
						level in the case of node.egc.ON_MEM_LIMIT, this specifies the memory limit.
		Returns		-	nil
		Example		
				node.egc.setmode(node.egc.ALWAYS, 4096)  -- This is the default setting at startup. node.egc.setmode(node.egc.ON_ALLOC_FAILURE) -- This is the fastest activeEGC mode.
]]--
end

----------------------------------------------------------	node.task module	-----------------------------------------------------

function NODE_Module
--[[	node.task.post()	-	Enable a Lua callback or task to post another task request. Note that as per the example multiple tasks can be posted in any task, but the highest priority is always delivered first.
								If the task queue is full then a queue full error is raised.
		Syntax		-	node.task.post([task_priority], function)
		Parameters	-	task_priority (optional)
							node.task.LOW_PRIORITY = 0
							node.task.MEDIUM_PRIORITY = 1
							node.task.HIGH_PRIORITY = 2
						function a callback function to be executed when the task is run.
							If the priority is omitted then this defaults to node.task.MEDIUM_PRIORITY
		Returns		-		nil
--		Example		
				for i = node.task.LOW_PRIORITY, node.task.HIGH_PRIORITY do 
				  node.task.post(i,function(p2)
					print("priority is "..p2)
				  end) 
				end      

				prints

				priority is 2
				priority is 1
				priority is 0
]]--

end
