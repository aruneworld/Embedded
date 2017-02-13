-- http://nodemcu.readthedocs.io/en/master/en/modules/mqtt/

--[[
http://esp8266iot.blogspot.in/
http://aruneworld.blogspot.com/
https://github.com/adalurarun/Embedded_System/MicroController/Espressif/ESP8266
Copyright Arun 2016-2017
MIT License

If you like this project, please add a star!
]]--

	----------------------------------------------------------------------------------------------------------------------------------
	-----------------------------------------------	MQTT Module	----------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------------------------------------
local MQTT = ...			-- Obtain a sample value from somewhere
local MQTT_Module =  {}	-- conMQTT an empty table and assign it to variable "Table_name" (ex: local Arun =  {})
_G[MQTT] = MQTT_Module	--	A global variable (not a function) that holds the global environment

------------------------------------------------------ MQTT Client ---------------------------------------------
function MQTT_Module.Client(clientid, keepalive, username, password[, cleansession])
--[[	mqtt.Client()	-	Creates a MQTT client.
	Syntax		-	mqtt.Client(clientid, keepalive, username, password[, cleansession])
	Parameters	-	clientid client ID
					keepalive keepalive seconds
					username user name
					password user password
					cleansession 0/1 for false/true
	Returns		-	MQTT client
--	Example	

			-- init mqtt client with keepalive timer 120sec
			m = mqtt.Client("clientid", 120, "user", "password")

			-- setup Last Will and Testament (optional)
			-- Broker will publish a message with qos = 0, retain = 0, data = "offline" 
			-- to topic "/lwt" if client don't send keepalive packet
			m:lwt("/lwt", "offline", 0, 0)

			m:on("connect", function(client) print ("connected") end)
			m:on("offline", function(client) print ("offline") end)

			-- on publish message receive event
			m:on("message", function(client, topic, data) 
			  print(topic .. ":" ) 
			  if data ~= nil then
				print(data)
			  end
			end)

			-- for TLS: m:connect("192.168.11.118", secure-port, 1)
			m:connect("192.168.11.118", 1883, 0, function(client) print("connected") end, 
												 function(client, reason) print("failed reason: "..reason) end)

			-- Calling subscribe/publish only makes sense once the connection
			-- was successfully established. In a real-world application you want
			-- move those into the 'connect' callback or make otherwise sure the 
			-- connection was established.

			-- subscribe topic with qos = 0
			m:subscribe("/topic",0, function(client) print("subscribe success") end)
			-- publish a message with data = hello, QoS = 0, retain = 0
			m:publish("/topic","hello",0,0, function(client) print("sent") end)

			m:close();
			-- you can call m:connect again
]]--

end

function MQTT_Module
--[[	mqtt.client:close()		-	Closes connection to the broker.
	Syntax		-	mqtt:close()
	Parameters	-	none
	Returns		-	true on success, false otherwise
]]--

end

function MQTT_Module
--[[	mqtt.client:connect()	-	Connects to the broker specified by the given host, port, and secure options.
	Syntax		-	mqtt:connect(host(, port(, secure(, autoreconnect)))(, function(client)(, function(client, reason))))
	Parameters	-	host host, domain or IP (string)
					port broker port (number), default 1883
					secure 0/1 for false/true, default 0. Take note of constraints documented in the MQTT module.
					autoreconnect 0/1 for false/true, default 0
					function(client) callback function for when the connection was established
					function(client, reason) callback function for when the connection could not be established
		Returns
			true on success, false otherwise
			Connection failure callback reason codes:
			Constant 	Value 	Description
			mqtt.CONN_FAIL_SERVER_NOT_FOUND 	-5 	There is no broker listening at the specified IP Address and Port
			mqtt.CONN_FAIL_NOT_A_CONNACK_MSG 	-4 	The response from the broker was not a CONNACK as required by the protocol
			mqtt.CONN_FAIL_DNS 	-3 	DNS Lookup failed
			mqtt.CONN_FAIL_TIMEOUT_RECEIVING 	-2 	Timeout waiting for a CONNACK from the broker
			mqtt.CONN_FAIL_TIMEOUT_SENDING 	-1 	Timeout trying to send the Connect message
			mqtt.CONNACK_ACCEPTED 	0 	No errors. Note: This will not trigger a failure callback.
			mqtt.CONNACK_REFUSED_PROTOCOL_VER 	1 	The broker is not a 3.1.1 MQTT broker.
			mqtt.CONNACK_REFUSED_ID_REJECTED 	2 	The specified ClientID was rejected by the broker. (See mqtt.Client())
			mqtt.CONNACK_REFUSED_SERVER_UNAVAILABLE 	3 	The server is unavailable.
			mqtt.CONNACK_REFUSED_BAD_USER_OR_PASS 	4 	The broker refused the specified username or password.
			mqtt.CONNACK_REFUSED_NOT_AUTHORIZED 	5 	The username is not authorized.
]]--

