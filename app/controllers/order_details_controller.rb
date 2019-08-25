class OrderDetailsController < ApplicationController

    def update
        @order_detail = OrderDetail.find(params[:id])
        pre_quantity = @order_detail.quantity
        @order_detail.update(order_detail_params)
        post_quantity = @order_detail.quantity
        redirect_back(fallback_location: root_path)
        order = Order.find(@order_detail.order_id)
        order_details = OrderDetail.where(order_id: order.id)
        setting = Setting.find(1)
        total = 0
        order_details.each do |od|
            total = total + od.price
        end
        order.total_price = (total * setting.tax) + setting.shipping
        order.save
        delta = post_quantity - pre_quantity
        record = Record.find( @order_detail.record_id)
        record.stock = record.stock - delta
        record.save
    end

    private

    def order_detail_params
        params.require(:order_detail).permit(:record_id, :order_id, :quantity, :price, :unit_price)
    end

    def order_params
        params.require(:order).permit(:total_price)
    end

    

end
