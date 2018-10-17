require 'eventmachine'
require 'bertrem'

EM.run {
  client = BERTREM::Client.service('localhost', 9999, true)
  rpc = client.call.calc.add(6, 2)
  rpc.callback { |res|
    puts "Got response! -> #{res}"
  }

  rpc = client.call.calc.add(2, 2)
  rpc.callback { |res|
    puts "Got response! -> #{res}"
  }
}
