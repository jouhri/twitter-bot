require 'rails_helper'

RSpec.describe Tweet, type: :model do
  before(:each) do 
    @tweet = FactoryGirl.create :tweet
  end

  subject {@tweet}

  it {should respond_to(:tweet_id)}
  it {should validate_presence_of(:tweet_id)}
  it {should validate_uniqueness_of(:tweet_id).case_insensitive}

  it {should respond_to(:text)}
  it {should validate_length_of(:text).is_at_most(140)}

  it {should respond_to(:date)}
  it {should validate_presence_of(:date)}


  it {should respond_to(:user_name)}
  it {should validate_presence_of(:user_name)}

  it {should respond_to(:screen_name)}
  it {should validate_presence_of(:screen_name)}


  it {should respond_to(:user_id)}
  it {should validate_presence_of(:user_id)}

end
