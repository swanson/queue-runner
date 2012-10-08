class Episode < ActiveRecord::Base
  belongs_to :show

  def to_s
    se = "S#{season_number.to_s.rjust(2, '0')}E#{episode_number.to_s.rjust(2, '0')}"
    "#{se} - #{name}"
  end
end
