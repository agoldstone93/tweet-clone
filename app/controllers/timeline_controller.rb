# frozen_string_literal: true

class TimelineController < ApplicationController
  def index
    @accounts = Account.all
    @tweets = Tweet.all
  end
end
