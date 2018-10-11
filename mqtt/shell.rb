require 'mqtt'
# Publish example

host = ARGV[0]
cmd_topic = ARGV[1]
state_topic = ARGV[2]

# Subscribe example
def shell(host,cmd_topic,state_topic)
    MQTT::Client.connect(host) do |c|
        # If you pass a block to the get method, then it will loop
        c.get(cmd_topic) do |topic,message|
            puts "#{topic}: #{message}"
            begin
		    IO.popen(message) do |f|
                        text=''
                        begin
		            line = f.gets
                            c.publish(state_topic,line)
                            text="#{text}\n#{line}"
		            #pub(host,state_topic,text)
                         end while line!=nil
                         c.publish(state_topic,"cmd_end")
                         #c.publish(state_topic,text)
                         puts text
		    end
             rescue
                    puts "error"
                    c.publish(state_topic,"error:#{$!} at:#{$@}")
             ensure
                  
             end
        end
    end
end

shell(host,cmd_topic,state_topic)
