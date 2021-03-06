class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me
  
  has_many :songs, :dependent => :destroy
  has_many :playlists, :dependent => :destroy
  
  serialize :songs_up_voted
  serialize :songs_down_voted
end
