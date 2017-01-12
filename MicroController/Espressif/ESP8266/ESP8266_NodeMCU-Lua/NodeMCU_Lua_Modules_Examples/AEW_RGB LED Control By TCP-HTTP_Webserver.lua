-- Tested On Firmware and Details Below
--[[
	NodeMCU custom build by frightanic.com
	branch: master
	SSL: false
	modules: bit,enduser_setup,file,gpio,http,i2c,mdns,mqtt,net,node,ow,pwm,rtcfifo,rtcmem,rtctime,sntp,tmr,uart,wifi
 	powered by Lua 5.1.4 on SDK 1.5.4.1(39cb9a32)
]]--
-- http://esp8266iot.blogspot.in/
-- http://aruneworld.blogspot.com/
-- Tested By 	: Arun(20170112)
-- Example Name : AAEW_RGB LED Control By TCP-HTTP_Webserver.lua

pwm.setup(1, 100, 512)
pwm.setup(2, 100, 512)
pwm.setup(5, 100, 512)

function urlencode(payload)
    result = {};
    list=split(payload,"\r\n")
    list=split(list[1]," ")
     --print(list[1])
    list=split(list[2],"\/")
	--print(list[2])
    table.insert(result, list[1]);
    table.insert(result, list[2]);
    table.insert(result, list[3]);

    return result;
end

function split(s, delimiter)
    result = {};
    for match in (s..delimiter):gmatch("(.-)"..delimiter) do
        table.insert(result, match);
    end
    return result;
end


function sendHeader(conn)
     conn:send("HTTP/1.1 200 OK\r\n")
     conn:send("Access-Control-Allow-Origin: *\r\n")
     conn:send("Content-Type: application/json; charset=utf-8\r\n")
     conn:send("Server:NodeMCU\r\n")
     conn:send("Connection: close\r\n\r\n")
end

function index(conn)
    conn:send('HTTP/1.1 200 OK\r\nConnection: keep-alive\r\nCache-Control: private, no-store\r\n\r\n\
     <!DOCTYPE HTML><html><head><style>input[type=button] {font-size:large;width:10em;height:5em;}</style>\
     <meta content="text/html;charset=utf-8"><title>ArunEworld_RGB_HTTP </title>\
     <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">\
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>\
     <script>$(document).ready(function(){\
     $("#r").on("change", function(){write_rgb();$("#r-value").html("R = " + $("#r").val());});\
     $("#g").on("change", function(){write_rgb();$("#g-value").html("G = " + $("#g").val());});\
     $("#b").on("change", function(){write_rgb();$("#b-value").html("B = " + $("#b").val());});\
     function write_rgb(){$.ajax({url:"/rgb/"+$("#r").val()+"/"+$("#g").val()+"/"+$("#b").val(), success:function(result){console.log(result);}});}\
     write_rgb()\
     });</script>\
     <body bgcolor="##007f00">\
     <p id="r-value">25</p><div><input style="width: 300px" id="r" type="range"  min="0" max="255" value="25"/></div>\
     <p id="g-value">25</p><div><input style="width: 300px" id="g" type="range"  min="0" max="255" value="25"/></div>\
     <p id="b-value">25</p><div><input style="width: 300px" id="b" type="range"  min="0" max="255" value="25"/></div>\
     </body></html>')  
end
srv=net.createServer(net.TCP)
srv:listen(80,function(conn)
    conn:on("receive",function(conn,payload)
      print("Http client Request..")
	  print("Payload is "..payload)
      list=urlencode(payload) 
      if (list[2]=="") then 
          index(conn)
      elseif (list[2]=="rgb") then
        local r = tonumber(list[3]) 
        local g = tonumber(list[4]) 
        local b = tonumber(list[5]) 
        print(r)
        print(g)
        print(b)
		sr = r
		sg = g
		sb = b
		if  sr >0 then    pwm.setduty(1, sr)
	   else
	   pwm.stop(1)
	   end
	   if  sg >0 then    pwm.setduty(2, sg)
	   else
	   pwm.stop(2)
	   end
	   if  sb >0 then    pwm.setduty(5, sb)
	   else
	   pwm.stop(5)
	   end
	   -- ws2812.writergb(4, string.char(r, g, b):rep(3)) 
        sendHeader(conn)  
        conn:send("{\"result\":\"ok\"}")
      else 
        sendHeader(conn)  
        conn:send("{\"result\":\"error\",\"message\": \"command not found\"}")        
      end
      conn:close()
    end) 
end)
