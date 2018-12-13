require "xmlrpc/client"
require "pp"

# Make an object to represent the XML-RPC server.
server = XMLRPC::Client.new2( "http://localhost:1212")

# Call the remote server and get our result
puts server.call("sample.add", 2, 3)
puts server.call("sample.add", -2, 3)