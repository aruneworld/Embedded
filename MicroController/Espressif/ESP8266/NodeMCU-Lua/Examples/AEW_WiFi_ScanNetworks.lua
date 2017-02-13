function Wifi_Scan_Networks()
	-- print AP list in new format
	print("[LOG]:Avaibale Networks ")
	function listap(t)
		for k,v in pairs(t) do		print(k)	--print(k.." : "..v)
		end
	end
	wifi.sta.getap(listap)
end

Wifi_Scan_Networks()
