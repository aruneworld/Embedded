--	http://nodemcu.readthedocs.io/en/master/en/modules/http/

--[[
http://esp8266iot.blogspot.in/
http://aruneworld.blogspot.com/
https://github.com/adalurarun/Embedded_System/MicroController/Espressif/ESP8266
Copyright Arun 2016-2017
MIT License

If you like this project, please add a star!
]]--

	-----------------------------------------------------------------------------------------------------------------------------------
	-----------------------------------------------	HTTP Module	-------------------------------------------------------------------
	-----------------------------------------------------------------------------------------------------------------------------------
local HTTP = ...			-- Obtain a sample value from somewhere
local HTTP_Module =  {}	-- conHTTP an empty table and assign it to variable "Table_name" (ex: local Arun =  {})
_G[HTTP] = HTTP_Module	--	A global variable (not a function) that holds the global environment

function HTTP_Module.delete(url, headers, body, callback)
--[[	http.delete()		-	Executes a HTTP DELETE request. Note that concurrent requests are not supported.
	Syntax		-	http.delete(url, headers, body, callback)
	Parameters	-	url The URL to fetch, including the http:// or https:// prefix
					headers Optional additional headers to append, including \r\n; may be nil
					body The body to post; must already be encoded in the appropriate format, but may be empty
					callback The callback function to be invoked when the response has been received; it is invoked with the arguments status_code and body
	Returns		-	nil
	Example		
	http.delete('http://httpbin.org/delete',
	  "",
	  "",
	  function(code, data)
		if (code < 0) then
		  print("HTTP request failed")
		else
		  print(code, data)
		end
	  end)
]]--
end

function HTTP_Module.get(url, headers, callback)
--[[	http.get()	-	Executes a HTTP GET request. Note that concurrent requests are not supported.
	Syntax		-	http.get(url, headers, callback)
	Parameters	-	url The URL to fetch, including the http:// or https:// prefix
					headers Optional additional headers to append, including \r\n; may be nil
					callback The callback function to be invoked when the response has been received; it is invoked with the arguments status_code and body
	Returns		-	nil
	Example

	http.get("http://httpbin.org/ip", nil, function(code, data)
		if (code < 0) then
		  print("HTTP request failed")
		else
		  print(code, data)
		end
	  end)

]]--
end

function HTTP_Module.post(url, headers, body, callback)
--[[	http.post()		-	Executes a HTTP POST request. Note that concurrent requests are not supported.
	Syntax		-	http.post(url, headers, body, callback)
	Parameters	-	url The URL to fetch, including the http:// or https:// prefix
					headers Optional additional headers to append, including \r\n; may be nil
					body The body to post; must already be encoded in the appropriate format, but may be empty
					callback The callback function to be invoked when the response has been received; it is invoked with the arguments status_code and body
	Returns		-	nil
--	Example

		http.post('http://httpbin.org/post',
		  'Content-Type: application/json\r\n',
		  '{"hello":"world"}',
		  function(code, data)
			if (code < 0) then
			  print("HTTP request failed")
			else
			  print(code, data)
			end
		  end)
]]--
end

function HTTP_Module.put(url, headers, body, callback)
--[[	http.put()	-	Executes a HTTP PUT request. Note that concurrent requests are not supported.
	Syntax		-	http.put(url, headers, body, callback)
	Parameters	-	url The URL to fetch, including the http:// or https:// prefix
					headers Optional additional headers to append, including \r\n; may be nil
					body The body to post; must already be encoded in the appropriate format, but may be empty
					callback The callback function to be invoked when the response has been received; it is invoked with the arguments status_code and body
	Returns		-	nil
--	Example
	http.put('http://httpbin.org/put',
	  'Content-Type: text/plain\r\n',
	  'Hello!\nStay a while, and listen...\n',
	  function(code, data)
		if (code < 0) then
		  print("HTTP request failed")
		else
		  print(code, data)
		end
	  end)
]]--
end

function HTTP_Module.request(url, method, headers, body, callback)
--[[	http.request()	-	Execute a custom HTTP request for any HTTP method. Note that concurrent requests are not supported.
	Syntax		-	http.request(url, method, headers, body, callback)
	Parameters	-	url The URL to fetch, including the http:// or https:// prefix
					method The HTTP method to use, e.g. "GET", "HEAD", "OPTIONS" etc
					headers Optional additional headers to append, including \r\n; may be nil
					body The body to post; must already be encoded in the appropriate format, but may be empty
					callback The callback function to be invoked when the response has been received; it is invoked with the arguments status_code and body
	Returns		-	nil
	Example	

		http.request("http://httpbin.org", "HEAD", "", "", 
		  function(code, data)
			if (code < 0) then
			  print("HTTP request failed")
			else
			  print(code, data)
			end
		  end)
]]--
end

return HTTP_Module.