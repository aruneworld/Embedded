--------------------------------------------------------------------------------
--[[		Tested On Firmware and Details Below
	NodeMCU custom build by frightanic.com
	branch: master
	SSL: false
	modules: bit,enduser_setup,file,gpio,http,i2c,mdns,mqtt,net,node,ow,pwm,rtcfifo,rtcmem,rtctime,sntp,tmr,uart,wifi
 	powered by Lua 5.1.4 on SDK 1.5.4.1(39cb9a32)
]]--
-- http://esp8266iot.blogspot.in/
-- http://aruneworld.blogspot.com/
-- Tested By 	: Arun(20170212)
-- Example Name : AEW_LCD_Nokia-5110_PCD8544.lua
--refre data sheet https://www.sparkfun.com/datasheets/LCD/Monochrome/Nokia5110.pdf
--------------------------------------------------------------------------------
-- the following code refered by this post 	http://playground.arduino.cc/Code/PCD8544

-- You need to configure the pins you are using here
PIN_RESET 	= 0
PIN_SCE		= 1
PIN_DC 		= 2
PIN_SDIN 	= 3
PIN_SCLK	= 4

local LCD_D = gpio.HIGH
local LCD_C=gpio.LOW

local LCD_X = 84
local LCD_Y = 48

local chars= "\0\0\0\0\0\0\0\95\0\0\0\7\0\7\0\20\127\20\127\20\36\42\127\42\18\35\19\8\100\98\54\73\85\34\80\0\5\3\0\0\0\28\34\65\0\0\65\34\28\0\20\8\62\8\20\8\8\62\8\8\0\80\48\0\0\8\8\8\8\8\0\96\96\0\0\32\16\8\4\2\62\81\73\69\62\0\66\127\64\0\66\97\81\73\70\33\65\69\75\49\24\20\18\127\16\39\69\69\69\57\60\74\73\73\48\1\113\9\5\3\54\73\73\73\54\6\73\73\41\30\0\54\54\0\0\0\86\54\0\0\8\20\34\65\0\20\20\20\20\20\0\65\34\20\8\2\1\81\9\6\50\73\121\65\62\126\17\17\17\126\127\73\73\73\54\62\65\65\65\34\127\65\65\34\28\127\73\73\73\65\127\9\9\9\1\62\65\73\73\122\127\8\8\8\127\0\65\127\65\0\32\64\65\63\1\127\8\20\34\65\127\64\64\64\64\127\2\12\2\127\127\4\8\16\127\62\65\65\65\62\127\9\9\9\6\62\65\81\33\94\127\9\25\41\70\70\73\73\73\49\1\1\127\1\1\63\64\64\64\63\31\32\64\32\31\63\64\56\64\63\99\20\8\20\99\7\8\112\8\7\97\81\73\69\67\0\127\65\65\0\2\4\8\16\32\0\65\65\127\0\4\2\1\2\4\64\64\64\64\64\0\1\2\4\0\32\84\84\84\120\127\72\68\68\56\56\68\68\68\32\56\68\68\72\127\56\84\84\84\24\8\126\9\1\2\12\82\82\82\62\127\8\4\4\120\0\68\125\64\0\32\64\68\61\0\127\16\40\68\0\0\65\127\64\0\124\4\24\4\120\124\8\4\4\120\56\68\68\68\56\124\20\20\20\8\8\20\20\24\124\124\8\4\4\8\72\84\84\84\32\4\63\68\64\32\60\64\64\32\124\28\32\64\32\28\60\64\48\64\60\68\40\16\40\68\12\80\80\80\60\68\100\84\76\68\0\8\54\65\0\0\0\127\0\0\0\65\54\8\0\16\8\8\16\8\120\70\65\70\120"

local function shiftOut(d,cl, data)
	for index=0,7 do
		if bit.isset(data, 7-index) then
			gpio.write(d, gpio.HIGH)
		else
			gpio.write(d, gpio.LOW)
		end
		gpio.write(cl, gpio.HIGH)
		tmr.delay(5)
		gpio.write(cl, gpio.LOW)
	end
end

local function LCDWrite(dc,data)
	gpio.write(PIN_DC, dc)
	gpio.write(PIN_SCE, gpio.LOW)
	shiftOut(PIN_SDIN, PIN_SCLK, data)
	gpio.write(PIN_SCE, gpio.HIGH)
end

function LcdSetPins(sclk, sdin, dc, sce, reset)
	PIN_SCLK = sclk
	PIN_SDIN = sdin
	PIN_DC = dc
	PIN_SCE = sce
	PIN_RESET = reset
end

function LcdLocate(x,y)
	LCDWrite(LCD_C,64+x) 
	LCDWrite(LCD_C,128+y)
end

function LcdCharacter(character)
	LCDWrite(LCD_D, 0x00)
	for index = 0,5 do
		LCDWrite(LCD_D, character)
	end
	LCDWrite(LCD_D, 0x00)
end

function LcdClear()
	c= 84*6
	for index = 0,c do
	tmr.delay(5)
		LCDWrite(LCD_D, 0)
	end
end

function LcdPrintChar(c)
	LCDWrite(LCD_D, 0)
	c = 1+(string.byte(c) - 32)*5
	for index=0,4 do
		LCDWrite(LCD_D, string.byte(chars,c+index))
	end
	LCDWrite(LCD_D, 0)
end

function LcdPrintStr(str)
	local i
	for i = 1, #str do
		a= str:sub(i,i)
		print(a)
	    LcdPrintChar(str:sub(i,i))
	end
end		


function LcdInitialise()
	gpio.mode(PIN_SCE,   gpio.OUTPUT)
	gpio.mode(PIN_RESET, gpio.OUTPUT)
	gpio.mode(PIN_DC,    gpio.OUTPUT)
	gpio.mode(PIN_SDIN,  gpio.OUTPUT)
	gpio.mode(PIN_SCLK,  gpio.OUTPUT)
	
	gpio.write(PIN_SCE,   gpio.LOW)
	gpio.write(PIN_RESET, gpio.LOW)
	tmr.delay(1)
	gpio.write(PIN_RESET, gpio.HIGH)
	
	--Function set (H=0 not extended, H = 1 extended)
	LCDWrite(LCD_C, 0x20)  -- (H=0 not extended)
	
	--Display control
	LCDWrite(LCD_C, 0x0C)  -- LCD in normal mode. 0x0d for inverse

	LCDWrite(LCD_C, 0x21)  -- H=1 (extended).
	LCDWrite(LCD_C, 0x04)  -- Set Temp coefficent. --0x04
	LCDWrite(LCD_C, 0x14)  -- LCD bias mode 1:48. --0x13
	LCDWrite(LCD_C, 0xBF)  -- Set LCD Vop (Contrast). --B1

	LCDWrite(LCD_C, 0x20)  -- H=0 (not extended)
		print("LcdInitialising Done..")
end

function test()	
	LcdInitialise()
	LcdClear()
	LcdLocate(0,0)
	LcdPrintStr(" Arun Eworld ")
	LcdPrintStr("aruneworld.blogspot.com")
	LcdPrintStr("            ")
	LcdPrintStr("arun9047474939@gmail.com")
end

test()
