class ShowsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :use_api
  
  def new
  end

  def create
    show_title = params[:show][:title]
    seen_all = params[:show][:seen_all] == "on"

    ShowJobs.delay.add_show(current_user, show_title, seen_all)

    flash[:notice] = "Added show - #{params[:show][:title]}"
    redirect_to queue_index_path
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
