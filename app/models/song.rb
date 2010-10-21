class Song < ActiveRecord::Base
  belongs_to :user
  
  GENRES = ["Rock", "Rap", "Punk", "Disco", "Hip Hop"]
  
end
