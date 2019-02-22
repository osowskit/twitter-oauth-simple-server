require 'bundler/setup'

require 'sinatra'
require 'dotenv'
require 'oauth'
require 'twitter-ads'
require 'omniauth'
require 'omniauth-twitter'

include TwitterAds::Enum

configure :development do
  set :logging, Logger::DEBUG
end

Dotenv.load
ENV['OAUTH_DEBUG'] = 'true'

puts CONSUMER_KEY = ENV['KEY']
puts CONSUMER_SECRET = ENV['SECRET']

use Rack::Session::Cookie


use OmniAuth::Builder do
  provider :twitter, CONSUMER_KEY, CONSUMER_SECRET
end


get '/authorize' do
  puts request

  hash = { oauth_token: session[:token], oauth_token_secret: session[:token_secret]}
  request_token  = OAuth::RequestToken.from_hash(@consumer, hash)
  # For 3-legged authorization, flow oauth_verifier is passed as param in callback
  @access_token = @request_token.get_access_token(oauth_verifier: params[:oauth_verifier])
end

get '/auth/:provider/callback' do
  puts request.env['omniauth.auth']
end

post '/auth/:provider/callback' do
  puts request.env['omniauth.auth']
end

get '/' do
  <<-HTML
  <a href='/auth/twitter'>Sign in with Twitter</a>
  HTML
end
