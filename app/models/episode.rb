class Episode < ActiveRecord::Base
  belongs_to :show
  has_many :episode_links

  def to_s
    "#{production_number} - #{name}"
  end

  def production_number
    "S#{season_number.to_s.rjust(2, '0')}E#{episode_number.to_s.rjust(2, '0')}"
  end

  def airdate
    air_date.strftime("%b %d, %Y")
  end
end
