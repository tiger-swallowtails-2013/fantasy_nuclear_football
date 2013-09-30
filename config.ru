$LOAD_PATH.unshift(File.expand_path('./app'))

require 'controllers/index'
run Sinatra::Application
