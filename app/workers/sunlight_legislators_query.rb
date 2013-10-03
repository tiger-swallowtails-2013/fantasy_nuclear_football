$LOAD_PATH.unshift(File.expand_path('.'))
require 'config/main'

module CollectScoreData
	include Sidekiq::Worker

	def floor_update
		puts Congress.floor_updates
	end

end