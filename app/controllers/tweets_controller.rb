class TweetsController < ApplicationController
  def mentions
    @tweets = $client.mentions_timeline
    render json: @tweets 
  end


  def reply
  end

end
