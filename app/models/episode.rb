class Episode < ActiveRecord::Base
  belongs_to :show

  def to_s
    se = "S#{season_number.to_s.rjust(2, '0')}E#{episode_number.to_s.rjust(2, '0')}"
    "#{show.name} #{se}, \"#{name}\" (Aired: #{air_date})"
  end
end
