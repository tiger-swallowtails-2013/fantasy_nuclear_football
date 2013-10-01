$LOAD_PATH.unshift(File.expand_path('.'))
ENV['RACK_ENV'] = 'test'

require 'config/main'
require 'rack/test'
require 'shoulda-matchers'
require 'capybara/rspec'

Capybara.app = Sinatra::Application

set :raise_errors, true
set :dump_errors, true
set :show_exceptions, false

module Spec
	include Rack::Test::Methods

  def create_test_user
    User.create!(:firstname => 'srinivas',
            :lastname => 'rao',
            :username => 'raorao',
            :email => 'raorao@gmail.com',
            :facebook_id => '12345')
  end

	def app
		Sinatra::Application
	end
end
