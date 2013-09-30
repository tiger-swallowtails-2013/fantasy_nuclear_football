$LOAD_PATH.unshift(File.expand_path('./app'))

require './app/controllers/index'
run Sinatra::Application
