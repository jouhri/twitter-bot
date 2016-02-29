require 'rails_helper'

RSpec::Matchers.define :have_mention do |mention|
  match do |tweets|
    !tweets.blank?  && tweets.all?{|tweet| tweet.text.include?(mention)}
  end
end



RSpec.describe TweetsController, type: :controller do

  describe "GET #mentions" do
    it "returns http success" do
      get :mentions
      expect(response).to have_http_status(:success)
    end
  
      
    it "returns list of mention " do
      get :mentions
      assigns(:tweets).should have_mention("@wall831") 
    end

    it "returns list of older mention after a second call" do
      get :mentions
      first_tweets = assigns(:tweets)
      get :mentions, max_id: first_tweets.last.id
      assigns(:tweets).should_not eql(first_tweets) 
    end
    
    it "returns empty list with invalid max_id " do
      get :mentions, max_id: 99999
      assigns(:tweets).to_a.should eql([]) 
    end


  end


  describe "POST #reply" do 
    it "returns http success" do
      post :reply
      expect(response).to have_http_status(:success)
    end

    it "reply to mention tweet" do
      get :mentions
      tweet = assigns(:tweets).first
      post :reply, tweet_id: tweet.tweet_id, text: "yo boby"
      assigns(:tweet).id.to_s  == tweet.tweet_id
    end

    it " should not reply to mention tweet with text over 140 character" do
      get :mentions
      tweet = assigns(:tweets).first
      post :reply, tweet_id: tweet.id, text: "a"*150
      tweet_response = json_response
      expect(tweet_response[:error]).to eql("Status is over 140 characters.")
    end

  end



end
