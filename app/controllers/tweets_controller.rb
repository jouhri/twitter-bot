class TweetsController < ApplicationController
  def mentions
    @raw_data = mentions_timeline
    unless @error
      Tweet.store_tweets(@raw_data)
      @tweets = Tweet.fetch_mentions(params[:max_id])
      cookies[:max_id] = @tweets.last.tweet_id if @tweets && @tweets.last
      respond_to do |format|
        format.json {render json: @tweets}
        format.html {render partial: "tweets_list" } 
      end
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
    max_id = params[:max_id].blank? ? {} : { max_id: params[:max_id] } 

    begin
      twitter.mentions_timeline(max_id)
    rescue Twitter::Error::TooManyRequests => error
      @error = error
    end
  end


end
