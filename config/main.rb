$LOAD_PATH.unshift(File.expand_path('.'))
$LOAD_PATH.unshift(File.expand_path('./app/models/'))

require 'sinatra'
require 'sinatra/activerecord'
require 'dotenv'

require 'team'
require 'league'
require 'politician'
require 'user'

Dotenv.load

ENV['RACK_ENV'] == 'test' ? DB_NAME = 'fantasy_test' : DB_NAME = 'fantasy'
ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || "postgres://localhost/#{DB_NAME}")


set :views, Proc.new { File.join(File.expand_path('.'), "app/views") }

require 'omniauth'
require 'omniauth-facebook'

use OmniAuth::Builder do
  provider :facebook, ENV['FB_APP_ID'], ENV['FB_APP_SECRET']
end
