require './app.rb'

run Rack::URLMap.new(
      '/'         => API,
    )