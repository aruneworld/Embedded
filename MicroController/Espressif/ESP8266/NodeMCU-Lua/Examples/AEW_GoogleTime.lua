station_cfg={}
station_cfg.ssid= "JioFiUltimo" station_cfg.pwd= "8123020000UI"


wifi.eventmon.register(wifi.eventmon.STA_CONNECTED, function(T)
print("\n\tSTA - CONNECTED".."\n\tSSID: "..T.SSID.."\n\tBSSID: "..T.BSSID.."\n\tChannel: "..T.channel)

end)
wifi.eventmon.register(wifi.eventmon.STA_DISCONNECTED, function(T)
	 print("\n\tSTA - DISCONNECTED".."\n\tSSID: "..T.SSID.."\n\tBSSID: "..T.BSSID.."\n\treason: "..T.reason)
end)
wifi.eventmon.register(wifi.eventmon.STA_GOT_IP, function(T)
	 print("\n\tSTA - GOT IP".."\n\tStation IP: "..T.IP.."\n\tSubnet mask: "..T.netmask.."\n\tGateway IP: "..T.gateway)
	 sta_ip = T.IP
end)



conn=net.createConnection(net.TCP, 0) 

conn:on("connection",function(conn, payload)
            conn:send("HEAD / HTTP/1.1\r\n".. 
                      "Host: google.com\r\n"..
                      "Accept: */*\r\n"..
                      "User-Agent: Mozilla/4.0 (compatible; esp8266 Lua;)"..
                      "\r\n\r\n") 
            end)
            
conn:on("receive", function(conn, payload)
    print('\nRetrieved in '..((tmr.now()-t)/1000)..' milliseconds.')
    print('Google says it is '..string.sub(payload,string.find(payload,"Date: ")
           +6,string.find(payload,"Date: ")+35))
    conn:close()
    end) 
t = tmr.now()    
conn:connect(80,'google.com')
