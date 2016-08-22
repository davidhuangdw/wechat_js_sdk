require 'typhoeus'
require 'digest/sha1'
require 'sinatra'
require 'yaml'
require 'json'

def load_config path
  YAML.load(ERB.new(File.read(path)).result)
end

SETTINGS = load_config('config/settings.yml')

def signature
  response = Typhoeus.get("https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=#{SETTINGS['app_id']}&secret=#{SETTINGS['app_secret']}")
  token = JSON.parse(response.body)['access_token']
  response = Typhoeus.get("https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=#{token}&type=jsapi")
  ticket =  JSON.parse(response.body)['ticket']
  string1 = "jsapi_ticket=#{ticket}" +
    "&noncestr=#{SETTINGS['nonce_str']}" +
    "&timestamp=#{SETTINGS['timestamp']}" +
    "&url=#{SETTINGS['site_url']}"
  Digest::SHA1.hexdigest string1
end


class API < Sinatra::Base
  @@signature = signature

  get '/' do
    'Hello world!'
  end

  get '/wechat' do
    @signature = @@signature
    erb :wechat
  end

end
