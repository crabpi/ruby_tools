require 'mqtt'
# Publish example
def pub(host,topic,message)
    MQTT::Client.connect(host) do |c|
        c.publish(topic,message)
    end
end
pub(ARGV[0],ARGV[1],ARGV[2])