class Like < ApplicationRecord
  validates :liked, default: false, null: false

  belongs_to :user
  belongs_to :tweet
end
