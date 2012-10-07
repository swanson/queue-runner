class EpisodeFetcher
  def initialize(api)
    @api = api
  end

  def add_new_episodes(show)
    aired_episodes = @api.all_aired_episodes(show)
    aired_episodes.each do |result|
      episode = show.episodes.find(:first, :conditions => {
          :episode_number => result["episode"],
          :season_number => result["season"]
        })

      if episode.nil?
        new_episode = create_episode(show, result)
        add_to_unwatched_queues(show, new_episode)
      end
    end
  end

  private
  def create_episode(show, result)
    Episode.create(:show => show,
                   :name => result["title"], 
                   :season_number => result["season"],
                   :episode_number => result["episode"],
                   :air_date => Time.at(result["first_aired"]))
  end

  def add_to_unwatched_queues(show, episode)
    show.users.each do |user|
      user.user_watches << UserWatch.create(:user => user, 
                                            :episode => episode, 
                                            :watched => false)
      user.save
    end
  end
end