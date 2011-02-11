class SongsController < ApplicationController
  before_filter :authenticate_user!

  before_filter :find_song, :except => ['index', 'new', 'create', 'new_songs']

  respond_to :html, :json

  def index
    @songs = current_user.songs
    @playlists = current_user.playlists
    respond_with @songs
  end

  def show
    respond_with @song
  end

  def new
    @song = Song.new
    respond_with @song
  end

  def create
    @song = current_user.songs.build(params[:song])
    if @song.save
      flash[:notice] = "Successfully created a new song."
      respond_with @song, :location => songs_path
    else
      flash[:alert] = "Failed to create a new song."
      render :action => :new
    end
  end

  def edit
    respond_with @song
  end

  def update
    if @song.update_attributes(params[:song])
      flash[:notice] = "Successfully updated song."
      respond_with @song, :location => songs_path
    else
      flash[:alert] = "Failed to update song."
      render :action => :edit
    end
  end

  def destroy
    flash[:notice] = 'Successfully removed song.' if @song.delete
    respond_with @song
  end

  def new_songs
    @songs = Song.new_songs
    @playlists = current_user.playlists
    respond_with @songs
  end

  def user_upvote
    if @song.upvote(current_user)
      @song.save
      flash[:notice] = "Successfully voted for '#{@song.name}'."
    else
      flash[:alert] = "You have already voted for '#{@song.name}'."
    end
    respond_with @song, :location => root_path
  end

  def user_downvote
    if @song.downvote(current_user)
      @song.save
      flash[:notice] = "Successfully voted for '#{@song.name}'."
    else
      flash[:alert] = "You have already voted for this '#{@song.name}'."
    end
    respond_with @song, :location => root_path
  end

  def add_song_to_playlist
    if (playlist = Playlist.find(params[:playlist][:id]))
      playlist.song_ids << @song.id
      flash[:notice] = "Successfully added '#{@song.name}' to '#{playlist.title}' playlist"
      playlist.save!
    end
    respond_with playlist, :location => playlist_path(playlist)
  end

private
  def find_song
    @song = Song.find(params[:id])
  end

end
