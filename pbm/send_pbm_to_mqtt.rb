require "./pbm2arr.rb"
require "./mqtt.rb"

host = "8266.fun"
topic = "oled"

arr = pbm2arr(ARGV[0])
message = arr.to_s
pub(host,topic,message)
