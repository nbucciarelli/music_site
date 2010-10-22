class DashboardController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @songs = Song.paginate :page => params[:page], :per_page => 10
    
    respond_to do |wants|
      wants.html
    end
  end
end