end

function MQTT_Module
--[[	mqtt.client:lwt()	-	Setup Last Will and Testament (optional). A broker will publish a message with qos = 0, retain = 0, data = "offline" to topic "/lwt" if client does not send keepalive packet.
	Syntax		-	mqtt:lwt(topic, message(, qos(, retain)))
	Parameters	-	topic the topic to publish to (string)
					message the message to publish, (buffer or string)
					qos QoS level, default 0
					retain retain flag, default 0
	Returns		-	nil
]]--

end

function MQTT_Module
--[[	mqtt.client:on()	-	Registers a callback function for an event.
	Syntax		-	mqtt:on(event, function(client(, topic(, message))))
	Parameters	-	event can be "connect", "message" or "offline"
					function(client(, topic(, message))) callback function. The first parameter is the client. If event is "message", the 2nd and 3rd param are received topic and message (strings).					
	Returns			-	nil
]]--

end

function MQTT_Module
--[[	mqtt.client:publish()	-	Publishes a message.
	Syntax		-	mqtt:publish(topic, payload, qos, retain[, function(client)])
	Parameters	-	topic the topic to publish to (topic string)
					message the message to publish, (buffer or string)
					qos QoS level
					retain retain flag
					function(client) optional callback fired when PUBACK received. NOTE: When calling publish() more than once, the last callback function defined will be called for ALL publish commands.
	Returns		-	true on success, false otherwise
]]--

end

function MQTT_Module
--[[	mqtt.client:subscribe()		-	Subscribes to one or several topics.
	Syntax		-	mqtt:subscribe(topic, qos[, function(client)]) mqtt:subscribe(table[, function(client)])
	Parameters	-	topic a topic string
					qos QoS subscription level, default 0
					table array of 'topic, qos' pairs to subscribe to
					function(client) optional callback fired when subscription(s) succeeded. NOTE: When calling subscribe() more than once, the last callback function defined will be called for ALL subscribe commands.
	Returns		-	true on success, false otherwise
--	Example
				-- subscribe topic with qos = 0
				m:subscribe("/topic",0, function(conn) print("subscribe success") end)

				-- or subscribe multiple topic (topic/0, qos = 0; topic/1, qos = 1; topic2 , qos = 2)
				m:subscribe({["topic/0"]=0,["topic/1"]=1,topic2=2}, function(conn) print("subscribe succe
]]--

end

function MQTT_Module
--[[	mqtt.client:unsubscribe()	-	Unsubscribes from one or several topics.
	Syntax		-	mqtt:unsubscribe(topic[, function(client)]) mqtt:unsubscribe(table[, function(client)])
	Parameters	-	topic a topic string
					table array of 'topic, anything' pairs to unsubscribe from
					function(client) optional callback fired when unsubscription(s) succeeded. NOTE: When calling unsubscribe() more than once, the last callback function defined will be called for ALL unsubscribe commands.
	Returns		-	true on success, false otherwise
--	Example		-	-- unsubscribe topic
					m:unsubscribe("/topic", function(conn) print("unsubscribe success") end)

					-- or unsubscribe multiple topic (topic/0; topic/1; topic2)
					m:unsubscribe({["topic/0"]=0,["topic/1"]=0,topic2="anything"}, function(conn) print("unsubscribe success") end)
]]--

end

return MQTT_Module