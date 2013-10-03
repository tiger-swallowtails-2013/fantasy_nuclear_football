require 'tweetstream'

module TwitterStream

	def self.start
		TweetStream.configure do |config|
			config.consumer_key = ENV['TWITTER_CONSUMER_KEY']
			config.consumer_secret = ENV['TWITTER_CONSUMER_SECRET']
			config.oauth_token = ENV['TWITTER_OAUTH_TOKEN']
			config.oauth_token_secret = ENV['TWITTER_OAUTH_TOKEN_SECRET']
			config.auth_method = :oauth
		end

		all_politicians_twitter_handles = Politician.getAllTwitterHandles
		myTweets = TweetStore.new(Politician.getAllTwitterHandles)

		twitter_handles_sample = all_politicians_twitter_handles.sample(400)
		count = 1

		TweetStream::Client.new.track(twitter_handles_sample) do |status|
			myTweets.push(status.text)
			if(count >= 10)
				twitter_handles_sample = all_politicians_twitter_handles.sample(400)
				myTweets.compile_tweets
				count = 1;
			end
			count+=1
		end
	end

end
