class UserWatch < ActiveRecord::Base
  belongs_to :user
  belongs_to :episode
end
