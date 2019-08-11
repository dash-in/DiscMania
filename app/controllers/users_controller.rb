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

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to users_path
  end

private
def user_params
    params.require(:user).permit(:handlename,:first_name,:last_name,:first_name_kana,:last_name_kana,:post_number,:address,:tel,
:email,:password)
end

end