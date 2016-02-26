require 'rails_helper'

RSpec.describe TweetsController, type: :controller do

  describe "GET #mentions" do
    it "returns http success" do
      get :mentions
      expect(response).to have_http_status(:success)
    end
  
      
    it "returns list of mention list" do
      get :mentions
      
    end

  end

end
