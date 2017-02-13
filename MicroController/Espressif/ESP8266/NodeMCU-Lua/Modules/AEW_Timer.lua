--	http://nodemcu.readthedocs.io/en/master/en/modules/tmr/

--[[
http://esp8266iot.blogspot.in/
http://aruneworld.blogspot.com/
https://github.com/adalurarun/Embedded_System/MicroController/Espressif/ESP8266
Copyright Arun 2016-2017
MIT License

If you like this project, please add a star!
]]--

-------------------------------------------------------------------------------------------------------------------
-------------------------------		Timer Module		-----------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------
local Timer = ...			-- Obtain a sample value from somewhere
local Timer_Module =  {}	-- construct an empty table and assign it to variable "Table_name" (ex: local Arun =  {})
_G[Timer] = Timer_Module	--	A global variable (not a function) that holds the global environment 

--[[	The tmr module allows access to simple timers, the system counter and uptime.

		It is aimed at setting up regularly occurring tasks, timing out operations, and provide low-resolution deltas.

		What the tmr module is not however, is a time keeping module. While most timeouts are expressed in milliseconds or even microseconds, the accuracy is limited and compounding errors would lead to rather inaccurate time keeping. Consider using the rtctime module for "wall clock" time.

		NodeMCU provides 7 timers, numbered 0-6. It is currently up to the user to keep track of which timers are used for what.
		tmr.alarm()			This is a convenience function combining tmr.
		tmr.delay()			Busyloops the processor for a specified number of microseconds.
		tmr.interval()		Changes a registered timer's expiry interval.
		tmr.now()			Returns the system counter, which counts in microseconds.
		tmr.register()		Configures a timer and registers the callback function to call on expiry.
		tmr.softwd()		Provides a simple software watchdog, which needs to be re-armed or disabled before it expires, or the system will be restarted.
		tmr.start()			Starts or restarts a previously configured timer.
		tmr.state()			Checks the state of a timer.
		tmr.stop()			Stops a running timer, but does not unregister it.
		tmr.time()			Returns the system uptime, in seconds.
		tmr.unregister()	Stops the timer (if running) and unregisters the associated callback.
		tmr.wdclr()			Feed the system watchdog.
]]--

function Timer_Module.alarm(mode, ms)
--[[	tmr.alarm()	-	This is a convenience function combining tmr.register() and tmr.start() into a single call.

		To free up the resources with this timer when done using it, call tmr.unregister() on it. For one-shot timers this is not necessary, unless they were stopped before they expired.
		Parameters	:	id timer id (0-6)
						interval_ms timer interval in milliseconds. Maximum value is 6870947 (1:54:30.947).
						mode timer mode:
							tmr.ALARM_SINGLE a one-shot alarm (and no need to call tmr.unregister())
							tmr.ALARM_SEMI manually repeating alarm (call tmr.start() to restart)
							tmr.ALARM_AUTO automatically repeating alarm

		Returns		:	true if the timer was started, false on error
		Example		:	tmr.alarm(0, 5000, tmr.ALARM_SINGLE, function() print("www.ArunEworld.blogspot.com") end) then 	print("www.facebook.com/ArunEworld")	print("www.twitter.com/ArunEworld") end
		See also	:	tmr.register()
						tmr.start()
						tmr.unregister()
]]--
	tmr.alarm(0, 5000, tmr.ALARM_SINGLE, function() print("www.ArunEworld.blogspot.com") end)
end

