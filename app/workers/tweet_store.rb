require 'redis'
require 'tweetstream'

require_relative '../../config/main'

class TweetStore

	def initialize(search_terms)
		@twitter_handles = search_terms
		@db = Redis.new
	end

	def compile_tweets
		tweet_hash = {}
		@db.LLEN.times do
			mention = @db.LPOP('twitter_mentions')
			tweet_hash[mention.to_sym].nil? ? tweet_hash[mention.to_sym]+=1 : tweet_hash[mention.to_sym] = 1
		end
		puts tweet_hash
	end

	def filter_tweet(tweet_text)
		tweet_text.scan(/@\w+/)
	end

	def push(tweet)
		filter_tweet(tweet).each do |mention|
			if(@twitter_handles.include? mention)
				@db.RPUSH('twitter_mentions', mention)
				puts ("enter #{mention} into REDIS DB")
			end
		end
	end

end