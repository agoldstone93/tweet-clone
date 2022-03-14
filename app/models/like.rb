class Like < ApplicationRecord
  validates :liked, default: false, null: false

  belongs_to :account
  belongs_to :tweet
end
