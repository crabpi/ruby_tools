require "mqtt"
require "pp"

def pub(host,topic,message)
    MQTT::Client.connect(host) do |c|
        c.publish(topic,message)
    end
end

def sub(host,topic,cb)
    MQTT::Client.connect(host) do |c|
        # If you pass a block to the get method, then it will loop
        c.get(topic) do |topic,message|
          cb.call("#{message.chomp}")
        end
    end
end