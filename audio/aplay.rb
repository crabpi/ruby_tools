#!/usr/bin/ruby
require 'rubygems'
require "open-uri"
require 'json'
require 'pp'

def say(text)
    ak="0DICOG3j6jKuazzU6OlNRiXS"
    sk="9r9GGVXlQgSO3SoubFrdiGDnEn4SFurn"
    uri = "https://openapi.baidu.com/oauth/2.0/token?grant_type=client_credentials&client_id=#{ak}&client_secret=#{sk}"
    html_response = nil
    open(uri) do |http|
        html_response = http.read
    end
    #puts html_response

    # json = File.read('input.json')
    obj = JSON.parse(html_response)
    at = obj["access_token"]
    # pp obj
    url = "http://tsn.baidu.com/text2audio?lan=zh&ctp=1&cuid=abcdxxx&tok=#{at}&tex=#{text}&vol=9&per=0&spd=5&pit=5&aue=3"
    sh = "./aplay.sh '#{url}'"
    IO.popen(sh) do |f|
        puts f.gets
    end
end
