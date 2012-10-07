class Show < ActiveRecord::Base
  has_many :episodes

  has_and_belongs_to_many :users, :uniq => true, :join_table => 'user_shows'
end
