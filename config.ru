# Require config/environment.rb
require ::File.expand_path('../config/environment',  __FILE__)

set :app_file, __FILE__

configure do
  # See: http://www.sinatrarb.com/faq.html#sessions
  enable :sessions
  set :session_secret, ENV['SESSION_SECRET'] || 'this is a secret shhhhh'

  # Set the views to 
  set :views, File.join(Sinatra::Application.root, "app", "views")
end

YOUR_CONSUMER_KEY = '4lEg9YVMAFA2ivv0TypkhQ'
YOUR_CONSUMER_SECRET = 'NBKea5y7Wv5iLDBqSxTy3hsraMDBB64ptyKO74JE08'
YOUR_OAUTH_TOKEN = '897853014-TNQqRmL3mUAV2gS5y8GCwOqKxMDtfcFdtLDFrxcA'
YOUR_OAUTH_TOKEN_SECRET = 'OPNhWp9gm17GjxH4p4C2gD9jdUSEcbEPiGEy8VZX8'

Twitter.configure do |config|
  config.consumer_key = YOUR_CONSUMER_KEY
  config.consumer_secret = YOUR_CONSUMER_SECRET
  config.oauth_token = YOUR_OAUTH_TOKEN
  config.oauth_token_secret = YOUR_OAUTH_TOKEN_SECRET
end

run Sinatra::Application