function Timer_Module.delay(us)
--[[	tmr.delay()	-	Busyloops the processor for a specified number of microseconds.

		This is in general a bad idea, because nothing else gets to run, and the networking stack (and other things) can fall over as a result. The only time tmr.delay() may be appropriate to use is if dealing with a peripheral device which needs a (very) brief delay between commands, or similar. Use with caution!
		Also note that the actual amount of time delayed for may be noticeably greater, both as a result of timing inaccuracies as well as interrupts which may run during this time.
		
		Syntax		:	tmr.delay(us)
		Parameters	:	us microseconds to busyloop for
		Returns		:	nil
		Example		:	tmr.delay(100)
]]--
tmr.delay(100)			-- tmr.delay(us)
end
function Timer_Module.interval(id, interval_ms)
--[[	tmr.interval()
	Changes a registered timer's expiry interval.
	Syntax		:	tmr.interval(id, interval_ms)
	Parameters	:	id timer id (0-6)
						interval_ms new timer interval in milliseconds. Maximum value is 6870947 (1:54:30.947).
	Returns		:	nil
	Example		:
			tmr.register(0, 5000, tmr.ALARM_SINGLE, function() print("www.ArunEworld.blogspot.com") end)	print("www.facebook.com/ArunEworld")	print("www.twitter.com/ArunEworld") end)
			tmr.interval(0, 3000) -- actually, 3 seconds is better!
]]--
tmr.register(0, 5000, tmr.ALARM_SINGLE, print("www.ArunEworld.blogspot.com") print("www.facebook.com/ArunEworld")	print("www.twitter.com/ArunEworld") end
tmr.interval(0, 3000) -- actually, 3 seconds is better!
end		

function Timer_Module.now()
--[[	tmr.now()	-	Returns the system counter, which counts in microseconds. Limited to 31 bits, after that it wraps around back to zero. That is essential if you use this function to debounce or throttle GPIO input.
		Syntax		-	tmr.now()
		Parameters	-	none
		Returns		-	the current value of the system counter
		Example		-	
						print(tmr.now())
						print(tmr.now())
]]--
tmr.now()
end

function Timer_Module.register(id, interval_ms, mode, func)
--[[	tmr.register()	-	Configures a timer and registers the callback function to call on expiry.

		To free up the resources with this timer when done using it, call tmr.unregister() on it. For one-shot timers this is not necessary, unless they were stopped before they expired.
		Syntax		:	tmr.register(id, interval_ms, mode, func)
		Parameters	:	id timer id (0-6)
						interval_ms timer interval in milliseconds. Maximum value is 6870947 (1:54:30.947).
						mode timer mode	:	tmr.ALARM_SINGLE a one-shot alarm (and no need to call tmr.unregister())
											tmr.ALARM_SEMI manually repeating alarm (call tmr.start() to restart)
											tmr.ALARM_AUTO automatically repeating alarm
													Note that registering does not start the alarm.
		Returns		:	nil
		Example		:
					tmr.register(0, 5000, tmr.ALARM_SINGLE, function() print("www.ArunEworld.blogspot.com") end)
					tmr.start(0)
]]--
--tmr.register(id, interval_ms, mode, func)
tmr.register(0, 5000, tmr.ALARM_SINGLE, function() 	print("www.ArunEworld.blogspot.com")	print("www.facebook.com/ArunEworld")	print("www.twitter.com/ArunEworld")	end)			
end

function Timer_Module.softwd(timeout_s)
--[[	tmr.softwd()	-	Provides a simple software watchdog, which needs to be re-armed or disabled before it expires, or the system will be restarted.
		Syntax		:	tmr.softwd(timeout_s)
		Parameters	:	timeout_s watchdog timeout, in seconds. To disable the watchdog, use -1 (or any other negative value).
		Returns		:	nil
		Example		:	function on_success_callback()
						tmr.softwd(-1)
						print("Complex task done, soft watchdog disabled!")
						end
						tmr.softwd(5)
						-- go off and attempt to do whatever might need a restart to recover from
						complex_stuff_which_might_never_call_the_callback(on_success_callback)
]]--
function on_success_callback()
	tmr.softwd(-1)
	print("Complex task done, soft watchdog disabled!")
end
tmr.softwd(5)
-- go off and attempt to do whatever might need a restart to recover from
complex_stuff_which_might_never_call_the_callback(on_success_callback)
end

function Timer_Module.start(id)
--[[	tmr.start()		-	Starts or restarts a previously configured timer.
		Syntax		:	tmr.start(id)
		Parameters	:	id timer id (0-6)
		Returns		:	true if the timer was started, false on error
		Example		:	tmr.register(0, 5000, tmr.ALARM_SINGLE, function() print("www.ArunEworld.blogspot.com") end) print("www.facebook.com/ArunEworld")	print("www.twitter.com/ArunEworld") end)
						if not tmr.start(0) then print("uh oh") end
]]--
tmr.register(0, 5000, tmr.ALARM_SINGLE, function() print("www.ArunEworld.blogspot.com")	print("www.facebook.com/ArunEworld")	print("www.twitter.com/ArunEworld") end)	if not tmr.start(0) then print("uh oh") end
end

function Timer_Module.state(id)
--[[	tmr.state()	-	Checks the state of a timer.
		Syntax		:	tmr.state(id)
		Parameters	:	id timer id (0-6)
		Returns		:	(bool, int) or nil
						If the specified timer is registered, returns whether it is currently started and its mode. If the timer is not registered, nil is returned.
		Example		:	running, mode = tmr.state(0)
]]--
running, mode = tmr.state(0)
end

function Timer_Module.stop()
--[[		tmr.stop()	-	Stops a running timer, but does not unregister it. A stopped timer can be restarted with tmr.start().
		Syntax		:	tmr.stop(id)
		Parameters	:	id timer id (0-6)	
		Returns		:	true if the timer was stopped, false on error
		Example		:	if not tmr.stop(2) then print("timer 2 not stopped, not registered?") end
		See also	:	tmr.register()
						tmr.stop()
						tmr.unregister()
]]--
if not tmr.stop(2) then print("timer 2 not stopped, not registered?") end
end

function Timer_Module.time()
--[[	tmr.time()	-	Returns the system uptime, in seconds. Limited to 31 bits, after that it wraps around back to zero.
		Syntax		:	tmr.time()
		Parameters	:	none
		Returns		:	the system uptime, in seconds, possibly wrapped around
		Example		:	print("Uptime (probably):", tmr.time())
]]--
print("Uptime (probably):", tmr.time())
end

function Timer_Module.unregister(id)
--[[	tmr.unregister()	-	Stops the timer (if running) and unregisters the associated callback.

		This isn't necessary for one-shot timers (tmr.ALARM_SINGLE), as those automatically unregister themselves when fired.
		Syntax		:	tmr.unregister(id)
		Parameters	:	id timer id (0-6)
		Returns		:	nil
		Example		:	tmr.unregister(0)
		See also	:	tmr.register()
]]--
tmr.unregister(0)
end

function Timer_Module.wdclr()
--[[	tmr.wdclr()	-	Feed the system watchdog.

		In general, if you ever need to use this function, you are doing it wrong.

		The event-driven model of NodeMCU means that there is no need to be sitting in hard loops waiting for things to occur. Rather, simply use the callbacks to get notified when somethings happens. With this approach, there should never be a need to manually feed the system watchdog.
		Syntax		:	tmr.wdclr()
		Parameters	:	none
		Returns		:	nil
]]--
tmr.wdclr()
end
return Timer_Module