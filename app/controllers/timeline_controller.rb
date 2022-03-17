class TimelineController < ApplicationController
  def index
    @accounts = Account.all
  end
end
