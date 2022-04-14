# frozen_string_literal: true

class TweetsController < ApplicationController
  before_action :authenticate_account!

  def index
    @tweets = Tweet.all
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = current_account.tweets.new(tweet_params)

    if @tweet.save
      redirect_to timeline_index_path
    else
      render :new, status: unprocessible_entity
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:content)
  end
end
