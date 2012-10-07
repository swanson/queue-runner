class ShowsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :use_api
  
  def new
  end

  def create
    tracker = ShowTracker.new(@trakt_api)

    show = tracker.find_or_create_show(params[:show][:title])
    tracker.track_show(current_user, show)

    flash[:notice] = "Added show - #{show.name}"
    redirect_to queue_index_path
  end

  private 
  def use_api
    @trakt_api = TraktTv.new
  end 
end
