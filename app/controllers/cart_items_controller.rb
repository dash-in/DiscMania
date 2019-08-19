class CartItemsController < ApplicationController

  def index
    @cart_item = CartItem.where("id > 1")
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @user = current_user
    @cart_item.user_id = current_user.id
      if @cart_item.save
        flash[:success] = "カートに入れました！"
      redirect_back(fallback_location: root_url)
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_back(fallback_location: root_url)
  end

  def show_update
  	@cart_item = CartItem.find(params[:id])
  	@quantity = @cart_item.quantity
  	@cart_item.quantity = @quantity + cart_item_params[:quantity].to_i
  	@cart_item.save
  	redirect_back(fallback_location: root_url)
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_item_path
  end

  private
    def cart_item_params
      params.require(:cart_item).permit(:record_id, :quantity)
    end


end

