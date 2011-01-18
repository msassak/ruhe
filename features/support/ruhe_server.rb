require 'sinatra/base'

module Ruhe
  class Server < Sinatra::Base
    get '/' do
      <<EOJ
{
    "people": []
}
EOJ
    end

    post '/' do
      status 201
    end
  end
end
