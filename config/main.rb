$LOAD_PATH.unshift(File.expand_path('.'))
$LOAD_PATH.unshift(File.expand_path('./app/models/'))
$LOAD_PATH.unshift(File.expand_path('./app/workers/'))

require 'sinatra'
require 'sinatra/activerecord'
require 'dotenv'

require 'team'
require 'politician'
require 'user'
require 'score'
require 'politician_team'
require 'sunlight_score'

require 'scrape_sunlight'
require 'add_sunlight_scores'
require 'twitter_stream'
require 'tweet_store'

require 'nokogiri'
require 'open-uri'

Dotenv.load

ENV['RACK_ENV'] == 'test' ? DB_NAME = 'fantasy_test' : DB_NAME = 'fantasy'
ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || "postgres://localhost/#{DB_NAME}")

set :public_dir, Proc.new { File.join(File.expand_path('.'), "public") }
set :views, Proc.new { File.join(File.expand_path('.'), "app/views") }

require 'omniauth'
require 'omniauth-facebook'

use OmniAuth::Builder do
  provider :facebook, ENV['FB_APP_ID'], ENV['FB_APP_SECRET']
end

require 'redis'
require 'uri'

if ENV['REDISTOGO_URL']
  uri = URI.parse(ENV['REDISTOGO_URL'])
  $redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
else
  $redis = Redis.new
end
