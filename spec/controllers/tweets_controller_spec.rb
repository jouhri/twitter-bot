require 'rails_helper'

RSpec::Matchers.define :have_mention do |mention|
  match do |tweets|
    tweets.all?{|tweet| tweet.text.include?(mention)}
  end
end



RSpec.describe TweetsController, type: :controller do

  describe "GET #mentions" do
    it "returns http success" do
      get :mentions
      expect(response).to have_http_status(:success)
    end
  
      
    it "returns list of mention list" do
      get :mentions
      assigns(:tweets).should have_mention("@wall831") 
    end

  end


  describe "POST #reply" do 
    it "returns http success" do
      post :reply
      expect(response).to have_http_status(:success)
    end
  end



end
