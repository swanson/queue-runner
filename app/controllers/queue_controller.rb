class QueueController < ApplicationController
  before_filter :authenticate_user!

  def index
    @unwatched = current_user.unwatched
    @watched = current_user.watched
    @shows = current_user.shows
  end

  def add_show

  end
end
