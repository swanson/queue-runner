class ShowsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :use_api
  
  def new
  end

  def create
    tracker = ShowTracker.new(@trakt_api)

    show = tracker.find_or_create_show(params[:show][:title])
    tracker.track_show(current_user, show, params[:show][:add_all])

    flash[:notice] = "Added show - #{show.name}"
    redirect_to queue_index_path
  end

  def index
    @shows = current_user.shows.sort_by { |show| show.sort_name }
  end

  private 
  def use_api
    @trakt_api = TraktTv.new
  end 
end
