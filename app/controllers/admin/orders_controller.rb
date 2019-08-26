class Admin::OrdersController < ApplicationController
    before_action :authenticate_admin!
    before_action :set_order, only: [:show, :edit, :update, :destroy]
    
    def index
        @orders = Order.page(params[:page]).per(50)
        @q = Order.ransack(params[:q])
        @orders = @q.result(distinct: true).order(:shipping_status, :receipt_status, :created_at)

    end

    def show
        @user = @order.user
        @setting = Setting.find(1)
    end

    def update
        @order.update(order_params)
        redirect_back(fallback_location: root_path)
    end

    def destroy
        @order.destroy
        redirect_to admin_orders_path
    end

    private
        # Use callbacks to share common setup or constraints between actions.
        def set_order
        @order = Order.find(params[:id])
        @order_details = OrderDetail.where(order_id: @order.id)
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def order_params
            params
            .require(:order)
            .permit(:payment_method, :shipping_info_id, :actual_shipping, :actual_tax, :total_price, :paid_at, :shipped_at, :receipt_status, :shipping_status)
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
