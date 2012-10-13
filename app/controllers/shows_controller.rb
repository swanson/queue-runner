class ShowsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :use_api
  
  def new
  end

  def create
    tracker = ShowTracker.new(@trakt_api)
    show = tracker.find_or_create_show(params[:show][:title])

    seen_all = params[:show][:seen_all] == "on"
    tracker.track_show(current_user, show, seen_all)

    flash[:notice] = "Added show - #{show.name}"
    redirect_to queue_index_path
  end

  def index
    @watches = current_user.user_watches
                .group_by{|w| w.show}
                .sort_by{|k,v| k.sort_name}
  end

  private 
  def use_api
    @trakt_api = TraktTv.new
  end 
end
