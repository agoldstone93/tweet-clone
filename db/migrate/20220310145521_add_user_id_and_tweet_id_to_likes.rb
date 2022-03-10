class AddUserIdAndTweetIdToLikes < ActiveRecord::Migration[6.1]
  def change
    add_column :likes, :user_id, :integer
    add_column :likes, :tweet_id, :integer
  end
end
