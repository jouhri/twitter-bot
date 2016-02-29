class Tweet < ActiveRecord::Base
  validates_length_of :text, maximum: 140
  validates :tweet_id,  :date, :user_name, :screen_name, :user_id, presence: true
  validates :tweet_id, uniqueness: true, case_sensitive: false

  def self.fetch_mentions(max_id)
    unless max_id.blank?
      Tweet.order("tweet_id DESC").where(" tweet_id < ? ", max_id).limit(20)
    else
      Tweet.order("tweet_id DESC").limit(20)
    end
  end

  def self.store_tweets(tweets = [])
    tweets.each do |tweet|
      # don't save a tweet twice
      if Tweet.where(tweet_id: tweet.id.to_s).blank?
        Tweet.create(
          tweet_id: tweet.id.to_s,
          user_name: tweet.user.name,
          screen_name: tweet.user.screen_name,
          user_id: tweet.user.id.to_s,
          date: tweet.created_at, 
          text: tweet.text
        )  
      end
    end
  end

end
