class PlaylistsController < ApplicationController
  
  respond_to :html, :json
  
  before_filter :find_playlist, :except => ['index', 'new', 'create']
  before_filter :find_songs, :except => ['index', 'new', 'create']
  
  def index
    @playlists = current_user.playlists
  end
  
  def show
    respond_with @playlist
  end
  
  def new
    @playlist = Playlist.new
    respond_with @playlist
  end
  
  def create
    @playlist = current_user.playlists.build(params[:playlist])
    if @playlist.save
      flash[:notice] = "Successfully created a new playlist."
      respond_with @playlist, :location => playlists_path
    else
      flash[:alert] = "Failed to create a new playlist."
      render :action => :new
    end
  end
  
  def edit
    respond_with @playlist
  end
  
  def update
    if @playlist.update_attributes(params[:playlist])
      flash[:notice] = "Successfully updated playlist."
      respond_with @playlist, :location => playlists_path 
    else
      flash[:alert] = "Failed to update song."
      render :action => :edit
    end
  end
  
  def remove_song_from_playlist
    song = Song.find(params[:song_id])
    if @playlist.song_ids.include?(song.id)
      @playlist.song_ids.delete(song.id)
      @playlist.save!
      flash[:notice] = "Successfully removed '#{song.name}' from '#{@playlist.title}' playlist."
      respond_with @playlist, :location => playlist_path(@playlist)
    end
  end
  
  private
  
  def find_playlist
    @playlist = Playlist.find(params[:id])
  end
  
  def find_songs
    @songs = Playlist.songs_in(@playlist)
  end
  
end
