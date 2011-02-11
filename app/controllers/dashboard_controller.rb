class DashboardController < ApplicationController
  before_filter :authenticate_user!

  respond_to :html

  def index
    @songs = Song.paginate :page => params[:page], :per_page => 10
    respond_with @songs
  end

end
