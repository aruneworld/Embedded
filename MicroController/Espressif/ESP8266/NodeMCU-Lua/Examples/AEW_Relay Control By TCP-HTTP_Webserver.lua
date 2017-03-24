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
-- Tested By 	: Arun (20170112)
-- Example Name : AEW_Relay Control By TCP-HTTP_Webserver.lua
wifi.sta.config("SSID","Password") --please change your SSID and Password
print(wifi.sta.getip())

Light_1 = 4
Light_2 = 3
Light_3 = 1
Light_4 = 2
Light_5 = 0
Light_6 = 5
Light_7 = 6
gpio.mode(Light_1, gpio.OUTPUT)
gpio.mode(Light_2, gpio.OUTPUT)
gpio.mode(Light_3, gpio.OUTPUT)
gpio.mode(Light_4, gpio.OUTPUT)
gpio.mode(Light_5, gpio.OUTPUT)
gpio.mode(Light_6, gpio.OUTPUT)
gpio.mode(Light_7, gpio.OUTPUT)
srv=net.createServer(net.TCP)
srv:listen(80,function(conn)
    conn:on("receive", function(client,request)
        local buf = "";
        local _, _, method, path, vars = string.find(request, "([A-Z]+) (.+)?(.+) HTTP");
        if(method == nil)then
            _, _, method, path = string.find(request, "([A-Z]+) (.+) HTTP");
        end
        local _GET = {}
        if (vars ~= nil)then
            for k, v in string.gmatch(vars, "(%w+)=(%w+)&*") do
                _GET[k] = v
            end
        end
        buf = buf.."<h1> Ultimo Home Auromation </h1>";
        buf = buf.."<p>Light-1 <a href=\"?pin=ON1\"><button>ON</button></a>&nbsp;<a href=\"?pin=OFF1\"><button>OFF</button></a></p>";
        buf = buf.."<p>Light-2 <a href=\"?pin=ON2\"><button>ON</button></a>&nbsp;<a href=\"?pin=OFF2\"><button>OFF</button></a></p>";
        buf = buf.."<p>Light-3 <a href=\"?pin=ON3\"><button>ON</button></a>&nbsp;<a href=\"?pin=OFF3\"><button>OFF</button></a></p>";
        buf = buf.."<p>Light-4 <a href=\"?pin=ON4\"><button>ON</button></a>&nbsp;<a href=\"?pin=OFF4\"><button>OFF</button></a></p>";
        buf = buf.."<p>Light-5 <a href=\"?pin=ON5\"><button>ON</button></a>&nbsp;<a href=\"?pin=OFF5\"><button>OFF</button></a></p>";
        buf = buf.."<p>Light-6 <a href=\"?pin=ON6\"><button>ON</button></a>&nbsp;<a href=\"?pin=OFF6\"><button>OFF</button></a></p>";
        buf = buf.."<p>Light-7 <a href=\"?pin=ON7\"><button>ON</button></a>&nbsp;<a href=\"?pin=OFF7\"><button>OFF</button></a></p>";
		local _on,_off = "",""
        if(_GET.pin == "ON1")then   gpio.write(Light_1, gpio.HIGH);
        elseif(_GET.pin == "OFF1")then  gpio.write(Light_1, gpio.LOW);
        elseif(_GET.pin == "ON2")then   gpio.write(Light_2, gpio.HIGH);
        elseif(_GET.pin == "OFF2")then  gpio.write(Light_2, gpio.LOW);
        elseif(_GET.pin == "ON3")then   gpio.write(Light_3, gpio.HIGH);
        elseif(_GET.pin == "OFF3")then  gpio.write(Light_3, gpio.LOW);
        elseif(_GET.pin == "ON4")then   gpio.write(Light_4, gpio.HIGH);
        elseif(_GET.pin == "OFF4")then  gpio.write(Light_4, gpio.LOW);
        elseif(_GET.pin == "ON5")then   gpio.write(Light_5, gpio.HIGH);
        elseif(_GET.pin == "OFF5")then  gpio.write(Light_5, gpio.LOW);
        elseif(_GET.pin == "ON6")then   gpio.write(Light_6, gpio.HIGH);
        elseif(_GET.pin == "OFF6")then  gpio.write(Light_6, gpio.LOW);
        elseif(_GET.pin == "ON7")then   gpio.write(Light_7, gpio.HIGH);
        elseif(_GET.pin == "OFF7")then  gpio.write(Light_7, gpio.LOW);
     end
        client:send(buf);
        client:close();
        collectgarbage();
    end)
end)
