class Playlist < ActiveRecord::Base
  
  belongs_to :user
  
  serialize :song_ids
  
  def self.songs_in(playlist)
    songs = []
    puts playlist.inspect
    if playlist.song_ids
      playlist.song_ids.each do |playlist_song|
        songs << Song.find(playlist_song)
      end
    end
    songs
  end
  
end
