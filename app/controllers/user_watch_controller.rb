class UserWatchController < ApplicationController
  before_filter :authenticate_user!
  before_filter :get_user_watch

  def toggle_watched
    if @user_watch.nil?
      raise "Bad!"
    end

    @user_watch.toggle!(:watched)

    respond_to do |wants|
      wants.js {}
    end
  end

  private
  def get_user_watch
    @user_watch = current_user.user_watches.find_by_episode_id(params[:episode_id])
  end
end
