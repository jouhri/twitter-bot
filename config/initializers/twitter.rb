$twitter = Twitter::REST::Client.new do |config|
  config.consumer_key     = "8ibYQ1vhTyIgwwrprXLMGT0tZ" #"cQVZeos4bAmXTb5HnPROlw"
  config.consumer_secret  = "bzYqThbtMlRAmD7evSrttaXcAhe4Fh90OPunNPZrmYRRS49T78" # "UMBZ2ds0lSTKyLygddiPXlxqXGSxOyostSPSfsP2KI"
  config.access_token     = "182766751-gWRbZy6IJamzJ4b64e8JDGPirGw4F2NKdZCprPCq" # "182766751-w2eWOZnSGZrAkLo0fVp7in69QiaDgGcPCmdwOhOJ"
  config.access_token_secret = "xv5S4I7lZ0h8XvUF6APCILo6GJ05yEtImzBJwGrAfLPQp" # "Wo7OIxEsUl5Hu9omCBTRPOu2LDFmbWVyd0Wopqti4deFc"
end


def twitter
  $twitter
end

