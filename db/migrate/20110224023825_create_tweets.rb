class CreateTweets < ActiveRecord::Migration
  def self.up
    create_table :tweets do |t|
      t.string :content
      t.string :link
      t.datetime :published_at

      t.timestamps
    end
  end

  def self.down
    drop_table :tweets
  end
end
