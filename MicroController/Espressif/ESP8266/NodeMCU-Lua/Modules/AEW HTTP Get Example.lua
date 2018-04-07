station_cfg={}
station_cfg.ssid="ArunEworld"     -- Enter SSID here
station_cfg.pwd="8300026060INDIA"  --Enter password here
server_link = "http://iot.aruneworld.com/httt-get.txt" -- set server URL

wifi.setmode(wifi.STATION)  -- set wi-fi mode to station
wifi.sta.config(station_cfg)-- set ssid&pwd to config
wifi.sta.connect()          -- connect to router

--Wifi Eent Monitoring file
wifi.eventmon.register(wifi.eventmon.STA_CONNECTED, function(T)
 print("\n\tSTA - CONNECTED".."\n\tSSID: "..T.SSID.."\n\tBSSID: "..
 T.BSSID.."\n\tChannel: "..T.channel)
 
 end)

 wifi.eventmon.register(wifi.eventmon.STA_DISCONNECTED, function(T)
 print("\n\tSTA - DISCONNECTED".."\n\tSSID: "..T.SSID.."\n\tBSSID: "..
 T.BSSID.."\n\treason: "..T.reason)
	tmr.stop(0)
 end)

 wifi.eventmon.register(wifi.eventmon.STA_GOT_IP, function(T)
 print("\n\tSTA - GOT IP".."\n\tStation IP: "..T.IP.."\n\tSubnet mask: "..
 T.netmask.."\n\tGateway IP: "..T.gateway)
 tmr.start(0)
 end)

 
function GetFromArunEworld()-- callback function for get data
http.get(server_link,'',
function(code, data)
    if (code < 0) then
     print("HTTP request failed")
    else
     print(code, data)
    end
  end)
end

-- call get function after each 5 second
tmr.alarm(1, 5000, 1, function() GetFromArunEworld() end)