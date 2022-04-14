# frozen_string_literal: true

class AddAccountIdToTweets < ActiveRecord::Migration[6.1]
  def change
    add_column :tweets, :account_id, :integer
  end
end
