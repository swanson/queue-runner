class Show < ActiveRecord::Base
  has_many :episodes, :order => :air_date

  has_and_belongs_to_many :users, :uniq => true, :join_table => 'user_shows'

  def sort_name 
    self.name.sub(/^(the|a|an)\s+/i, '')
  end
end
