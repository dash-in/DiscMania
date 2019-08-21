class Admin::OrdersController < ApplicationController
    before_action :set_order, only: [:show, :edit, :destroy]

    # GET /orders/1
    # GET /orders/1.json
    def show
    end

    # GET /orders/1/edit
    def edit
    end

    # PATCH/PUT /orders/1
    # PATCH/PUT /orders/1.json
    def update
        
    end

    def destroy
    end

    private
        # Use callbacks to share common setup or constraints between actions.
        def set_order
        @order = Order.find(params[:id])
        @order_details = OrderDetail.where(order_id = @order.id)
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
