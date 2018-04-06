--www.ArunEworld.com/embedded/esp8266/esp8266-nodemcu/

--Timer parameters Set
TIMER_ID = 0
TIMER_DELAY_DURATION = 2000		--2second
TIMER_MODE = 1		--Repeatably

--timer alarm function 
tmr.alarm(TIMER_ID, TIMER_DELAY_DURATION, TIMER_MODE, function() Print("Hello World")	end)
