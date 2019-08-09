class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def deleting
  end

  def deleted
  end

  def edit
  	@user = User.find(params[:id])
  end

end