require 'tweetstream'
require_relative '../../config/main'
require_relative './tweet_store'

TweetStream.configure do |config|
	config.consumer_key = 'tJVQjWUTMPIE15CETuTNZg'
	config.consumer_secret = 'HAs6b5DEcEsclHYuP81jexIgdDx9Hql0ENobTlVFgc'
	config.oauth_token = '50106246-PDgCqZC0rO4jQpWz6qOhiRJj5oMaW5KMzptSQ9XvB'
	config.oauth_token_secret = 'XaGTYwu0I3mtyYsiflDqCaXalJm6TBYzqdgt0fXG5c'
	config.auth_method = :oauth
end

all_politicians_twitter_handles = Politician.getAllTwitterHandles
myTweets = TweetStore.new(Politician.getAllTwitterHandles)

twitter_handles_sample = all_politicians_twitter_handles.sample(400)
count = 1

TweetStream::Client.new.track(twitter_handles_sample) do |status|
	myTweets.push(status.text)
	if(count >= 10)
		# twitter_handles_sample = all_politicians_twitter_handles.sample(400)
		puts "spit that shit out"
		myTweets.compile_tweets
		count = 1;
	end
	count+=1
end