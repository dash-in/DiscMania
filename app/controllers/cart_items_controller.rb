class CartItemsController < ApplicationController
	def index
		@cart_item = CartItem.find(params[:cart_item])
	end
end
