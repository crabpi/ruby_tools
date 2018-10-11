require 'mqtt'
# Subscribe example
def sub(host,topic)
MQTT::Client.connect(host) do |c|
    # If you pass a block to the get method, then it will loop
    c.get(topic) do |topic,message|
      puts "#{topic}: #{message}"
    end
end
end
sub(ARGV[0],ARGV[1])