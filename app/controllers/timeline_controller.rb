class TimelineController < ApplicationController
  def index
    @users = User.all
    @accounts = Account.all
  end
end
