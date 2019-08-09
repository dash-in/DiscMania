class UsersController < ApplicationController
  def deleting
  end

  def deleted
  end

  def edit
  	@user = User.find(params[:id])
  end

end