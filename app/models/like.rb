class Like < ApplicationRecord
  belongs_to :account
  belongs_to :tweet
end
