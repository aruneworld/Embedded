-- http://nodemcu.readthedocs.io/en/master/en/modules/perf/

--[[
http://esp8266iot.blogspot.in/
http://aruneworld.blogspot.com/
https://github.com/adalurarun/Embedded_System/MicroController/Espressif/ESP8266
Copyright Arun 2016-2017
MIT License

If you like this project, please add a star!
]]--


	----------------------------------------------------------------------------------------------------------------------------------
	-----------------------------------------------	PERF Module	----------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------------------------------------

local PERF = ...			-- Obtain a sample value from somewhere
local PERF_Module =  {}	-- conPERF an empty table and assign it to variable "Table_name" (ex: local Arun =  {})
_G[PERF] = PERF_Module	--	A global variable (not a function) that holds the global environment


function PERF_Module()
--[[	perf.start()	-	Starts a performance monitoring session.
	Syntax		-	perf.start((start(, end(, nbins(, offset)))))
	Parameters	-	start (optional) The lowest PC address for the histogram. Default is 0x40000000.
					end (optional) The highest address for the histogram. Default is the end of the used space in the flash memory.
					nbins (optional) The number of bins in the histogram. Keep this reasonable otherwise you will run out of memory. Default is 1024.
					offset (Very optional) This specifies the offset of the saved PC value on the interrupt stack. It appears that 20 is the correct value.
				Note that the number of bins is an upper limit. The size of each bin is set to be the smallest power of two such that the number of bins required is le	ss than or equal to the provided number of bins.
	Returns		-	Nothing
]]--
end

function PERF_Module()
--[[	perf.stop()		-	Terminates a performance monitoring session and returns the histogram.
	Syntax		-	total, outside, histogram, binsize = perf.stop()
	Returns		-	total The total number of samples captured in this run
					outside The number of samples that were outside the histogram range
					histogram The histogram represented as a table indexed by address where the value is the number of samples. The address is the lowest address for the bin.
					binsize The number of bytes per histogram bin.
--	Example	
		perf.start()

		for j = 0, 100 do
		  str = "str"..j
		end

		tot, out, tbl, binsize = perf.stop()

		print(tot, out)
		local keyset = {}
		local n = 0
		for k,v in pairs(tbl) do
		  n=n+1
		  keyset[n]=k
		end
		table.sort(keyset)
		for kk,k in ipairs(keyset) do print(string.format("%x - %x",k, k + binsize - 1),tbl[k]) end

		This runs a loop creating strings 100 times and then prints out the histogram (after sorting it). This takes around 2,500 samples and provides a good indication of where all the CPU time is being spent. 
]]--
end

return PERF_Module