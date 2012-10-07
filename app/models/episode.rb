class Episode < ActiveRecord::Base
  belongs_to :show

  def to_s
    "#{show.name} S#{season_number}E#{episode_number}, \"#{name}\" (Aired: #{air_date})"
  end
end
