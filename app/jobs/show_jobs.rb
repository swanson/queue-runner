class ShowJobs
  def self.add_show(user, show_title, seen_all)
    tracker = ShowTracker.new(TraktTv.new)
    show = tracker.find_or_create_show(show_title)
    tracker.track_show(user, show, seen_all)
  end 
end