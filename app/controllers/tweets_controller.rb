class TweetsController < ApplicationController
  def fetch_mentions
    @raw_data = mentions_timeline
    @tweets = Tweet.store_tweets(@raw_data)
    
    render json: @tweets 
  end


  def mentions
    @tweets = Tweet.recent

    render json: @tweets 
  end

  def reply
  end

  private

  def mentions_timeline
    max_id = params.include?(:max_id) ? { max_id: params[:max_id] } : {} 

    twitter.mentions_timeline(max_id)
  end


end
