class CartItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    @cart_item = CartItem.where(user_id: current_user.id )
    @setting = Setting.find(1)
    @sum = 0

    @stock_array = []
      @cart_item.each do |cart|
        cart.record.stock.times do |quantity|
          if quantity  < 20
            @stock_array << quantity +1
          else 
            break
          end
        end
      end


  end

  def create
    @stock_array = []
    @cart_item = CartItem.new(cart_item_params)
    @user = current_user
    @cart_item.user_id = current_user.id
    if @user
      if @cart_item.save
        flash[:success] = "カートに入れました！"
        redirect_back(fallback_location: root_url)
      end
    else
      redirect_to new_user_session_path
    end
  end

  def update
    @stock_array = []
       @cart_item = CartItem.find(params[:id])
       @cart_item.update(cart_item_params)
       redirect_back(fallback_location: root_url)
  end

  def show_update
  	@cart_item = CartItem.find_by(params[:id])
  	@quantity = @cart_item.quantity
  	@cart_item.quantity = @quantity + cart_item_params[:quantity].to_i
  	@cart_item.save
  	redirect_back(fallback_location: root_path)
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_back(fallback_location: root_path)
  end

  private
    def cart_item_params
      params.require(:cart_item).permit(:record_id, :quantity, :user_id)
    end

end

