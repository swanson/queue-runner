class UserWatch < ActiveRecord::Base
  belongs_to :user
  belongs_to :episode

  def air_date
    episode.air_date
  end
end
