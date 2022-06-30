# frozen_string_literal: true

class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tweets
  has_many :likes

  # dependent: :destroy as destroying user should destroy relationship
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy

  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  # follows a user
  def follow(other_account)
    active_relationships.create(followed_id: other_account.id)
  end

  # unfollows a user
  def unfollow(other_account)
    active_relationships.find_by(followed_id: other_account.id).destroy
  end

  # checks if a user is following another user
  def following?(other_account)
    following.include?(other_account)
  end
end
