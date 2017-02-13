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
	-----------------------------------------------	WS2812 Module	----------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------------------------------------
local WS2812 = ...			-- Obtain a sample value from somewhere
local WS2812_Module =  {}	-- construct an empty table and assign it to variable "Table_name" (ex: local Arun =  {})
_G[WS2812] = WS2812_Module	--	A global variable (not a function) that holds the global environment 



function WS2812_Module()
--[[	ws2812.init(mode)	-	Initialize UART1 and GPIO2, should be called once and before write(). Initialize UART0 (TXD0) too if ws2812.MODE_DUAL is set.
		Parameters	-	mode (optional) either ws2812.MODE_SINGLE (default if omitted) or ws2812.MODE_DUAL. In ws2812.MODE_DUAL mode you will be able to handle two strips in parallel but will lose access to Lua's serial console as it shares the same UART and PIN.
		Returns		-	nil
]]--
end

function WS2812_Module()
--[[	ws2812.write()	-	Send data to one or two led strip using its native format which is generally Green,Red,Blue for RGB strips and Green,Red,Blue,White for RGBW strips.
	Syntax		-	ws2812.write(data1, [data2])
	Parameters	-	data1 payload to be sent to one or more WS2812 like leds through GPIO2
					data2 (optional) payload to be sent to one or more WS2812 like leds through TXD0 (ws2812.MODE_DUAL mode required)

					Payload type could be: - nil nothing is done - string representing bytes to send - ws2812.buffer see Buffer module
	Returns		-	nil
--	Example
	ws2812.init()
	ws2812.write(string.char(255, 0, 0, 255, 0, 0)) -- turn the two first RGB leds to green

	ws2812.init()
	ws2812.write(string.char(0, 0, 0, 255, 0, 0, 0, 255)) -- turn the two first RGBW leds to white

	ws2812.init(ws2812.MODE_DUAL)
	ws2812.write(string.char(255, 0, 0, 255, 0, 0), string.char(0, 255, 0, 0, 255, 0)) -- turn the two first RGB leds to green on the first strip and red on the second strip

	ws2812.init(ws2812.MODE_DUAL)
	ws2812.write(nil, string.char(0, 255, 0, 0, 255, 0)) -- turn the two first RGB leds to red
]]--
end

function WS2812_Module()
--[[	Buffer module	-	For more advanced animations, it is useful to keep a "framebuffer" of the strip, interact with it and flush it to the strip.

		For this purpose, the ws2812 library offers a read/write buffer. This buffer has a __tostring method so that it can be printed. This is useful for debugging.
		Example	-	Led chaser with a RGBW strip

			ws2812.init()
			local i, buffer = 0, ws2812.newBuffer(300, 4); buffer:fill(0, 0, 0, 0); tmr.alarm(0, 50, 1, function()
			i=i+1
			buffer:fade(2)
			buffer:set(i%buffer:size()+1, 0, 0, 0, 255)
			ws2812.write(buffer)	
			end)
]]--
end

function WS2812_Module()
--[[	ws2812.newBuffer()	-	Allocate a new memory buffer to store led values.
	Syntax		-	ws2812.newBuffer(numberOfLeds, bytesPerLed)
	Parameters	-	numberOfLeds length of the led strip
					bytesPerLed 3 for RGB strips and 4 for RGBW strips
	Returns		-	ws2812.buffer
]]--
end

function WS2812_Module()
--[[	ws2812.buffer:get()		-	Return the value at the given position
		Syntax		-	buffer:get(index)
		Parameters	-	index position in the buffer (1 for first led)
		Returns		-	(color)
		Example		-	buffer = ws2812.newBuffer(32, 4)
						print(buffer:get(1))	
						0   0   0   0
]]--
end

function WS2812_Module()
--[[	ws2812.buffer:set()	-	Set the value at the given position
	Syntax		-	buffer:set(index, color)
	Parameters	-	index position in the buffer (1 for the first led)
					color payload of the color
	Payload could be: - number, number, ... you should pass as many arguments as bytesPerLed - table should contains bytesPerLed numbers - string should contains bytesPerLed bytes
	Returns		-	nil
	Example	
		buffer = ws2812.newBuffer(32, 3)
		buffer:set(1, 255, 0, 0) -- set the first led green for a RGB strip

		buffer = ws2812.newBuffer(32, 4)
		buffer:set(1, {0, 0, 0, 255}) -- set the first led white for a RGBW strip

		buffer = ws2812.newBuffer(32, 3)
		buffer:set(1, string.char(255, 0, 0)) -- set the first led green for a RGB strip
]]--
end

function WS2812_Module()
--[[	ws2812.buffer:size()	-	Return the size of the buffer in number of leds
	Syntax		-	buffer:size()
	Parameters	-	none
	Returns		-	int
]]--
end

function WS2812_Module()
--[[	ws2812.buffer:fill()	-	Fill the buffer with the given color. The number of given bytes must match the number of bytesPerLed of the buffer
	Syntax		-	buffer:fill(color)
	Parameters	-	color bytes of the color, you should pass as many arguments as bytesPerLed
	Returns		-	nil
	Example		-	buffer:fill(0, 0, 0) -- fill the buffer with black for a RGB strip
]]--
end

