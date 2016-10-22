--bmp085.temperature
bmp085.init(1, 2)
local t = bmp085.temperature()
print(string.format("Temperature: %s.%s degrees C", t / 10, t % 10))

--bmp085.pressure()
bmp085.init(1, 2)
local p = bmp085.pressure()
print(string.format("Pressure: %s.%s mbar", p / 100, p % 100))

--bmp085.pressure_raw()
oversampling_setting = 0 -- integer that can be 0, 1, 2 or 3
bmp085.pressure_raw(oversampling_setting)