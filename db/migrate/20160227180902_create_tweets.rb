class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :tweet_id, index: true
      t.string :user_name, default: ""
      t.string :screen_name, default: ""
      t.string :user_id
      t.string :text, default: "", limit: 140 # limit size of a tweet
      t.datetime :date

      t.timestamps null: false
    end
  end
end
