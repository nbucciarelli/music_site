class DashboardController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    respond_to do |wants|
      wants.html
    end
  end
end
