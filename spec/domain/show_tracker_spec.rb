require "spec_helper"

describe ShowTracker do
  it "#track_show should add all episodes as unwatched" do
    show = Show.new
    show.episodes << Episode.new
    show.episodes << Episode.new

    user = User.new

    ShowTracker.track_show(user, show)
    
    user.shows.should include show
    user.unwatched.should have(2).items
  end

  it "#track_show should not add duplicate shows" do
    show = Show.new
    user = User.new

    ShowTracker.track_show(user,show)
    ShowTracker.track_show(user,show)

    user.shows.should have(1).items
  end
end