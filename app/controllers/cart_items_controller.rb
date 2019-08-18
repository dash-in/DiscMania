class CartItemsController < ApplicationController

  def index
  	@cart_item = CartItem.all
  end

  def create
    session[:cart_item] = [] unless session[:cart_item]
    session[:cart_item] << [record_id: params[:record_id], quantity: params[:quantity]]
    puts session[:cart_item]
    flash[:success] = "カートに追加しました！"
    redirect_back(fallback_location: root_url)

  end

  def update
  end

  def destroy


  end

  def cart_item
    params.require(:cart_item).permit(:record_id, :user_id, :quantity)
  end



end

