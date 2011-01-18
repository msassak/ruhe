require 'sinatra/base'

module Ruhe
  class Server < Sinatra::Base
    get '/' do
      <<EOJ
{
    "name": "Joey Joe-Joe Junior Shabadoo"
}
EOJ
    end
  end
end
