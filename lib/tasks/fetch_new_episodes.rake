desc "Poll Trakt.tv API for new episodes"
task :fetch_new_episodes => :environment do
  api = TraktTv.new
  fetcher = EpisodeFetcher.new(api)

  Show.all.each do |show|
    fetcher.add_new_episodes(show)
  end

end
