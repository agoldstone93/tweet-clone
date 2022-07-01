# frozen_string_literal: true

class TimelineController < ApplicationController
  def index
    @accounts = Account.all
    @following = current_account.following if account_signed_in?
    @following_tweets = Tweet.where(account_id: @following)
  end
end
