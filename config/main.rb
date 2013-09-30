$LOAD_PATH.unshift(File.expand_path('.'))
$LOAD_PATH.unshift(File.expand_path('./app/models/'))

require 'league'
require 'politician'
require 'user'

require 'sinatra'


ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || 'postgres://localhost/mydb')
