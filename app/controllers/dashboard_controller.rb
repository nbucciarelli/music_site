class DashboardController < ApplicationController
  def index
    respond_to do |wants|
      wants.html
    end
  end
end
