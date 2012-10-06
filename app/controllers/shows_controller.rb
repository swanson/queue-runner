class ShowsController < ApplicationController
  before_filter :authenticate_user!
  
  def new
  end

  def create
    result = TraktTv.new.search(params[:show][:title]).first
    
    show = Show.where(:slug => result["tvdb_id"]).first
    
    if show.nil?
      show = Show.create(:name => result["title"], :slug => result["tvdb_id"])
    end

    current_user.shows << show

    flash[:notice] = "Added show - #{show.name}"
    redirect_to queue_index_path
  end
end
