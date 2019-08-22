class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: [:show]

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.find(params[:id])
    @orders = Order.where(id: params[:id])
    @user = @order.user
    if @user != current_user
      redirect_to user_path(@user.id)
  end

  # GET /orders/new
  def new
    @order = Order.new
    # @order.actual_tax = Setting.find(1).tax
    # @order.actual_shipping = Setting.find(1).shipping
    @setting = Setting.find(1)
    @shipping = ShippingInfo.new
    @shippings = ShippingInfo.where(user_id: current_user)
    @incarts = CartItem.where(user_id: current_user)
    prices = 0
    @incarts.each do |incart|
      prices = prices + (incart.record.price * incart.quantity)
    end
    @total = prices
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @order.user_id = current_user.id
    @order.actual_shipping = Setting.find(1).shipping
    @order.actual_tax = Setting.find(1).tax
    @incarts = CartItem.where(user_id: current_user)
    @setting = Setting.find(1)

    prices = 0
    @incarts.each do |incart|
      prices = prices + (incart.record.price * incart.quantity)
    end
    @order.total_price = (prices * @setting.tax + @setting.shipping).floor
    
    if address_create[:address_create]=="true"
      # p true
      shipping_info = ShippingInfo.new(shipping_info_params)
      shipping_info.user_id = current_user.id
      shipping_info.save
      @order.shipping_name = shipping_info.name
      @order.shipping_post_num = shipping_info.post_number
      @order.shipping_address = shipping_info.address
      @order.shipping_info_id = shipping_info.id
    else
      # p false
      @order.shipping_name = ShippingInfo.find(@order.shipping_info_id).name
      @order.shipping_post_num = ShippingInfo.find(@order.shipping_info_id).post_number
      @order.shipping_address = ShippingInfo.find(@order.shipping_info_id).address
    end
    # binding.pry
    if @order.save
      @incarts.each do |incart|
        @order_detail = OrderDetail.new
        @order_detail.record_id = incart.record_id
        @order_detail.quantity = incart.quantity
        @order_detail.unit_price = incart.record.price
        @order_detail.order_id = @order.id
        @order_detail.price = @order_detail.unit_price * @order_detail.quantity
        @order_detail.save
        record = Record.find(@order_detail.record_id)
        record.stock = record.stock - @order_detail.quantity
        record.save
      end
      @incarts.destroy_all
      redirect_to orders_completed_path
    else
      render :new
    end
  end

  def completed
    @order = Order.where(user_id: current_user).last
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
        params
        .require(:order)
        .permit(:payment_method, :shipping_info_id, :actual_shipping, :actual_tax, :total_price)
    end

    def order_detail_params
      params
      .require(:order_detail)
      .permit(:record_id, :order_id, :quantity, :unit_price, :price)
    end

    def shipping_info_params
      params.require(:shipping_info).permit(:name, :post_number, :address)
    end

    def address_create
      params.permit(:address_create)
    end
end
