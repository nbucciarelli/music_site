class SongsController < ApplicationController
  before_filter :authenticate_user!
  
  before_filter :find_song, :except => ['index', 'new', 'create']
  
  respond_to :html, :json
  
  def index
    @songs = Song.all
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
    @song = Song.new(params[:song])
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
  
private
  def find_song
    @song = Song.find(params[:id])
  end
end
