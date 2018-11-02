require "rb-inotify"

def task(file)
    notifier = INotify::Notifier.new
    notifier.watch(file, :modify,:create,:access,:attrib,:open) do |event|
        event.flags.each do |flag|
            ## convert to string
            puts "\n"
            puts Time.now
            flag = flag.to_s
            puts case flag
                when 'create' then "#{file} create" 
                when 'delete' then "#{file} delete"
                when 'attrib' then "#{file} attrib"
                when 'open' then "#{file} open"
                when 'access' then "#{file} read"
                when 'modify' then "#{file} modify"
                end
        end
    end
    notifier.run
end
task (ARGV.first)