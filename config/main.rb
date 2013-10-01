$LOAD_PATH.unshift(File.expand_path('.'))
$LOAD_PATH.unshift(File.expand_path('./app/models/'))

require 'sinatra'
require 'sinatra/activerecord'
require 'dotenv'

require 'team'
require 'politician'
require 'user'

Dotenv.load('.env')

ENV['RACK_ENV'] == 'test' ? DB_NAME = 'fantasy_test' : DB_NAME = 'fantasy'
ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || "postgres://localhost/#{DB_NAME}")
