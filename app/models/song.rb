class Song < ActiveRecord::Base
  belongs_to :user
  
  GENRES = ["Rock", "Rap", "Punk", "Disco", "Hip Hop"]
  
  serialize :users_up_voted
  serialize :users_down_voted

end
