require 'cgi'

class TraktTv
  def initialize
    @key = ENV['TRAKT_API_KEY']
  end

  def search(show_name)
    encoded_name = CGI::escape(show_name)
    url = "http://api.trakt.tv/search/shows.json/#{@key}/#{encoded_name}"
    Nestful.json_get(url)
  end

  def all_aired_episodes(show)
    url = "http://api.trakt.tv/show/seasons.json/#{@key}/#{show.slug}"
    seasons = Nestful.json_get(url)

    episodes = []
    seasons.each do |s|
      s_num = s['season']
      next if s_num == 0
      
      url = "http://api.trakt.tv/show/season.json/#{@key}/#{show.slug}/#{s_num}"
      episodes << Nestful.json_get(url)
    end

    episodes.flatten.select {|e| e['first_aired'] < Time.now.to_i}
  end
end