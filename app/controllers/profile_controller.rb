class ProfileController < ApplicationController
  before_action :authenticate_account!

  def index
    @tweets = Tweet.all
  end
end
