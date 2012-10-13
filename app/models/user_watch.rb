class UserWatch < ActiveRecord::Base
  belongs_to :user
  belongs_to :episode

  has_one :show, :through => :episode

  def air_date
    episode.air_date
  end

  def sort_key
    episode.production_number
  end
end
