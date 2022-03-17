class ProfileController < ApplicationController
  def index
    @tweets = Tweet.all
  end
end
