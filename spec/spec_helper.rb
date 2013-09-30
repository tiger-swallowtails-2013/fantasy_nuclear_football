$LOAD_PATH.unshift(File.expand_path('.'))
ENV['RACK_ENV'] = 'test'

require 'config/main'
require 'rack/test'

set :raise_errors, true
set :dump_errors, true
set :show_exceptions, false

module Spec
	include Rack::Test::Methods

	def app
		Sinatra::Application
	end

	Rspec.configure do |config|
		config.before do
			League.destroy_all
			Politician.destroy_all
			Team.destroy_all
			User.destroy_all
		end
	end
end