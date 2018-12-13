require 'xmlrpc/server'
s = XMLRPC::Server.new(1212)
class MyHandler
    def add(a, b)
        a+b
    end 
end 
s.add_handler("sample", MyHandler.new) 
trap("INT") { s.shutdown } 
s.serve