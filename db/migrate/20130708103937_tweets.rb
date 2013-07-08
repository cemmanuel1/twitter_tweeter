class Tweets < ActiveRecord::Migration
  def change
    create_table :twitter_users do |t|
      t.string :username
    end

    create_table :tweets do |t|
      t.belongs_to :twitter_user
      t.string :text
      t.datetime :time
    end
  end
end
