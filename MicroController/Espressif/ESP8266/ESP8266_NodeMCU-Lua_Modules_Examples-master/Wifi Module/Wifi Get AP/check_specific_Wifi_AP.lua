--check for specific AP
function listap(t)
    print("\n\t\t\tSSID\t\t\t\t\tBSSID\t\t\t  RSSI\t\tAUTHMODE\t\tCHANNEL")
    for bssid,v in pairs(t) do
        local ssid, rssi, authmode, channel = string.match(v, "([^,]+),([^,]+),([^,]+),([^,]*)")
        print(string.format("%32s",ssid).."\t"..bssid.."\t  "..rssi.."\t\t"..authmode.."\t\t\t"..channel)
    end
end
scan_cfg = {}
scan_cfg.ssid = "D88" 
scan_cfg.bssid = "b4:75:0e:ac:e3:f5" 
scan_cfg.channel = 0
scan_cfg.show_hidden = 1
wifi.sta.getap(scan_cfg, 1, listap)