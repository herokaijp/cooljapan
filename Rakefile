require "rubygems"
require "bundler/setup"
require "pusher"
require "tweetstream"

STDOUT.sync = true


TweetStream.configure do |config|
  config.consumer_key = ENV["TWITTER_CONSUMER_KEY"]
  config.consumer_secret = ENV["TWITTER_CONSUMER_SECRET"]
  config.oauth_token = ENV["TWITTER_OAUTH_TOKEN"]
  config.oauth_token_secret = ENV["TWITTER_OAUTH_TOKEN_SECRET"]
  config.auth_method = :oauth
  config.parser   = :yajl
end

task "jobs:work" do
  Pusher['tweets'].trigger('title', ENV["TWITTER_KEYWORD"])
  TweetStream::Client.new.track(ENV["TWITTER_KEYWORD"]) do |status|
    puts "%s: %s" % [ status[:user][:screen_name], status[:text] ]
    Pusher['tweets'].trigger('tweet', status)
  end
end

