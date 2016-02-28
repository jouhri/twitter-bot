class TweetsController < ApplicationController
  def mentions
    @raw_data = mentions_timeline
    unless @error
      Tweet.store_tweets(@raw_data)
      @tweets = Tweet.fetch_mentions(params[:min_id]||0)
      render json: @tweets 
    else
      render json: {error: @error.message}
    end
  end

  def reply
    unless params[:tweet_id].blank?
      begin
        @tweet = twitter.update(params[:text], in_reply_to_status_id: params[:tweet_id])
        render json: @tweet
      rescue Twitter::Error::Forbidden => error
        render json: {error: error.message}
      rescue Twitter::Error::Unauthorized => error
        render json: {error: error.message} 
      end  
    end
  end

  private

  def mentions_timeline
    max_id = params.include?(:max_id) ? { max_id: params[:max_id] } : {} 

    begin
      twitter.mentions_timeline(max_id)
    rescue Twitter::Error::TooManyRequests => error
      @error = error
    end
  end


end
