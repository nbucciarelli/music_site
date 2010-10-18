class UsersController < ApplicationController
  before_filter :authenticate_user!
  
  respond_to :html, :json
  
  def index
    respond_with @users
  end
  
  def show
  end
  
  def new
  end
  
  def create
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
end
