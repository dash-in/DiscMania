class CartItemsController < ApplicationController

  def index
  	@cart_item = Record.joins(:artist)
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

end

