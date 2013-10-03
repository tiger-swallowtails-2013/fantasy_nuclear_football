require_relative '../../config/main.rb'

module TweetStore

	def self.compile_tweets

		db = ENV['REDIS']

		tweet_hash = {}
		entries = db.LLEN('twitter_mentions')
		entries.times do
			mention = db.LPOP('twitter_mentions')
			tweet_hash[mention.to_sym].nil? ? tweet_hash[mention.to_sym] = 1 : tweet_hash[mention.to_sym]+=1
		end

		db.flushall
		tweets = transform_for_database(tweet_hash)
		p tweets
		push_to_database(tweets)

	end

	def self.transform_for_database(tweet_hash)
		tweet_array = tweet_hash.to_a
		tweet_array.map do |entry|
			handle = entry[0].to_s[1..-1]
			pol = Politician.find_by twitter_id: handle
			entry[0] = pol.id
		end

		tweet_array
	end

	def self.push_to_database(tweet_array)
		tweet_array.each do |entry|
			score_entry = Score.find_by politician_id: entry[0]

			if score_entry
				score_entry.twitter_mentions += entry[1]
				score_entry.save
			else
				Score.create(politician_id: entry[0],
									twitter_mentions: entry[1], game_number: 1)
			end
		end
	end
end
