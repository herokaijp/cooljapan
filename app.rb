require 'rubygems'
require 'sinatra'
require 'sass'
require 'coffee_script'

configure :development do
  require 'newrelic_rpm'
  require 'new_relic/rack/developer_mode'
  use NewRelic::Rack::DeveloperMode
end

configure :staging do
  use Rack::Auth::Basic do |username, password|
    username == ENV['BASIC_AUTH_USERNAME'] && password == ENV['BASIC_AUTH_PASSWORD']
  end
end

configure :production do
  require 'newrelic_rpm'
end

get '/' do
  erb :index
end

# assets
get '/css/application.css' do
  scss :application
end

get '/js/application.js' do
  coffee erb(:"application.coffee", :layout => false)
end

not_found do
  erb :not_found
end

helpers do
  def pusher_api_key
    ENV["RACK_ENV"] == "development" ? ENV["PUSHER_KEY"] : URI.parse(ENV["PUSHER_URL"]).user
  end
end

use Rack::Static, :urls => ["/images"], :root => "public"
