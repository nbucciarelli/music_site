class Playlist < ActiveRecord::Base

  belongs_to :user

  serialize :song_ids

  before_create :set_playlist_defaults

  validates_uniqueness_of :song_ids

  def set_playlist_defaults
    self.song_ids = ['']
  end

  def self.songs_in(playlist)
    songs = []
    puts playlist.inspect
    if playlist.song_ids
      playlist.song_ids.each do |playlist_song|
        unless playlist_song == ''
          songs << Song.find(playlist_song)
        end
      end
    end
    songs
  end

  def uplist(song)
    songlist = self.song_ids
    a = songlist.index song
    b = a - 1
    songlist[a], songlist[b] = songlist [b], songlist[a]
  end

  def downlist(song)
    songlist = self.song_ids
    a = songlist.index song
    b = a + 1
    songlist[a], songlist[b] = songlist [b], songlist[a]
  end

end
