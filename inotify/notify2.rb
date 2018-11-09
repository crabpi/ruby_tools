require "rb-inotify"

def task(file)
    notifier = INotify::Notifier.new
    notifier.watch(file, :modify,:create,:access,:attrib,:open) do |event|
        event.flags.each do |flag|
            t = Time.now
            flag = flag.to_s
            puts case flag
                when 'create' then IO.popen("echo #{t} create >> log.#{file}") 
                when 'delete' then IO.popen("echo #{t} delete >> log.#{file}")
                when 'attrib' then IO.popen("echo #{t} attrib >> log.#{file}")
                when 'open' then IO.popen("echo #{t} open >> log.#{file}")
                when 'access' then IO.popen("echo #{t} read >> log.#{file}")
                when 'modify' then IO.popen("echo #{t} modify >> log.#{file}")
                end
        end
    end
    notifier.run
end
task (ARGV.first)