# frozen_string_literal: true

class AddTweetIdToLikes < ActiveRecord::Migration[6.1]
  def change
    add_column :likes, :tweet_id, :integer
  end
end
