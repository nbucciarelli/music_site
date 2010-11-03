class Playlist < ActiveRecord::Base
  
  belongs_to :user
  
  before_create :set_song_defaults
  
  serialize :song_ids
  
  has_many :songs
  
  def set_song_defaults
    self.song_ids = ['']
  end
  
  def songs_in
    @songs = Song.where("id = ?")
  end
  
end
