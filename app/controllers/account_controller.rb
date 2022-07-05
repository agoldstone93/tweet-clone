class AccountController < ApplicationController
  before_action :authenticate_account!, only: [:following, :followers]

  def following
    @title = "Following"
    @account = Account.find(params[:id])
    @accounts = @account.following
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @account = Account.find(params[:id])
    @accounts = @account.followers
    render 'show_follow'
  end

  def show
    @account = Account.find(params[:id])
    @tweets = @account.tweets
  end
end