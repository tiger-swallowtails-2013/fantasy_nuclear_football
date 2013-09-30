$LOAD_PATH.unshift(File.expand_path('.'))
$LOAD_PATH.unshift(File.expand_path('./app/models/'))

require 'league'
require 'politician'
require 'user'

require 'sinatra'
require 'sinatra/activerecord'

ENV['RACK_ENV'] == 'test' ? DB_NAME = 'fantasy_test' : DB_NAME = 'fantasy' 
ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || "postgres://localhost/#{DB_NAME}")
