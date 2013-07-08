class TwitterUser < ActiveRecord::Base
  has_many :tweets
  validates :username, uniqueness: true

  def fetch_tweets!
    tweets = Twitter.user_timeline(Twitter.user(self.username).id)[0..9]
    tweets.each do |tweet|
      self.tweets.create(text: tweet.text, time: tweet.created_at)      
    end
  end
end
