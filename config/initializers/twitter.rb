$twitter = Twitter::REST::Client.new do |config|
  config.consumer_key     = "your_consumer_key" 
  config.consumer_secret  = "your_consumer_secret"
  config.access_token     = "your_access_token"
  config.access_token_secret = "your_access_token_secret"
end


def twitter
  $twitter
end

