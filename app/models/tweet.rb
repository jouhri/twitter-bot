class Tweet < ActiveRecord::Base

  scope :recent, -> {order("date DESC").limit(20) } 

  def self.store_tweets(tweets = [])
    tweets.each do |tweet|
      # don't save a tweet twice
      unless Tweet.where(tweet_id: tweet.id.to_s)
        Tweet.create(
          tweet_id: tweet.id.to_s,
          user_name: tweet.user.name,
          user_id: tweet.user.id.to_s,
          date: tweet.created_at, 
          text: tweet.text
        )  
      end
    end
  end

end
