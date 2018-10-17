require 'net/http'  
require 'uri'  
require 'json' 
class Poster
    def initialize(rpc_server)
        @@url = rpc_server
    end

    def send_data(url,hash_data)  
        uri = URI(url)
        req = Net::HTTP::Post.new(uri, 'Content-Type' => 'application/json')
        req.body = hash_data.to_json
        res = Net::HTTP.start(uri.hostname, uri.port) do |http|
            http.request(req).body
        end
    end

    def test
        payload = Hash["1" => "1", "2" => {},"3" => "3.0","4" => 1]
        send_data(@@url,payload)
    end
end

poster = Poster.new("http://10.10.11.17:6553")
puts poster.test