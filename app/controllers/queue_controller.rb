class QueueController < ApplicationController
  before_filter :authenticate_user!

  def index
    @unwatched = current_user.unwatched
    @watched = current_user.watched
    @shows = current_user.shows
  end

  def add_show
  end

  def check_availability
    @episode = Episode.find(params[:episode_id])
    @links = Ferrara.fetch_links(@episode.show.name, @episode.season_number, @episode.episode_number)

    respond_to do |wants|
      wants.js
    end
  end
end
