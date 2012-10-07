class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_many :user_shows
  has_many :shows, :through => :user_shows, :uniq => true

  has_many :user_watches

  def unwatched
    user_watches.where(:watched => false).sort_by {|u| u.air_date }
  end

  def watched
    user_watches.where(:watched => true)
  end
end
