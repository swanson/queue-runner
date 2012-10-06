class ShowTracker

  def self.track_show(user, show)
    user.shows << show
    
    show.episodes.each do |episode|
      user.user_watches << UserWatch.create(:user => user, :episode => episode, :watched => false)
    end

    user.save
  end
end