desc "Get streaming links for episodes"
task :fetch_episode_links => :environment do
  unlinked_episodes = Episode.includes(:episode_links).where("episode_links.id is null").limit(20)
  
  unlinked_episodes.each do |e|
    puts "Getting links for #{e.to_s}"
    links = Ferrara.fetch_links(e.show.name, e.season_number, e.episode_number)

    links.each do |source, link|
      next unless link

      EpisodeLink.create!(:episode_id => e.id, :url => link, :source => source)
    end
  end
end