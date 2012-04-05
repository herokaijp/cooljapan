require 'rubygems'
require 'sinatra'
require 'sass'
require 'coffee_script'


configure :staging do
  use Rack::Auth::Basic do |username, password|
    username == ENV['BASIC_AUTH_USERNAME'] && password == ENV['BASIC_AUTH_PASSWORD']
  end
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

use Rack::Static, :urls => ["/images"], :root => "public"
