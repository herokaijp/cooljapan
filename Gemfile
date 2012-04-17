source 'https://rubygems.org'
gem 'sinatra'
gem 'sinatra-contrib'
gem 'sass'
gem 'coffee-script'
gem 'thin'
gem 'pusher'
gem "tweetstream", "1.1.3"
# TODO: at 1.1.4 raise error "undefined method `default_engine' for MultiJson:Module"
gem "clockwork"
gem "yajl-ruby"
gem "rake"

group :development do
  gem 'heroku'
  gem 'foreman'
end

group :development, :test do
  gem "rspec"
  gem 'rack-test'
  gem 'execjs'
  gem 'therubyracer'
end

group :production do
  gem 'newrelic_rpm'
end
