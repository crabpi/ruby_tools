require "./mqtt.rb"
require "pp"
require "json"

host = "8266.fun"
topic = "oled"

class CB
    def call(text)
        pp JSON.parse text
    end
end

sub(host,topic,CB.new)
