FactoryGirl.define do 
  factory :tweet do 
    tweet_id {Faker::Number.number(10)}
    date {Faker::Date.between(2.days.ago, Date.today)}
    text {Faker::Hipster.sentence(3)}
    user_name {Faker::Name.name}
    user_id {Faker::Number.number(10)}
  end
end
