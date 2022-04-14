# frozen_string_literal: true

class AddNameAndUsernameToAccounts < ActiveRecord::Migration[6.1]
  def change
    add_column :accounts, :name, :string
    add_column :accounts, :username, :string
  end
end
