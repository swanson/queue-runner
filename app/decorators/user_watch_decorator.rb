class UserWatchDecorator < Draper::Base
  decorates :user_watch

  def show_name
    episode.show.name
  end

  def episode_name
    episode.to_s
  end

  def aired_on
    "Aired #{episode.air_date.stamp("Monday, Jan 01")}"
  end

  def episode_id
    episode.id
  end
end 
