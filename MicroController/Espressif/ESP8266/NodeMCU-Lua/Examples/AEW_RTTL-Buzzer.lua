
--[[-- http://esp8266iot.blogspot.in/
	-- http://aruneworld.blogspot.com/
	-- Tested By 	: Arun(20170219)
	-- Example Name : AEW_RTTL-Buzzer.lua
	
	Tested Firmware Details :
	NodeMCU custom build by frightanic.com
	branch: master
	SSL: false
	modules:bit,enduser_setup,file,gpio,http,i2c,mdns,mqtt,net,node,
			ow,pwm,rtcfifo,rtcmem,rtctime,sntp,tmr,uart,wifi
 	powered by Lua 5.1.4 on SDK 1.5.4.1(39cb9a32)

	this code is simply modified from original
	True Credits - Arduino sketch by Andre Tagliati
	Credits - Lua code by Andreas Reischle
]]--

 
local BuzzerPin = 1  -- int PWM pin GPIO-5
 
--[[ Tone table  
	(According to musical frequency conventions,
	there are twelve notes in all,	namely,
	A, A#, B, C, C#, D, D#, E, F, F#, G and G#,
	where ‘# ‘sign indicates a sharp note.) 
]]--
t={}
t["c"]=261
t["d"]= 294
t["e"]= 329
t["f"]= 349
t["g"]= 391
t["gS"]= 415
t["a"]= 440
t["aS"]= 455
t["b"]= 466
t["cH"]= 523
t["cSH"]= 554
t["dH"]= 587
t["dSH"]= 622
t["eH"]= 659
t["fH"]= 698
t["fSH"]= 740
t["gH"]= 784
t["gSH"]= 830
t["aH"]= 880

local function Play(tone, duration)
	local freq = t[tone]
	print ("Frequency:" .. freq)
	pwm.setup(BuzzerPin, freq, 512)
	pwm.start(BuzzerPin)
	tmr.delay(duration * 1000)  --delay in us
	pwm.stop(BuzzerPin)
	tmr.wdclr()
	tmr.delay(20000)  --delay in 20ms pause
 end  
 
 
local function Imperial_March()
--[[Play it  
	for the sheet music see:  
	http://www.musicnotes.com/sheetmusic/mtd.asp?ppn=MN0016254  
	this is just a translation of said sheet music to frequencies / time in ms  
	used 500 ms for a quart note  
]]--
	Play("a", 500)  
	Play("a", 500)  
	Play("a", 500)  
	Play("f", 350)  
	Play("cH", 150)  
	Play("a", 500)  
	Play("f", 350)  
	Play("cH", 150)  
	Play("a", 1000)  
	--first bit  
	Play("eH", 500)  
	Play("eH", 500)  
	Play("eH", 500)  
	Play("fH", 350)  
	Play("cH", 150)  
	Play("gS", 500)  
	Play("f", 350)  
	Play("cH", 150)  
	Play("a", 1000)  
	--second bit...  
	Play("aH", 500)  
	Play("a", 350)  
	Play("a", 150)  
	Play("aH", 500)  
	Play("gSH", 250)  
	Play("gH", 250)  
	Play("fSH", 125)  
	Play("fH", 125)  
	Play("fSH", 250)  
	tmr.delay(250000)  
	Play("aS", 250)  
	Play("dSH", 500)  
	Play("dH", 250)  
	Play("cSH", 250)  
	--start of the interesting bit  
	Play("cH", 125)  
	Play("b", 125)  
	Play("cH", 250)  
	tmr.delay(250000)  
	Play("f", 125)  
	Play("gS", 500)  
	Play("f", 375)  
	Play("a", 125)  
	Play("cH", 500)  
	Play("a", 375)  
	Play("cH", 125)  
	Play("eH", 1000)  
	--more interesting stuff (this doesn't quite get it right somehow)  
	Play("aH", 500)  
	Play("a", 350)  
	Play("a", 150)  
	Play("aH", 500)  
	Play("gSH", 250)  
	Play("gH", 250)  
	Play("fSH", 125)  
	Play("fH", 125)  
	Play("fSH", 250)  
	tmr.delay(250000)  
	Play("aS", 250)  
	Play("dSH", 500)  
	Play("dH", 250)  
	Play("cSH", 250)  
	--repeat... repeat  
	Play("cH", 125)  
	Play("b", 125)  
	Play("cH", 250)  
	tmr.delay(250000)  
	Play("f", 250)  
	Play("gS", 500)  
	Play("f", 375)  
	Play("cH", 125)  
	Play("a", 500)  
	Play("f", 375)  
	Play("c", 125)  
	Play("a", 1000)  
	--and we're done \ó/ 
end

tmr.alarm(0, 60000, 1,function() Imperial_March() end)
