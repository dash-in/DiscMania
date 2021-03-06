class CartItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    @cart_item = CartItem.where(user_id: current_user.id )
    @setting = Setting.find(1)
    @sum = 0
  end


  def create
    @cart_item = CartItem.new(cart_item_params)
    @user = current_user
    @cart_item.user_id = current_user.id
    if @user
      if @cart_item.save
         flash[:success] = "カートに追加されました"
        if   @cart_item.quantity == 0
             @cart_item.destroy
             redirect_to cart_items_path
        else @cart_item.quantity >> 0
             @cart_item.save
             redirect_to search_record_path
        end
      end
    else
      redirect_to new_user_session_path
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])
      @cart_item.update(cart_item_params)
        if   @cart_item.quantity == 0
             @cart_item.destroy
             redirect_to cart_items_path
        else @cart_item.quantity >> 0
             redirect_to cart_items_path
        end
  end

  # 一度消します
  # def show_update
  # 	@cart_item = CartItem.find_by(params[:id])
  # 	@quantity = @cart_item.quantity
  # 	@cart_item.quantity = @quantity + cart_item_params[:quantity].to_i
  # 	@cart_item.save
  #   flash[:success] = "カートに追加されました！"
  # 	redirect_to cart_items_path
  # end


  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end




  private
    def cart_item_params
      params.require(:cart_item).permit(:record_id, :quantity, :user_id)
    end
end

