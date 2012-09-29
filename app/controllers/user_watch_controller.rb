class UserWatchController < ApplicationController
  before_filter :authenticate_user!
  before_filter :get_user_watch

  def toggle_watched
    unless authorized?(@user_watch)
      raise "Bad!"
    end

    @user_watch.toggle!(:watched)

    respond_to do |wants|
      wants.js {}
    end
  end

  private
  def get_user_watch
    @user_watch = UserWatch.find(params[:user_watch_id])
  end

  def authorized?(user_watch)
    return user_watch.user == current_user
  end
end
