class Playlist < ActiveRecord::Base
  
  belongs_to :user
  
  before_create :set_song_defaults
  
  serialize :song_ids
  

  
  def set_song_defaults
    self.song_ids = ['']
  end
  
  def self.songs_in(playlist)
    songs = []
    if playlist.song_ids
      playlist.song_ids.each do |playlist_song|
        songs << Song.find(playlist_song)
      end
    end
    songs
  end
  
end
