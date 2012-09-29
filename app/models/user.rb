class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_many :user_shows
  has_many :shows, :through => :user_shows

  has_many :user_watches

  def unwatched
    user_watches.where(:watched => false)
  end

  def watched
    user_watches.where(:watched => true)
  end
end
