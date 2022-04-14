# frozen_string_literal: true

class ProfileController < ApplicationController
  before_action :authenticate_account!

  def index
    @tweets = Tweet.all
  end
end
