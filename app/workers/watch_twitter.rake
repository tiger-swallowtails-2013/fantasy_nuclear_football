namespace :jobs do
	task :work => :environment do
		all_politician_twitter_ids = Politicians.all.twitter_id
	end
end