require 'sinatra'

class API < Sinatra::Base
  get '/' do
    'Hello world!'
  end
end
