class ShowsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :use_api
  
  def new
  end

  def create
    begin
      tracker = ShowTracker.new(@trakt_api)
      show = tracker.find_or_create_show(params[:show][:title])

      seen_all = params[:show][:seen_all] == "on"
      tracker.track_show(current_user, show, seen_all)

      flash[:notice] = "Added show - #{show.name}"
      redirect_to queue_index_path
    rescue
      # Since we hit third-party APIs in this action at the moment, rescue for safety
      flash[:alert] = "Yikes! Something went wrong."
      render :new
    end
  end

  def index
    @shows = current_user.shows.sort_by(&:sort_name)
  end

  def show
    @show = Show.find(params[:id])
    @watches = current_user.user_watches.joins(:episode).where("episodes.show_id" => @show.id)
  end

  private 
  def use_api
    @trakt_api = TraktTv.new
  end 
end
