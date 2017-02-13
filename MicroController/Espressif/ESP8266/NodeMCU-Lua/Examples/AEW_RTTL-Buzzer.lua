

--Ported to LUA from https://gist.github.com/tagliati/1804108 (Andre Tagliati)  
 --by AReResearch (www.areresearch.net) Andy Reischle  
 --Port index4=GPIO2  
 speakerPin = 2
 --gpio.mode(speakerPin,gpio.OUTPUT)  
 --speaker connected port  
 --Tone table 
-- (According to musical frequency conventions, there are twelve notes in all, namely, A, A#, B, C, C#, D, D#, E, F, F#, G and G#, where ‘# ‘sign indicates a sharp note.)
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
 --frequencies for the tones we're going to use  
 --used http://home.mit.bme.hu/~bako/tonecalc/tonecalc.htm to get these  
 function beep(pin, tone, duration)  
 local freq = t[tone]  
 print ("Frequency:" .. freq)  
 pwm.setup(pin, freq, 512)  
 pwm.start(pin)  
 -- delay in uSeconds  
 tmr.delay(duration * 1000)  
 pwm.stop(pin)  
 --20ms pause  
 tmr.wdclr()  
 tmr.delay(20000)  
 end  
 --Play it  
   --for the sheet music see:  
   --http://www.musicnotes.com/sheetmusic/mtd.asp?ppn=MN0016254  
   --this is just a translation of said sheet music to frequencies / time in ms  
   --used 500 ms for a quart note  
   beep(speakerPin, "a", 500)  
   beep(speakerPin, "a", 500)  
   beep(speakerPin, "a", 500)  
   beep(speakerPin, "f", 350)  
   beep(speakerPin, "cH", 150)  
   beep(speakerPin, "a", 500)  
   beep(speakerPin, "f", 350)  
   beep(speakerPin, "cH", 150)  
   beep(speakerPin, "a", 1000)  
   --first bit  
   beep(speakerPin, "eH", 500)  
   beep(speakerPin, "eH", 500)  
   beep(speakerPin, "eH", 500)  
   beep(speakerPin, "fH", 350)  
   beep(speakerPin, "cH", 150)  
   beep(speakerPin, "gS", 500)  
   beep(speakerPin, "f", 350)  
   beep(speakerPin, "cH", 150)  
   beep(speakerPin, "a", 1000)  
   --second bit...  
   beep(speakerPin, "aH", 500)  
   beep(speakerPin, "a", 350)  
   beep(speakerPin, "a", 150)  
   beep(speakerPin, "aH", 500)  
   beep(speakerPin, "gSH", 250)  
   beep(speakerPin, "gH", 250)  
   beep(speakerPin, "fSH", 125)  
   beep(speakerPin, "fH", 125)  
   beep(speakerPin, "fSH", 250)  
   tmr.delay(250000)  
   beep(speakerPin, "aS", 250)  
   beep(speakerPin, "dSH", 500)  
   beep(speakerPin, "dH", 250)  
   beep(speakerPin, "cSH", 250)  
   --start of the interesting bit  
   beep(speakerPin, "cH", 125)  
   beep(speakerPin, "b", 125)  
   beep(speakerPin, "cH", 250)  
   tmr.delay(250000)  
   beep(speakerPin, "f", 125)  
   beep(speakerPin, "gS", 500)  
   beep(speakerPin, "f", 375)  
   beep(speakerPin, "a", 125)  
   beep(speakerPin, "cH", 500)  
   beep(speakerPin, "a", 375)  
   beep(speakerPin, "cH", 125)  
   beep(speakerPin, "eH", 1000)  
   --more interesting stuff (this doesn't quite get it right somehow)  
   beep(speakerPin, "aH", 500)  
   beep(speakerPin, "a", 350)  
   beep(speakerPin, "a", 150)  
   beep(speakerPin, "aH", 500)  
   beep(speakerPin, "gSH", 250)  
   beep(speakerPin, "gH", 250)  
   beep(speakerPin, "fSH", 125)  
   beep(speakerPin, "fH", 125)  
   beep(speakerPin, "fSH", 250)  
   tmr.delay(250000)  
   beep(speakerPin, "aS", 250)  
   beep(speakerPin, "dSH", 500)  
   beep(speakerPin, "dH", 250)  
   beep(speakerPin, "cSH", 250)  
   --repeat... repeat  
   beep(speakerPin, "cH", 125)  
   beep(speakerPin, "b", 125)  
   beep(speakerPin, "cH", 250)  
   tmr.delay(250000)  
   beep(speakerPin, "f", 250)  
   beep(speakerPin, "gS", 500)  
   beep(speakerPin, "f", 375)  
   beep(speakerPin, "cH", 125)  
   beep(speakerPin, "a", 500)  
   beep(speakerPin, "f", 375)  
   beep(speakerPin, "c", 125)  
   beep(speakerPin, "a", 1000)  
   --and we're done \ó/ 
