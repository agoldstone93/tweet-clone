class User < ApplicationRecord
  validates :username, :name, :password, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  has_many :tweets
  has_many :likes
end