function WS2812_Module()
--[[	ws2812.buffer:dump()	-	Returns the contents of the buffer (the pixel values) as a string. This can then be saved to a file or sent over a network.
	Syntax		-	buffer:dump()
	Returns		-	A string containing the pixel values.
	Example		-	local s = buffer:dump() 
]]--
end

function WS2812_Module()
--[[	ws2812.buffer:replace()	-	Inserts a string (or a buffer) into another buffer with an offset. The buffer must have the same number of colors per led or an error will be thrown.
	Syntax		-	buffer:replace(source[, offset])
	Parameters	-	source the pixel values to be set into the buffer. This is either a string or a buffer.
					offset the offset where the source is to be placed in the buffer. Default is 1. Negative values can be used.
	Returns		-	nil
	Example		
		buffer:replace(anotherbuffer:dump()) -- copy one buffer into another via a string
		buffer:replace(anotherbuffer) -- copy one buffer into another
		newbuffer = buffer.sub(1)     -- make a copy of a buffer into a new buffer
]]--
end

function WS2812_Module()
--[[	ws2812.buffer:mix()		-	This is a general method that loads data into a buffer that is a linear combination of data from other buffers. It can be used to copy a buffer or, more usefully, do a cross fade. The pixel values are computed as integers and then range limited to [0, 255]. This means that negative factors work as expected, and that the order of combining buffers does not matter.
	Syntax		-	buffer:mix(factor1, buffer1, ...)
	Parameters	-	factor1 This is the factor that the contents of buffer1 are multiplied by. This factor is scaled by a factor of 256. Thus factor1 value of 256 is a factor of 1.0.
					buffer1 This is the source buffer. It must be of the same shape as the destination buffer.
					There can be any number of factor/buffer pairs.
	Returns		-	nil
	Example
			-- loads buffer with a crossfade between buffer1 and buffer2
			buffer:mix(256 - crossmix, buffer1, crossmix, buffer2)

			-- multiplies all values in buffer by 0.75
			-- This can be used in place of buffer:fade
			buffer:mix(192, buffer)
]]--
end

function WS2812_Module()
--[[	ws2812.buffer:power()	-	Computes the total energy requirement for the buffer. This is merely the total sum of all the pixel values (which assumes that each color in each pixel consumes the same amount of power). A real WS2812 (or WS2811) has three constant current drivers of 20mA -- one for each of R, G and B. The pulse width modulation will cause the average current to scale linearly with pixel value.
		Syntax	-	buffer:power()
		Returns	-	An integer which is the sum of all the pixel values.
		Example	-	
			-- Dim the buffer to no more than the PSU can provide
				local psu_current_ma = 1000
				local led_current_ma = 20
				local led_sum = psu_current_ma * 255 / led_current_ma

				local p = buffer:power()
				if p > led_sum then
				  buffer:mix(256 * led_sum / p, buffer) -- power is now limited
				end
]]--
end

function WS2812_Module()	
--[[	ws2812.buffer:fade()	-	Fade in or out. Defaults to out. Multiply or divide each byte of each led with/by the given value. Useful for a fading effect.
	Syntax		-	buffer:fade(value [, direction])
	Parameters	-	value value by which to divide or multiply each byte
					direction ws2812.FADE_IN or ws2812.FADE_OUT. Defaults to ws2812.FADE_OUT
	Returns		-	nil
	Example		-	buffer:fade(2)
					buffer:fade(2, ws2812.FADE_IN)
]]--
end

function WS2812_Module()
--[[	ws2812.buffer:shift()	-	Shift the content of (a piece of) the buffer in positive or negative direction. This allows simple animation effects. A slice of the buffer can be specified by using the standard start and end offset Lua notation. Negative values count backwards from the end of the buffer.
	Syntax		-	buffer:shift(value (, mode(, i(, j))))
	Parameters	-	value number of pixels by which to rotate the buffer. Positive values rotate forwards, negative values backwards.
					mode is the shift mode to use. Can be one of ws2812.SHIFT_LOGICAL or ws2812.SHIFT_CIRCULAR. In case of SHIFT_LOGICAL, the freed pixels are set to 0 (off). In case of SHIFT_CIRCULAR, the buffer is treated like a ring buffer, inserting the pixels falling out on one end again on the other end. Defaults to SHIFT_LOGICAL.
					i is the first offset in the buffer to be affected. Negative values are permitted and count backwards from the end. Default is 1.
					j is the last offset in the buffer to be affected. Negative values are permitted and count backwards from the end. Default is -1.
	Returns		-	nil
		Example	
			buffer:shift(3)
]]--
end

function WS2812_Module()
--[[	ws2812.buffer:sub()	-	This implements the extraction function like string.sub. The indexes are in leds and all the same rules apply.
	Syntax		-	buffer1:sub(i[, j])
	Parameters	-	i This is the start of the extracted data. Negative values can be used.
					j this is the end of the extracted data. Negative values can be used. The default is -1.
	Returns		-	A buffer containing the extracted piece.
	Example	
		b = buffer:sub(1,10)
]]--
end

function WS2812_Module()
--[[	ws2812.buffer:__concat()	-	This implements the .. operator to concatenate two buffers. They must have the same number of colors per led.
	Syntax		-	buffer1 .. buffer2
	Parameters	-	buffer1 this is the start of the resulting buffer
					buffer2 this is the end of the resulting buffer
	Returns		-	The concatenated buffer.
	Example		
		ws2812.write(buffer1 .. buffer2)
]]--
end

return WS2812_Module