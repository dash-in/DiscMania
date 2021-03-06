class Admin::UsersController < ApplicationController

  def index
    @users = User.page(params[:page]).per(50)
  end

  def show
    @user = User.find(params[:id])
    @shippings = @user.shipping_infos.page(params[:shipping_page]).per(5)
    order_details = Order.where(user_id: params[:id]).includes(:order_details).map(&:order_details).flatten
    @order_details = Kaminari.paginate_array(order_details).page(params[:order_detail_page]).per(5)
    @setting = Setting.find(1)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       redirect_to admin_users_path
    else render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path
  end

private
  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :address, :post_number, :tel, :email, :password, :image, :handlename)
  end
end