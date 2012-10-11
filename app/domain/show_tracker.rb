class ShowTracker
  def initialize(api)
    @api = api
  end

  def track_show(user, show, should_add_all = false)
    return if user.shows.include? show

    user.shows << show
    
    if should_add_all
      add_all_episodes(user, show)
    end

    user.save
  end

  def find_or_create_show(show_title)
    result = @api.search(show_title).first
    show = Show.where(:slug => result["tvdb_id"]).first

    if show.nil?
      show = Show.create(:name => result["title"], 
                         :slug => result["tvdb_id"])
      create_aired_episodes(show)
    end

    show
  end

  private
  def add_all_episodes(user, show)
    show.episodes.each do |episode|
      user.user_watches << UserWatch.create(:user => user, 
                                            :episode => episode, 
                                            :watched => false)
    end
  end

  def create_aired_episodes(show)
    episode_result = @api.all_aired_episodes(show)

    episode_result.each do |result|
      next if result["first_aired"] == 0 
      show.episodes << Episode.create(:name => result["title"], 
                                      :season_number => result["season"],
                                      :episode_number => result["episode"],
                                      :air_date => Time.at(result["first_aired"]))
    end
  end
end