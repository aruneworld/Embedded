--[[		Tested On Firmware and Details Below
	NodeMCU custom build by frightanic.com
	branch: master
	SSL: false
	modules: bit,enduser_setup,file,gpio,http,i2c,mdns,mqtt,net,node,ow,pwm,rtcfifo,rtcmem,rtctime,sntp,tmr,uart,wifi
 	powered by Lua 5.1.4 on SDK 1.5.4.1(39cb9a32)
]]--
-- http://esp8266iot.blogspot.in/
-- http://aruneworld.blogspot.com/
-- Tested By 	: Arun(20170112)
-- Example Name : AEW_WiFi_ViewSavedNetworks.lua



function WiFi_Saved_Networks()
	--print stored access point info(formatted)
	do
	  local x=wifi.sta.getapinfo()
	  local y=wifi.sta.getapindex()
	  print("\n Number of APs stored in flash:", x.qty)
	  print(string.format("  %-6s %-32s %-64s %-18s", "index:", "SSID:", "Password:", "BSSID:"))
	  for i=1, (x.qty), 1 do
		print(string.format(" %s%-6d %-32s %-64s %-18s",(i==y and ">" or " "), i, x[i].ssid, x[i].pwd and x[i].pwd or type(nil), x[i].bssid and x[i].bssid or type(nil)))
	  end
	end
end

WiFi_Saved_Networks()
