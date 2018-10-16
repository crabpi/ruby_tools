class IndexScreen < Sinatra::Base
    configure do
        set :root, File.dirname(__FILE__)
        set :views, Proc.new { File.join(root, "../templates") }
    end
    get '/' do
        erb :index
    end
end