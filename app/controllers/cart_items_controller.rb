class CartItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    @cart_item = CartItem.where(user_id: current_user.id )
    @setting = Setting.find(1)
    @sum = 0

    @stock_array = []
      @cart_item.each do |cart|
        cart.record.stock.times do |quantity|
          if quantity
            @stock_array << quantity
          else
            break
          end
        end
      end
  end

  def create 
    @cart_item = CartItem.new(cart_item_params)
    @user = current_user
    @cart_item.user_id = current_user.id
    if @user
      if @cart_item.save
         flash[:success] = "カートに追加されました"
         redirect_to cart_items_path
        if @cart_item.quantity == 0
           @cart_item.destroy
         else
          @cart_item.quantity >> 0
          @cart_item.save
        end
      end
    else
      redirect_to new_user_session_path
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])
     if  @cart_item.quantity == 0
         @cart_item.destroy
    else
        @cart_item.update(cart_item_params)
        redirect_to cart_items_path
        flash[:success] = "カート内容が変更されました"
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

