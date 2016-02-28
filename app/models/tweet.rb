class Tweet < ActiveRecord::Base
  validates_length_of :text, maximum: 140
  validates :tweet_id,  :date, :user_name, :user_id, presence: true
  validates :tweet_id, :user_id, uniqueness: true, case_sensitive: false

  scope :recent, -> {order("date DESC").limit(20) } 

  def self.fetch_mentions(min_id)
    Tweet.order("date DESC").where(" tweet_id >= ? ", min_id).limit(20)
  end

  def self.store_tweets(tweets = [])
    tweets.each do |tweet|
      # don't save a tweet twice
      if Tweet.where(tweet_id: tweet.id.to_s).blank?
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
