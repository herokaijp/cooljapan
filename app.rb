require 'rubygems'
require 'sinatra'
require 'sass'
require 'coffee_script'

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
